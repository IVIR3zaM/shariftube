<?php
namespace Shariftube\Models;

class Logs extends BaseModel
{
    public $user_id;
    public $uri;
    public $posts;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User', 'foreignKey' => ['allowNulls' => true]]);
    }
}