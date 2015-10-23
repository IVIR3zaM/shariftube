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
}
