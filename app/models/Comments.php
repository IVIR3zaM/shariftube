<?php
namespace Shariftube\Models;

class Comments extends BaseModel
{
    public $user_id;
    public $content;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
    }
}
