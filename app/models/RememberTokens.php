<?php
namespace Shariftube\Models;

class RememberTokens extends BaseModel
{
    public $user_id;
    public $token;
    public $user_agent;
    public $created_at;

    public function ModelInitialize()
    {
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
    }

    public function ModelBeforeCreate()
    {
        do {
            $token = array();
            $chars = 'abcdef0123456789';
            for ($i = 0; $i < 32; $i++) {
                $token[$i] = $chars[mt_rand(0, strlen($chars) - 1)];
            }
            $token = implode('', $token);
        } while (RememberTokens::find([
            'token = :token:',
            'bind' => [
                '$token' => $token
            ],
        ])->count());
        $this->token = $token;
    }
}
