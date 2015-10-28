<?php
namespace Shariftube\Models;

class Files extends BaseModel
{
    public $user_id;
    public $server_id;
    public $website_id;
    public $name;
    public $type;
    public $label;
    public $size;
    public $link;
    public $quality;
    public $is_3d;
    public $fetched;
    public $status;
    public $locked_at;
    public $deleted_at;
    public $modified_at;
    public $created_at;
    protected $isFailed = false;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('server_id', 'Shariftube\Models\Servers', 'id', ['alias' => 'Server']);
        $this->belongsTo('website_id', 'Shariftube\Models\Websites', 'id', ['alias' => 'Website']);
    }
    public function beforeValidationOnCreate()
    {
        $server = Servers::getServer($this->size);
        if (!$server) {
            throw new \Exception('NO_SERVER');
        }
        $this->server_id = $server->getId();
        $server->used += $this->size;
        $server->remain -= $this->size;
        $server->save();

        $user = Users::findFirst([
            'id = :id:',
            'bind' => [
                'id' =>$this->user_id,
            ],
        ]);
        if (empty($user) || $user->remain < $this->size) {
            throw new \Exception('LOW_BALANCE');
        } else {
            $user->used += $this->size;
            $user->remain -= $this->size;
            $user->save();
        }
    }
    public function setFailed()
    {
        if (!in_array($this->status,['InProgress', 'Transfering'])) {
            return false;
        }
        $this->isFailed = true;
        $this->status = 'Failed';
        return true;
    }
    public function beforeUpdate()
    {
        if ($this->isFailed) {
            $server = Servers::getServer($this->size);
            if (!$server) {
                return false;
            }
            $server->used -= $this->size;
            $server->remain += $this->size;
            $server->save();

            $user = $this->getUser();
            if (empty($user)) {
                return false;
            } else {
                $user->used -= $this->size;
                $user->remain += $this->size;
                $user->save();
            }
        }
    }
}
