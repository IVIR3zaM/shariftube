<?php
namespace Shariftube\GateWays;

use Phalcon\Mvc\User\Component;
use Shariftube\Models\Purchases;

class Payline extends Component implements GateWay
{
    public function getParams(Purchases $purchase)
    {
        if ($purchase->key) {
            return false;
        }
        $content = $this->getDI()->getCurl()->get($this->getDI()->getConfig()->gateway->Payline->send_url, 20, 1, array(
            'Post' => [
                'api' => $this->getDI()->getConfig()->gateway->Payline->api_key,
                'amount' => $purchase->amount,
                'redirect' => $this->getDI()->getUrl()->getStatic([
                    'for' => 'shop',
                    'back' => 'Payline',
                ]),
            ],
        ));
        if (empty($content)) {
            return false;
        }
        if ($content['content'] > 0) {
            if (Purchases::find([
                'key = :key:',
                'bind' => [
                    'key' => $content['content'],
                ],
            ])->count()
            ) {
                return false;
            }
            return [
                'key' => $content['content'],
                'params' => '',
            ];
        } else {
            switch ($content['content']) {
                case '-1':
                    $error = '‫‪ api‬ارسالی با نوع ‪ api‬تعریف شده در ‪ payline‬سازگار نیست‬';
                    break;
                case '-2':
                    $error = '‫مقدار ‪ amount‬داده عددي نمی باشد و یا کمتر از 0001 ریال است‬';
                    break;
                case '-3':
                    $error = '‫مقدار ‪ redirect‬رشته ‪ null‬است‬';
                    break;
                case '-4':
                    $error = '‫ درگاهی با اطلاعات ارسالی شما یافت نشده و یا در حالت انتظار می باشد‬';
                    break;
                default:
                    $error = 'خطای ناشناخته. لطفا مجددا تلاش نمایید.';
                    break;
            }
            throw new \Exception($error);
        }
    }

    public function send(Purchases $purchase)
    {
        if (!$purchase->key || $purchase->status != 'Waiting') {
            return false;
        }
        $link = str_replace(':id_get:', $purchase->key, $this->getDI()->getConfig()->gateway->Payline->payment_url);
        $this->getDI()->getResponse()->redirect($link);
        return true;
    }

    public function back()
    {
        $error = 'خطای درگاه پی لاین: اطلاعات ارسال شده صحیح نمی باشند. با پشتیبانی تماس بگیرید.';
        $trans_id = $this->getDI()->getRequest()->getPost('trans_id');
        $id_get = $this->getDI()->getRequest()->getPost('id_get');
        if (!strlen($id_get) || !strlen($trans_id)) {
            throw new \Exception($error);
        }
        $purchase = Purchases::findFirst([
            "key LIKE :key:",
            'bind' => [
                'key' => $id_get,
            ],
        ]);
        if (!$purchase) {
            throw new \Exception($error);
        }
        if ($purchase->status == 'Success') {
            throw new \Exception('پرداخت شما قبلا انجام شده است.');
        }
        if ($purchase->status == 'Paid') {
            return $purchase;
        }
        if ($purchase->status == 'Cancelled') {
            throw new \Exception('پرداخت شما قبلا کنسل شده است. لطفا با پشتیبانی تماس بگیرید.');
        }
        if ($purchase->status != 'Waiting') {
            throw new \Exception($error);
        }
        $content = $this->getDI()->getCurl()->get($this->getDI()->getConfig()->gateway->Payline->back_url, 20, 1, array(
            'Post' => [
                'api' => $this->getDI()->getConfig()->gateway->Payline->api_key,
                'id_get' => $id_get,
                'trans_id' => $trans_id,
            ],
        ));
        if (empty($content)) {
            throw new \Exception('پرداخت شما تایید نشد. لطفا همین صفحه را رفرش کنید.');
        }
        if ($content['content'] > 0) {
            $purchase->params = $trans_id;
            $purchase->status = 'Paid';
            if ($purchase->save()) {
                return $purchase;
            } else {
                throw new \Exception('پرداخت شما تایید نشد. لطفا همین صفحه را رفرش کنید.');
            }
        } else {
            $set = false;
            switch ($content['content']) {
                case '-1':
                    $set = true;
                    $error = '‫‪‫ ‪ api‬ارسالی با نوع ‪ api‬تعریف شده در ‪ payline‬سازگار نیست‬‬';
                    break;
                case '-2':
                    $set = true;
                    $error = '‫‪ trans_id‬ارسال شده معتبر نمی باشد‬‬';
                    break;
                case '-3':
                    $set = true;
                    $error = '‫‫ ‪ id_get‬ارسالی معتبر نمی باشد‬';
                    break;
                case '-4':
                    $set = true;
                    $error = '‫چنین تراکنشی در سیستم وجود ندارد و یا موفقیت آمیز نبوده است‬‬';
                    break;
                default:
                    $error = 'خطای ناشناخته. لطفا مجددا تلاش نمایید.';
                    break;
            }
            if ($set) {
                $purchase->status = 'Cancelled';
                $purchase->save();
            }
            throw new \Exception($error);
        }
    }
}