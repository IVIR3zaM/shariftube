<?php
namespace Shariftube\Models;

class TicketReplays extends BaseModel
{
    public $ticket_id;
    public $user_id;
    public $content;
    public $modified_at;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('user_id', 'Shariftube\Models\Tickets', 'id', ['alias' => 'Ticket']);
    }
    public function beforeCreate()
    {
        parent::beforeCreate();
        $ticket = $this->getTicket();
        if (!$ticket) {
            return false;
        }
        $ticket->modified_at = date('Y-m-d H:i:s');
        return $ticket->save();
    }
}