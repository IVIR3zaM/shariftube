<?php
namespace Shariftube\Models;

class Impressions extends BaseModel
{
    public $user_id;
    public $channel_id;
    public $clicks;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('channel_id', 'Shariftube\Models\Channels', 'id', ['alias' => 'Channel']);
    }
}
