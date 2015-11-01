<?php
namespace Shariftube\GateWays;

use Shariftube\Models\Purchases;

interface GateWay
{
    public function getParams(Purchases $purchase);
    public function send(Purchases $purchase);
    public function back();
}