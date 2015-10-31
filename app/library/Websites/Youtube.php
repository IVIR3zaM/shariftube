<?php
namespace Shariftube\Websites;

use Phalcon\Mvc\User\Component;
use Shariftube\Models\Files;

class Youtube extends Component implements Website
{
    private $limit = 50000; // in bits

    public function __construct()
    {
        $this->limit = $this->getDI()->getConfig()->website->Youtube->size_limit;
    }

    public function getInfo($link = '')
    {
        $t = array (
            'dur' => '287.834',
            'expire' => '1446297223',
            'fexp' => '9408710,9414764,9416126,9417707,9422596',
            'id' => '222d1bbb23d15f8b',
            'initcwndbps' => '288750',
            'ip' => '107.182.226.168',
            'ipbits' => '0',
            'itag' => '22',
            'key' => 'yt6',
            'lmt' => '1387395680552619',
            'mime' => 'video/mp4',
            'mm' => '31',
            'mn' => 'sn-a8au-naje',
            'ms' => 'au',
            'mt' => '1446275558',
            'mv' => 'm',
            'pcm2cms' => 'yes',
            'pl' => '25',
            'ratebypass' => 'yes',
            'requiressl' => 'yes',
            'signature' => '08CD02F798612D71D5DFC2404A2D283E845D6036.37010BB6391B44BA53B98D85FC29CDD94912364D',
            'source' => 'youtube',
            'sparams' => 'dur,id,initcwndbps,ip,ipbits,itag,lmt,mime,mm,mn,ms,mv,pcm2cms,pl,ratebypass,requiressl,source,upn,expire',
            'sver' => '3',
            'upn' => 'CrLrSXVowII',
        );
        $td = array (
            'c' => 'web',
            'clen' => '3950783',
            'cpn' => 'IxNkMLXD-S6iJQMM',
            'cver' => 'as3',
            'gir' => 'yes',
            'initcwndbps' => '92500',
            'ip' => '107.182.226.168',
            'ipbits' => '0',
            'keepalive' => 'yes',
            'nh' => 'IgpwcjA0Lm9yZDEyKg8xOTkuMjI5LjIzMS4yMzM',
            'range' => '884736-1327103',
        );
        $t2 = array (
            'c' => 'web',
            'clen' => '3950783',
            'cpn' => 'IxNkMLXD-S6iJQMM',
            'cver' => 'as3',
            'dur' => '287.662',
            'expire' => '1446296547',
            'fexp' => '9406001,9407053,9407155,9408509,9408710,9414764,9415435,9415521,9416126,9416729,9417707,9418356,9419789,9419966,9420933,9421145,9421647,9421912,9422150,9422358,9422491,9422596',
            'gir' => 'yes',
            'id' => '222d1bbb23d15f8b',
            'initcwndbps' => '92500',
            'ip' => '107.182.226.168',
            'ipbits' => '0',
            'itag' => '134',
            'keepalive' => 'yes',
            'key' => 'yt6',
            'lmt' => '1387395661236878',
            'mime' => 'video/mp4',
            'mm' => '31',
            'mn' => 'sn-vgqsenes',
            'ms' => 'au',
            'mt' => '1446274898',
            'mv' => 'm',
            'nh' => 'IgpwcjA0Lm9yZDEyKg8xOTkuMjI5LjIzMS4yMzM',
            'pl' => '25',
            'range' => '884736-1327103',
            'ratebypass' => 'yes',
            'requiressl' => 'yes',
            'signature' => 'ADE3A62ADEDCEDD77B1F7BF1F4F67B7BB8E10E78.3B9D97293DA6D6A1C08254BFE8104433CD7ED174',
            'source' => 'youtube',
            'sparams' => 'clen,dur,gir,id,initcwndbps,ip,ipbits,itag,keepalive,lmt,mime,mm,mn,ms,mv,nh,pl,requiressl,source,upn,expire',
            'sver' => '3',
            'upn' => 'ScxkZjuSfpU',
        );
//        ksort($t);
//        ksort($t2);
////        var_export($t);exit;
//        var_export($t2);exit;
        if (!preg_match('/v=(?P<code>[\w\-]+)/', $link, $match)) {
            return false;
        }
        $data = $this->curl->get('https://www.youtube.com/watch?v=' . $match['code']);
        $data = $data['content'];
        $pos = stripos($data, 'watch_as3.swf');
        if ($pos === false){
            return false;
        }

        $test = true;
        $player = array();
        do {
            $char = substr($data, --$pos, 1);
            if ($char == '"' && substr($data, $pos-1, 1) != '\\') {
                $test = false;
            } else {
                $player[] = $char;
            }
        } while($test);
        krsort($player);
        $player = str_replace('\\/', '/', implode('', $player)) . 'watch_as3.swf';

        if (!preg_match('/"url_encoded_fmt_stream_map"\s*:\s*"(?P<map>[^"]+)"/i', $data, $match)) {
            return false;
        }
        $urls = explode(',', str_replace('\u0026', '&', $match['map']));


//        if (!preg_match('/signature\=(?P<signature>[a-z0-9\.]+)/i', $data, $match)) {
//            return false;
//        }
//        $signature = $match['signature'];


        $title = "YouTube Video";
        if (preg_match('/\<title\>(?P<title>[^\<]+)/i', $data, $match)) {
            $title = html_entity_decode(preg_replace('/\s*\-\s*YouTube/i', '', $match['title']));
        }

        $data = array();
        foreach ($urls as $url) {
            parse_str($url, $match);
            if (!isset($match['url'], $match['itag'])) {
                continue;
            }
            $data[$match['itag']] = $match['url'].'&signature='.$match['s'];
        }
        $formats = array(
            5 => ['flv', '240p', 0],
            17 => ['3gp', '144p', 0],
            18 => ['mp4', '360p', 0],
            22 => ['mp4', '720p', 0],
            36 => ['3gp', '240p', 0],
            43 => ['webm', '360p', 0],
            82 => ['mp4', '360p', 1],
            83 => ['mp4', '240p', 1],
            84 => ['mp4', '720p', 1],
            85 => ['mp4', '1080p', 1],
            100 => ['webm', '360p', 1],
        );
        $videos = array();
        foreach ($data as $itag => $url) {
            if (isset($formats[$itag])) {
                $size = 0;
                $content = $this->curl->get($url, 20, 1, array(
                    'Referer' => $player
                ), true);
                if (isset($content['head']['download_content_length'])) {
                    $size = intval($content['head']['download_content_length']);
                }
                var_dump($content);exit;
                $videos[] = array(
                    'type' => $formats[$itag][0],
                    'size' => $size,
                    'label' => $title,
                    'link' => $url,
                    'quality' => $formats[$itag][1],
                    'is_3d' => $formats[$itag][2],
                );

            }
        }
        return ['records' => $videos, 'label' => $title];
    }

