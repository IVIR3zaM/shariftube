<?php
namespace Shariftube\Models;

class Servers extends BaseModel
{
    public $hostname;
    public $username;
    public $password;
    public $quota;
    public $used;
    public $remain;
    public $enable;
    public $deleted_at;
    public $modified_at;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->hasMany('id', 'Shariftube\Models\Files', 'server_id', ['alias' => 'Files']);
    }

    public function beforeSave()
    {
        parent::beforeSave();
        if ($this->remain < 100 && $this->enable = 'Yes') {
            $this->enable = 'No';
        }
    }

    static public function getServer($quota = 0)
    {
        if ($quota > 0) {
            return Servers::findFirst([
                "deleted_at = 0 AND enable = 'Yes' AND remain >= :quota:",
                'bind' => [
                    'quota' => $quota,
                ],
            ]);
        }
        return null;
    }
}
