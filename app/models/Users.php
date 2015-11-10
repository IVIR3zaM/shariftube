<?php
namespace Shariftube\Models;

class Users extends BaseModel
{
    public $email;
    public $password;
    public $role;
    public $name;
    public $status;
    public $referral_code;
    public $referral_id;
    public $quota;
    public $used;
    public $remain;
    public $deleted_at;
    public $modified_at;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('referral_id', 'Shariftube\Models\Users', 'id', ['alias' => 'Referral', 'foreignKey' => ['allowNulls' => true]]);
        $this->hasMany('id', 'Shariftube\Models\Files', 'user_id', ['alias' => 'Files']);
        $this->hasMany('id', 'Shariftube\Models\Purchases', 'user_id', ['alias' => 'Purchases']);
        $this->hasMany('id', 'Shariftube\Models\Incomes', 'user_id', ['alias' => 'Incomes']);
        $this->hasMany('id', 'Shariftube\Models\FailedLogins', 'user_id', ['alias' => 'FailedLogins']);
        $this->hasMany('id', 'Shariftube\Models\PasswordChanges', 'user_id', ['alias' => 'PasswordChanges']);
        $this->hasMany('id', 'Shariftube\Models\RememberTokens', 'user_id', ['alias' => 'RememberTokens']);
        $this->hasMany('id', 'Shariftube\Models\ResetPasswords', 'user_id', ['alias' => 'ResetPasswords']);
        $this->hasMany('id', 'Shariftube\Models\Tickets', 'user_id', ['alias' => 'Tickets']);
    }

    public function beforeValidationOnCreate()
    {
        $this->quota = $this->getDI()->getConfig()->application->sigunup_gift;
        $this->used = 0;
        $this->remain = $this->getDI()->getConfig()->application->sigunup_gift;
    }

    public function createReferralCode($id = 0)
    {
        if (!$id && $this->id) {
            $id = $this->id;
        }
        do {
            $referral_code = array();
            $chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
            for ($i = 0; $i < mt_rand(4,20); $i++) {
                $referral_code[$i] = $chars[mt_rand(0, strlen($chars) - 1)];
            }
            $referral_code = implode('', $referral_code);
        } while (Users::find([
            'referral_code = :referral_code: AND id != :id:',
            'bind' => [
                'referral_code' => $referral_code,
                'id' => $id,
            ],
        ])->count());
        return $referral_code;
    }
}
