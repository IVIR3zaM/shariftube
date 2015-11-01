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
    protected $gatewayObj;

    public function initialize()
    {
        parent::initialize();
        $this->belongsTo('user_id', 'Shariftube\Models\Users', 'id', ['alias' => 'User']);
        $this->belongsTo('package_id', 'Shariftube\Models\Packages', 'id', ['alias' => 'Package']);
        $this->hasMany('id', 'Shariftube\Models\Incomes', 'purchase_id', ['alias' => 'Incomes']);
    }

    private function initGateWay()
    {
        if (!$this->gatewayObj) {
            $gateway = '\\Shariftube\\GateWays\\' . $this->gateway;
            if (class_exists($gateway)) {
                $this->gatewayObj = new $gateway;
                if (!$this->gatewayObj) {
                    return false;
                }
            } else {
                return false;
            }
        }
        return true;
    }

    public function beforeValidationOnCreate()
    {
        if (!$this->initGateWay()) {
            return false;
        }
        $result = $this->gatewayObj->getParams($this);
        if (!$result) {
            return false;
        }
        $this->key = $result['key'];
        $this->params = $result['params'];
    }

    public function send()
    {
        if (!$this->initGateWay()) {
            return false;
        }
        if (!$this->gatewayObj->send($this)) {
            return false;
        }
        return true;
    }

    public function doPayment()
    {
        if ($this->status != 'Paid') {
            return false;
        }
        $package = $this->getPackage();
        $user = $this->getUser();
        if (empty($package) || empty($user)) {
            return false;
        }

        $transaction = $this->getDI()->getTransaction()->get();
        $user->setTransaction($transaction);
        $user->quota += $package->quota;
<<<<<<< HEAD
=======
        $user->remain += $package->quota;
>>>>>>> a898a344184b82791430e9bcd7c8508a952025a0
        if (!$user->save()) {
            $transaction->rollback();
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
            $income->setTransaction($transaction);
            if (!$income->save()) {
                $transaction->rollback();
                return false;
            }
        }

        if (!$this->save()) {
            $transaction->rollback();
            return false;
        }
        $transaction->commit();

        return true;
    }
}
