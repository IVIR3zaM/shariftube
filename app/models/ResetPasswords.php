<?php
namespace Shariftube\Models;

class ResetPasswords extends BaseModel
{
    public $user_id;
    public $code;
    public $created_at;

    public function ModelInitialize()
    {
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
    }

    public function ModelBeforeCreate()
    {
        do {
            $code = array();
            $chars = 'abcdef0123456789';
            for ($i = 0; $i < 32; $i++) {
                $code[$i] = $chars[mt_rand(0, strlen($chars) - 1)];
            }
            $code = implode('', $code);
        } while (ResetPasswords::find([
            'code = :code:',
            'bind' => [
                'code' => $code
            ],
        ])->count());
        $this->code = $code;
    }
}
