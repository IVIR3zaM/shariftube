<?php
namespace Shariftube\Websites;

use Phalcon\Mvc\User\Component;
use Shariftube\Models\Files;

class Youtube extends Component implements Website
{
    private $limit = 500000; // in bits

    public function getInfo($link = '')
    {
        if (!preg_match('/v=(?P<code>[\w\-]+)/', $link, $match)) {
            return false;
        }
        $data = $this->curl->get('https://www.youtube.com/watch?v=' . $match['code']);
        $data = $data['content'];
        if (!preg_match('/"url_encoded_fmt_stream_map"\s*:\s*"(?P<map>[^"]+)"/i', $data, $match)) {
            return false;
        }
        $urls = explode(',', str_replace('\u0026', '&', $match['map']));

        $title = "YouTube Video";
        if (preg_match('/\<title\>(?P<title>[^\<]+)/i', $data, $match)) {
            $title = preg_replace('/\s*\-\s*YouTube/i', '', $match['title']);
        }

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
            return true;
        }
        if (!$file->fetched) {
            $change = false;
            while (Files::find([
                'deleted_at = 0 AND id != :id: AND name = :name:',
                'bind' => [
                    'id' => $file->getId(),
                    'name' => $file->name,
                ],
            ])->count()) {
                $change = true;
                $file->name = md5(mt_rand() . uniqid()) . '.' . $file->type;
            }
            if ($change && !$file->save()) {
                return false;
            }
        }
        $dir = date('Ymd', strtotime($file->created_at));
        if (!file_exists(APP_DIR . '/cache/files/' . $this->getId() . '/' . $dir)) {
            if (!file_exists(APP_DIR . '/cache/files/' . $this->getId())) {
                mkdir(APP_DIR . '/cache/files/' . $this->getId(), 0755);
                chmod(APP_DIR . '/cache/files/' . $this->getId(), 0755);
            }
            mkdir(APP_DIR . '/cache/files/' . $this->getId() . '/' . $dir, 0755);
            chmod(APP_DIR . '/cache/files/' . $this->getId() . '/' . $dir, 0755);
        }
        if (file_exists(APP_DIR . '/cache/files/' . $this->getId() . '/' . $dir . '/' . $file->name)) {
            $file->fetched = filesize(APP_DIR . '/cache/files/' . $this->getId() . '/' . $dir . '/' . $file->name);
            if (!$file->save()) {
                return false;
            }
        }
        $fp = fopen(APP_DIR . '/cache/files/' . $this->getId() . '/' . $dir . '/' . $file->name, 'a');
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
        chmod(APP_DIR . '/cache/files/' . $this->getId() . '/' . $dir . '/' . $file->name, 0644);
        return true;
    }
}