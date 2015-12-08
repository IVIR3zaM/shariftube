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
    public $uri;
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
        if (Files::isProminent($this->uri)) {
            $size = ceil($this->size / 2);
        } else {
            $size = $this->size;
        }
        $server->used += $this->size;
        $server->remain -= $this->size;
        $server->save();

        $user = Users::findFirst([
            'id = :id:',
            'bind' => [
                'id' => $this->user_id,
            ],
        ]);
        if (empty($user) || $user->remain < $size) {
            throw new \Exception('LOW_BALANCE');
        } else {
            $user->used += $size;
            $user->remain -= $size;
            $user->save();
        }
    }

    public function beforeCreate()
    {
        parent::beforeCreate();
        while (Files::find([
            'deleted_at = 0 AND name = :name:',
            'bind' => [
                'name' => $this->name,
            ],
        ])->count()) {
            $this->name = md5(mt_rand() . uniqid()) . '.' . $this->type;
        }
        $server = $this->getServer();
        if (!$server) {
            return false;
        }
        $dir = date('Ymd', strtotime($this->created_at));
        if (!file_exists(APP_DIR . '/cache/files/' . $server->getId() . '/' . $dir)) {
            if (!file_exists(APP_DIR . '/cache/files/' . $server->getId())) {
                mkdir(APP_DIR . '/cache/files/' . $server->getId(), 0755);
                chmod(APP_DIR . '/cache/files/' . $server->getId(), 0755);
            }
            mkdir(APP_DIR . '/cache/files/' . $server->getId() . '/' . $dir, 0755);
            chmod(APP_DIR . '/cache/files/' . $server->getId() . '/' . $dir, 0755);
//            if (!$file->getServer()->mkdir($dir)) {
//                return false;
//            }
        }
    }

    public static function isProminent($link)
    {
        if (!preg_match('/v=(?P<code>[\w\-]+)$/', $link, $match)) {
            return false;
        }
        return Videos::count([
            "uri = :uri:",
            'bind' => [
                'uri' => $match['code'],
            ],
        ]) ? true : false;
    }

    public function setFailed()
    {
        if (!in_array($this->status, ['InProgress', 'Transferring'])) {
            return false;
        }
        $this->isFailed = true;
        $this->status = 'Failed';
        return true;
    }

    public function beforeUpdate()
    {
        if ($this->isFailed) {
            $server = $this->getServer();
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
                if (Files::isProminent($this->uri)) {
                    $size = ceil($this->size / 2);
                } else {
                    $size = $this->size;
                }
                $user->used -= $size;
                $user->remain += $size;
                $user->save();
            }
        }
    }
    public function beforeSave()
    {
        parent::beforeSave();
        if ($this->status == 'Success' && Files::isProminent($this->uri)) {
            $this->status = 'Prominent';
        }
    }

    public function getFinalLink()
    {
        if (!in_array($this->status, ['Success', 'Prominent'])) {
            return '#';
        }
        $server = $this->getServer();
        if (!$server) {
            return '#';
        }
        return $server->link . date('Ymd', strtotime($this->created_at)) . '/' . $this->name;
    }
}
