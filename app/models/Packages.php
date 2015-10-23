<?php
namespace Shariftube\Models;

class Packages extends BaseModel
{
    public $label;
    public $quota;
    public $price;
    public $status;

    public function initialize()
    {
        parent::initialize();
        $this->hasMany('id', 'Shariftube\Models\Purchases', 'package_id', ['alias' => 'Purchases']);
    }
}
