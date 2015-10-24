<?php
namespace Shariftube\Websites;

use Phalcon\Mvc\User\Component;

class Youtube extends Component implements Website
{
    public function getInfo($link = '')
    {
        if (!preg_match('/v=(?P<code>[\w\-]+)/', $link, $match)) {
            return false;
        }
        $data = $this->curl->get('http://www.youtube.com/get_video_info?video_id=' . $match['code']);
        $code = $match['code'];
        $data = $data['content'];
        parse_str($data, $data);
        if (!isset($data['url_encoded_fmt_stream_map'])) {
            return false;
        }
        $title = $tit = @$data['title'];
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
                    'name' => md5($code . $title . $itag) . '.' . $formats[$itag][0],
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

    public function getVideo($link = '')
    {

    }
}