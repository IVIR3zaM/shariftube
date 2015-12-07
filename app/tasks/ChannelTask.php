<?php
namespace Shariftube\Tasks;

use Phalcon\CLI\Task;
use Shariftube\Models\Channels;
use Shariftube\Models\Videos;

class ChannelTask extends Task
{
    function infoAction()
    {
        set_time_limit(0);
        $channels = Channels::find(["uri = '' AND title != ''"]);
        $c = count($channels);
        echo "{$c} Unknown Channels Found\n";
        if ($c) {
            foreach($channels as $channel) {
                echo "try for chanel ($channel->title): ";
                $res = $this->callApi('search', [
                    'part' => 'snippet',
                    'q' => $channel->title,
                    'type' => 'channel',
                ]);

                $uri = '';
                if (isset($res->items) && !empty($res->items)) {
                    foreach ($res->items as $item) {
                        if ($item->id->kind == 'youtube#channel') {
                            $uri = $item->snippet->channelId;
                            break;
                        }
                    }
                }
                if (!$uri) {
                    echo "no channel id found\n";
                    continue;
                }
                echo "{$uri}\n";
                $channel->uri = $uri;
                $channel->save();
            }
        }
    }

    function updateAction()
    {
        set_time_limit(0);
        $channel = Channels::findFirst([
            "uri != ''",
            'order' => 'crawled_at ASC, id ASC',
        ]);
        if ($channel) {
            $pageToken = '';
            $page = 0;
            $pages = ceil($this->config->channels->limit/50);
            echo "Channel ($channel->title) Crawling - Max Pages={$pages}:\n";
            do{
                $page++;
                echo "Checking Page # {$page}:\n";
                $res = $this->callApi('search', [
                    'part' => 'snippet',
                    'channelId' => $channel->uri,
                    'maxResults' => 50,
                    'order' => 'viewCount',
                    'pageToken' => $pageToken,
                ]);
                $pageToken = '';
                if (!$res || !isset($res->items) || empty($res->items)) {
                    break;
                }
                if (isset($res->nextPageToken)) {
                    $pageToken = $res->nextPageToken;
                }
                foreach($res->items as $item) {
                    if ($item->id->kind == 'youtube#video') {
                        $uri = $item->id->videoId;
                        $video = Videos::findFirst([
                            "uri = :uri: AND channel_id = :channel:",
                            'bind' =>[
                                'uri' => $uri,
                                'channel' => $channel->getId(),
                            ],
                        ]);
                        if (!$video) {
                            $video = new Videos();
                            $video->channel_id = $channel->getId();
                            $video->uri = $uri;
                        }
                        $video->title = $item->snippet->title;
                        $video->description = ($item->snippet->description?$item->snippet->description:' ');
                        $video->thumbnail = $item->snippet->thumbnails->default->url;
                        $video->uploaded_at = date('Y-m-d H:i:s', strtotime($item->snippet->publishedAt));
                        $video->save();
                        echo "Video: $uri ({$video->title})\n";
                    }
                }
                echo "\n";
            } while($pageToken && $page<=$pages);
            $channel->crawled_at = date('Y-m-d H:i:s');
            $channel->save();
            echo "End\n";
        } else {
            echo "No Channels Found\n";
        }
    }

    function callApi($type = 'search', $params = array())
    {
        if (!is_array($params)) {
            $params = array();
        }
        $params['key'] = $this->config->channels->api_key;
        $url = $this->config->channels->api_url . $type . '?' . http_build_query($params);
        $data = $this->curl->get($url, 10, 1, [
            'No-Cache' => true,
        ]);
        try {
            return json_decode($data['content']);
        } catch (\Exception $e) {
            return false;
        }
    }
}