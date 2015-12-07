<?php
namespace Shariftube\Curl;

use Phalcon\Cache\Backend\File as BackFile;
use Phalcon\Cache\Frontend\Output as FrontOutput;
use Phalcon\Mvc\User\Component;

class Curl extends Component
{
    private $frontCache;
    private $cache;

    public function __construct()
    {
        $this->frontCache = new FrontOutput(
            array(
                'lifetime' => $this->config->cli->curl_cache_lifetime,
            )
        );
        $this->cache = new BackFile(
            $this->frontCache,
            array(
                'cacheDir' => APP_DIR . '/cache/curl/'
            )
        );
    }

    public function get(
        $url = '',
        $timeout = 30,
        $reddirects = 5,
        $headers = array(),
        $onlyhead = false,
        $debug = false
    ) {
        if (!$url) {
            return false;
        }
        if (!is_array($headers)) {
            $headers = array();
        }
        if (isset($headers['No-Cache'])) {
            unset($headers['No-Cache']);
            $cache = false;
        } else {
            $cache = true;
        }
        if (isset($headers['Post'])) {
            if (is_array($headers['Post'])) {
                $post = array();
                foreach ($headers['Post'] as $i => $v) {
                    $i = urlencode($i);
                    $v = urlencode($v);
                    $post[] = "{$i}={$v}";
                }
                $post = implode('&', $post);
                $cache = false;
            } else {
                $post = false;
            }
            unset($headers['Post']);
        } else {
            $post = false;
        }
        $org_header = $headers;
        if (!isset($headers['Host'])) {
            $parse = parse_url($url);
            $headers['Host'] = $parse['host'];
        }
        if (!isset($headers['User-Agent'])) {
            $headers['User-Agent'] = 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)';
        }
        if (preg_match('/google\.com/', $url)) {
            $cookie = @unserialize(file_get_contents(APP_DIR . '/cache/google.cookie'));
            if (is_array($cookie)) {
                $list = array();
                foreach ($cookie as $name => $value) {
                    $list[] = "{$name}={$value}";
                }
                $list = implode('; ', $list);
                if ($list) {
                    $headers['Cookie'] = $list;
                }
            }
        }
        $theader = $keyHeads = array();
        foreach ($headers as $i => $v) {
            $theader[] = "{$i}: {$v}";
            if (strtolower($i) != 'cookie') {
                $keyHeads[] = "{$i}: {$v}";
            }
        }
        $valKey = $url . implode(',', $keyHeads) . ($onlyhead ? '1' : '0');
        $key = md5($valKey) . '.json';
        $result = $this->cache->get($key, $this->config->cli->curl_cache_lifetime);
        if ($result === null) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $theader);
            if ($onlyhead) {
                curl_setopt($ch, CURLOPT_NOBODY, 1);
            }
            curl_setopt($ch, CURLOPT_HEADER, 1);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            if (isset($headers['Range'])) {
                curl_setopt($ch, CURLOPT_BINARYTRANSFER, 1);
            }
            if ($post) {
                curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
            }
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
            curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
//    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
//    curl_setopt($ch, CURLOPT_MAXREDIRS, 5);

//            curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_SOCKS5);
//            curl_setopt($ch, CURLOPT_PROXY, '127.0.0.1:8080');

            $content = curl_exec($ch);
            $head = curl_getinfo($ch);
            curl_close($ch);
            if ($cache && ($onlyhead
                    || strpos($head['content_type'], 'text/html') !== false
                    || strpos($head['content_type'], 'image/') !== false
                )
            ) {
                $this->cache->save($key, json_encode([
                    'content' => base64_encode($content),
                    'head' => $head,
                ]));
            }
        } else {
            $result = json_decode($result, true);
            $content = base64_decode($result['content']);
            $head = $result['head'];
        }

        

        $true_head = substr($content, 0, $head['header_size']);
        $content = substr($content, $head['header_size']);
        if (preg_match('/google\.[\w]+/', $url) && preg_match('/ei\=(?P<ei>[\w]+)/', $head['redirect_url'], $match)) {
            file_put_contents(APP_DIR . '/cache/google.ei', $match['ei']);
        }
        
        preg_match_all('/Set\-Cookie\s*:\s*(?P<name>[^\=]+)\=(?P<value>[^\s\;]+)/i', $true_head, $match);
        if (!empty($match['name'])) {
            if (preg_match('/google\.[\w]+/', $url)) {
                $head['cookie'] = @unserialize(file_get_contents(APP_DIR . '/cache/google.cookie'));
                if (!is_array($head['cookie'])) {
                    $head['cookie'] = array();
                }
            } else {
                $head['cookie'] = array();
            }
            foreach($match['name'] as $i=>$value) {
                $head['cookie'][$value] = $match['value'][$i];
            }
            
            if (preg_match('/google\.[\w]+/', $url)) {
                file_put_contents(APP_DIR . '/cache/google.cookie', serialize($head['cookie']));
            }
        }
        if ($reddirects > 0 && preg_match('/\s+Location\s*:\s*(?P<url>(?:(?!\s).)+)\s+/i', $true_head, $match)) {
            $org_header['Referrer'] = $url;
            return $this->get(preg_replace('/google\.[\w]+/', 'google.com',$match['url']), $timeout, $reddirects - 1, $org_header, $onlyhead, $debug);
        }
        if (isset($head['url'])) {
            $url = $head['url'];
        }
        if ($debug) {
            echo "<h1>{$url}</h1>";
            var_export($head);
            echo $true_head;
            echo '<pre>' . htmlspecialchars($content) . '</pre>';
            exit;
        }
        return array('head' => $head, 'content' => $content, 'url' => $url);
    }
}
