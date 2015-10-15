<?php
namespace Shariftube\Models;

class PasswordChanges extends BaseModel
{
    public $user_id;
    public $ip_address;
    public $user_agent;
    public $created_at;

    public function ModelInitialize()
    {
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
    }
}
