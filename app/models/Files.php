<?php
namespace Shariftube\Models;

class Files extends BaseModel
{
    public $user_id;
    public $server_id;
    public $website_id;
    public $name;
    public $label;
    public $quota;
    public $link;
    public $quality;
    public $deleted_at;
    public $modified_at;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('server_id', 'Shariftube\Models\Servers', 'id', ['alias' => 'Server']);
        $this->belongsTo('website_id', 'Shariftube\Models\Websites', 'id', ['alias' => 'Website']);
    }
    public function beforeCreate()
    {
        parent::beforeCreate();
        $server = $this->getServer();
        if (!empty($server)) {
            $server->used += $this->quota;
            $server->remain -= $this->quota;
            $server->save();
        }

        $user = $this->getUser();
        if (empty($user) || $user->quota < $this->quota) {
            return false;
        } else {
            $user->used += $this->quota;
            $user->remain -= $this->quota;
            $user->save();
        }
    }
}
