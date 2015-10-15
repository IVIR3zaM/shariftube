<?php
namespace Shariftube\Models;

class Purchases extends BaseModel
{
    public $user_id;
    public $package_id;
    public $amount;
    public $gateway;
    public $key;
    public $params;
    public $status;
    public $deleted_at;
    public $modified_at;
    public $created_at;

    public function ModelInitialize()
    {
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('package_id', 'Shariftube\Models\Packages', 'id', ['alias' => 'Package']);
    }

    public function doPayment()
    {
        if ($this->status != 'Paid') {
            return null;
        }
        $package = $this->getPackage()->getFirst();
        $user = $this->getUser()->getFirst();
        if (empty($package) || empty($user)) {
            return false;
        }
        $user->quota += $package->quota;
        if (!$user->save()) {
            return false;
        }
        $this->status = 'Success';
        return $this->save();
    }
}