    /*public function getInfo($link = '')
    {
        if (!preg_match('/v=(?P<code>[\w\-]+)/', $link, $match)) {
            return false;
        }
        $data = $this->curl->get('http://www.youtube.com/get_video_info?video_id=' . $match['code']);
        $data = $data['content'];
        parse_str($data, $data);
        if (!isset($data['url_encoded_fmt_stream_map'])) {
            return false;
        }
        $title = @$data['title'];
        if (!$title) {
            $title = "YouTube Video";
        }
        $urls = explode(',', $data['url_encoded_fmt_stream_map']);
        $data = array();
        foreach ($urls as $url) {
            parse_str($url, $match);
            if (!isset($match['url'], $match['itag'])) {
                continue;
            }
            $data[$match['itag']] = $match['url'];
        }
        $formats = array(
            5 => ['flv', '240p', 0],
            17 => ['3gp', '144p', 0],
            18 => ['mp4', '360p', 0],
            22 => ['mp4', '720p', 0],
            36 => ['3gp', '240p', 0],
            43 => ['webm', '360p', 0],
            82 => ['mp4', '360p', 1],
            83 => ['mp4', '240p', 1],
            84 => ['mp4', '720p', 1],
            85 => ['mp4', '1080p', 1],
            100 => ['webm', '360p', 1],
        );
        $videos = array();
        foreach ($data as $itag => $url) {
            if (isset($formats[$itag])) {
                $size = 0;
                $content = $this->curl->get($url, 20, 1, array(), true);
                if (isset($content['head']['download_content_length'])) {
                    $size = intval($content['head']['download_content_length']);
                }
                $videos[] = array(
                    'type' => $formats[$itag][0],
                    'size' => $size,
                    'label' => $title,
                    'link' => $url,
                    'quality' => $formats[$itag][1],
                    'is_3d' => $formats[$itag][2],
                );

            }
        }
        return ['records' => $videos, 'label' => $title];
    }*/
    public function getVideo(Files $file)
    {
        $endSize = ($file->size - 1);
        if ($file->fetched >= $endSize) {
            return null;
        }
        $dir = date('Ymd', strtotime($file->created_at));
        $server = $file->getServer();
        if (!$server) {
            return false;
        }

        if (file_exists(APP_DIR . '/cache/files/' . $file->name)) {
            $file->fetched = filesize(APP_DIR . '/cache/files/' . $file->name);
            if (!$file->save()) {
                return false;
            }
        }
        $fp = fopen(APP_DIR . '/cache/files/' . $file->name, 'ab');
        if (!$fp) {
            return false;
        }
        if (!flock($fp, LOCK_EX | LOCK_NB)) {
            return null;
        }
        do {
            $start = $file->fetched;
            $end = $start + $this->limit - 1;
            if ($end > $endSize) {
                $end = $endSize;
            }
            $content = $this->curl->get($file->link, 9999, 1, array('Range' => "bytes={$start}-{$end}"));
            if (@substr($content['head']['http_code'], 0, 2) != '20') {
                fclose($fp);
                return false;
            }
            fwrite($fp, $content['content']);

            $file->fetched = $end + 1;
            $file->save();

            if ($end == $endSize) {
                break;
            }
        } while (1);
        fclose($fp);
        rename(APP_DIR . '/cache/files/' . $file->name,
            APP_DIR . '/cache/files/' . $server->getId() . '/' . $dir . '/' . $file->name);
        chmod(APP_DIR . '/cache/files/' . $server->getId() . '/' . $dir . '/' . $file->name, 0644);
        return true;
    }
}