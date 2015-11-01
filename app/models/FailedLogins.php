<?php
namespace Shariftube\Models;

class FailedLogins extends BaseModel
{
    public $user_id;
    public $ip_address;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
    }
}
