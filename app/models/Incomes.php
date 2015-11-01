<?php
namespace Shariftube\Models;

class Incomes extends BaseModel
{
    public $user_id;
    public $purchase_id;
    public $percentage;
    public $amount;
    public $deleted_at;
    public $modified_at;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('purchase_id', 'Shariftube\Models\Purchases', 'id', ['alias' => 'Purchase']);
    }
    public function beforeCreate()
    {
        parent::beforeCreate();
        $purchase = $this->getPurhase();
        if (!empty($purchase) || $purchase->status != 'Paid') {
            return false;
        }
    }
}
