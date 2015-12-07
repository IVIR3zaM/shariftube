<?php
namespace Shariftube\Models;

class Channels extends BaseModel
{
    public $uri;
    public $title;
    public $crawled_at;

    public function initialize()
    {
        parent::initialize();
        $this->hasMany('id', 'Shariftube\Models\Videos', 'channel_id', ['alias' => 'Videos']);
        $this->hasMany('id', 'Shariftube\Models\Impressions', 'channel_id', ['alias' => 'Impressions']);
    }
}
