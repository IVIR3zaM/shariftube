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

    public function ModelInitialize()
    {
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('server_id', 'Shariftube\Models\Servers', 'id', ['alias' => 'Server']);
        $this->belongsTo('website_id', 'Shariftube\Models\Websites', 'id', ['alias' => 'Website']);
    }
    public function ModelBeforeCreate()
    {
        $server = $this->getServer()->getFirst();
        if (!empty($server)) {
            $server->used += $this->quota;
            $server->remain -= $this->quota;
            $server->save();
        }

        $user = $this->getUser()->getFirst();
        if (empty($user) || $user->quota < $this->quota) {
            return false;
        } else {
            $user->used += $this->quota;
            $user->remain -= $this->quota;
            $user->save();
        }
    }
}
