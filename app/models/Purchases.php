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

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('package_id', 'Shariftube\Models\Packages', 'id', ['alias' => 'Package']);
        $this->hasMany('id', 'Shariftube\Models\Incomes', 'purchase_id', ['alias' => 'Incomes']);
    }

    public function doPayment()
    {
        if ($this->status != 'Paid') {
            return null;
        }
        $package = $this->getPackage();
        $user = $this->getUser();
        if (empty($package) || empty($user)) {
            return false;
        }
        $user->quota += $package->quota;
        if (!$user->save()) {
            return false;
        }
        $this->status = 'Success';

        $percentage = intval($this->getDI()->getConfig()->application->affiliate_percentage);
        if ($percentage > 0 && $percentage < 100) {
            $income = new Incomes();
            $income->user_id = $user->getId();
            $income->purchase_id = $this->getId();
            $income->percentage = $percentage;
            $income->amount = intval(($this->amount * $percentage) / 100);
            if (!$this->save()) {
                return false;
            }
        }

        return $this->save();
    }
}
