<?php
function get_url($url = '', $headers = array(), $onlyhead = false, $debug = false)
{
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
        $cookie = @unserialize(file_get_contents(APP_DIR.'/cache/google.cookie'));
        if (is_array($cookie)) {
            $list = array();
            foreach($cookie as $name => $value) {
                $list[] = "{$name}={$value}";
            }
            $list = implode('; ', $list);
            if($list) {
                $headers['Cookie'] = $list;
            }
        }
    }
    $theader = array();
    foreach ($headers as $i => $v) {
        $theader[] = "{$i}: {$v}";
    }
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
//    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
//    curl_setopt($ch, CURLOPT_MAXREDIRS, 5);
    $content = curl_exec($ch);
    $head = curl_getinfo($ch);
    curl_close($ch);
    if ($debug) {
        echo "<h1>{$url}</h1>";
        echo '<pre>' . htmlspecialchars($content) . '</pre>';
        exit;
    }
    $true_head = substr($content, 0, $head['header_size']);
    if (preg_match('/\s+Location\s*:\s*(?P<url>(?:(?!\s).)+)\s+/i', $true_head, $match)) {
        $org_header['Referrer'] = $url;
        return get_url($match['url'], $org_header, $onlyhead, $debug);
    } else {
        $content = substr($content, $head['header_size']);
    }
    if (preg_match('/google\.com/', $url) && preg_match('/Set\-Cookie\s*:\s*(?P<name>[^\=]+)\=(?P<value>[^\s\;]+)/i', $true_head, $match)) {
        $cookie = @unserialize(file_get_contents(APP_DIR.'/cache/google.cookie'));
        if (!is_array($cookie)) {
            $cookie = array();
        }
        $cookie[$match['name']] = $match['value'];
        file_put_contents(APP_DIR.'/cache/google.cookie', serialize($cookie));
    }
    if (isset($head['url'])) {
        $url = $head['url'];
    }
    return array('head' => $head, 'content' => $content, 'url' => $url);
}