<?php
namespace Shariftube\Curl;

use Phalcon\Cache\Backend\File as BackFile;
use Phalcon\Cache\Frontend\Output as FrontOutput;

class Curl
{
    private $frontCache;
    private $cache;

    public function __construct()
    {
        $this->frontCache = new FrontOutput(
            array(
                'lifetime' => 900
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
        $result = $this->cache->get($key, 900);
        if ($result === null) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $theader);
            if ($onlyhead) {
                curl_setopt($ch, CURLOPT_NOBODY, 1);
            }
            curl_setopt($ch, CURLOPT_HEADER, 1);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
            curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
//    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
//    curl_setopt($ch, CURLOPT_MAXREDIRS, 5);
            $content = curl_exec($ch);
            $head = curl_getinfo($ch);
            curl_close($ch);
            if ($onlyhead
                || strpos($head['content_type'], 'text/html') !== false
                || strpos($head['content_type'], 'image/') !== false
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

        if ($debug) {
            echo "<h1>{$url}</h1>";
            var_dump($head);
            echo '<pre>' . htmlspecialchars($content) . '</pre>';
            exit;
        }

        $true_head = substr($content, 0, $head['header_size']);
        if ($reddirects > 0 && preg_match('/\s+Location\s*:\s*(?P<url>(?:(?!\s).)+)\s+/i', $true_head, $match)) {
            $org_header['Referrer'] = $url;
            return $this->get($match['url'], $timeout, $reddirects - 1, $org_header, $onlyhead, $debug);
        } else {
            $content = substr($content, $head['header_size']);
        }
        if (preg_match('/google\.com/',
                $url) && preg_match('/Set\-Cookie\s*:\s*(?P<name>[^\=]+)\=(?P<value>[^\s\;]+)/i',
                $true_head, $match)
        ) {
            $cookie = @unserialize(file_get_contents(APP_DIR . '/cache/google.cookie'));
            if (!is_array($cookie)) {
                $cookie = array();
            }
            $cookie[$match['name']] = $match['value'];
            file_put_contents(APP_DIR . '/cache/google.cookie', serialize($cookie));
        }
        if (isset($head['url'])) {
            $url = $head['url'];
        }
        return array('head' => $head, 'content' => $content, 'url' => $url);
    }
}