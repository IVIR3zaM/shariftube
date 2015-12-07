<?php
namespace Shariftube\Models;

class Videos extends BaseModel
{
    public $channel_id;
    public $uri;
    public $title;
    public $description;
    public $thumbnail;
    public $uploaded_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('channel_id', 'Shariftube\Models\Channels', 'id', ['alias' => 'Channel']);
    }

    public static function click(Users $user, Videos $video)
    {
        $channel = $video->getChannel();
        if (empty($channel) || empty($user)) {
            return false;
        }
        $impressions = Impressions::findFirst([
            "user_id = :user: AND channel_id = :channel:",
            'bind' => [
                'user' =>$user->getId(),
                'channel' =>$channel->getId(),
            ],
        ]);
        if (empty($impressions)) {
            $impressions = new Impressions();
            $impressions->user_id = $user->getId();
            $impressions->channel_id = $channel->getId();
            $impressions->clicks = 0;
        }
        $impressions->clicks++;
        return $impressions->save();
    }
    public static function getList(Users $user, $limit = 10, $base = 10)
    {
        $org_limit = $limit;
        if (empty($user)) {
            return false;
        }
        $channels = Channels::find(["uri != '' AND crawled_at != 0"]);
        if (empty($channels)) {
            return false;
        }
        $list = array();
        $cats = array();
        $cats_starts = array();
        $video_ids = array();
        $total = 0;
        foreach($channels as $channel) {
            $impressions = Impressions::findFirst([
                "user_id = :user: AND channel_id = :channel:",
                'bind' => [
                    'user' =>$user->getId(),
                    'channel' =>$channel->getId(),
                ],
            ]);
            if (empty($impressions)) {
                $impressions = new Impressions();
                $impressions->user_id = $user->getId();
                $impressions->channel_id = $channel->getId();
                $impressions->clicks = 0;
                $impressions->save();
            }
            $clicks = $base + $impressions->clicks;
            $total+=$clicks;
            $cats[$clicks][] = [$channel->getId(),$clicks];
            $cats_starts[$channel->getId()] = [-1];
        }
        if (!$total) {
            return false;
        }
        krsort($cats);
        $test = 0;
        do {
            foreach ($cats as $value) {
                shuffle($value);
                foreach($value as $tmp) {
                    $id = $tmp[0];
                    $clicks = $tmp[1];
                    $chance = ceil(($limit*$clicks)/$total);
                    $number = mt_rand(0, $chance);
                    $c = Videos::count([
                        "channel_id = :channel:",
                        'bind' => [
                            'channel' => $id,
                        ],
                    ]);
                    if ($number>$c) {
                        $number = $c;
                    }
                    if ($number<1) {
                        continue;
                    }
                    if ($c>$number*2) {
                        $rand = true;
                    } else {
                        $rand = false;
                    }
                    for ($i = 0; $i<$number; $i++) {
                        if ($limit<=0) {
                            break;
                        }
                        if ($rand) {
                            $start = mt_rand(0, $c-1);
                        } else {
                            $start = $i;
                        }
                        if (in_array($start, $cats_starts[$id])) {
                            continue;
                        }
                        $cats_starts[$id][] = $start;
                        $video = Videos::findFirst([
                            "channel_id = :channel:",
                            'bind' => [
                                'channel' => $id,
                            ],
                            'order' => 'id ASC',
                            'offset' => $start,
                        ]);
                        if (!empty($video)) {
                            $video_ids[] = $video->getId();
                            $list[] = $video;
                            $limit--;
                        }
                    }
                }
            }
            $test++;
        } while($test<$org_limit && $limit>0);

        if (count($list) < $org_limit) {
            $number = $org_limit - count($list);
            $c = Videos::count([
                "id NOT IN({ids:array})",
                'bind' => [
                    'ids' => $video_ids,
                ],
            ]);
            if ($c>0) {
                if ($number>$c) {
                    $number = $c;
                }
                if ($c>$number*2) {
                    $rand = true;
                } else {
                    $rand = false;
                }
                for ($i = 0; $i<$number; $i++) {

                    if ($rand) {
                        $start = mt_rand(0, $c - 1);
                    } else {
                        $start = $i;
                    }
                    $video = Videos::findFirst([
                        "id NOT IN({ids:array})",
                        'bind' => [
                            'ids' => $video_ids,
                        ],
                        'order' => 'id ASC',
                        'offset' => $start,
                    ]);
                    if (!empty($video)) {
                        $video_ids[] = $video->getId();
                        $list[] = $video;
                    }
                }
            }
        }
        return $list;
    }

    public static function prepareVideos($videos = array(), \Phalcon\Di\FactoryDefault $di)
    {
        $list = array();
        foreach ($videos as $video) {
            $item = array();
            $item['date'] = strtotime($video->uploaded_at);
            $item['link'] = vinixhash_encode('https://www.youtube.com/watch?v=' . $video->uri);
            $item['title'] = $video->title;
            $item['duration'] = 0;

            $item['website'] = 'Youtube';
            $item['description'] = $video->description;

            $item['image'] = '';
            $src = $video->thumbnail;
            if (substr($src, 0, 2) == '//') {
                $src = 'https:' . $src;
            }
            if (substr($item['image'], 0, 1) == '/') {
                $src = 'https://www.youtube.com' . $src;
            }
            if ($src) {
                $content = $di->getCurl()->get($src, 10, 1);
                if (@$content['head']['http_code'] == 200 && $content['content']) {
                    $item['image'] = 'data:' . @$content['head']['content_type'] . ';base64,' . urlencode(base64_encode($content['content']));
                }
                unset($content);
            }
            $list[] = (object)$item;
        }
        return $list;
    }
}
