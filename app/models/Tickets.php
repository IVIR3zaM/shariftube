<?php
namespace Shariftube\Models;

class Tickets extends BaseModel
{
    public $user_id;
    public $title;
    public $status;
    public $modified_at;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->hasMany('id', 'Shariftube\Models\TicketReplays', 'ticket_id', ['alias' => 'Replays']);
    }
}