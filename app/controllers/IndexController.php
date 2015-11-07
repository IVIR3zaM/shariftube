<?php
namespace Shariftube\Controllers;

use Phalcon\Http\Response;
use Phalcon\Mvc\Model\Resultset;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use PHPHtmlParser\Dom;
use Shariftube\Models\Announcements;
use Shariftube\Models\Files;
use Shariftube\Models\Incomes;
use Shariftube\Models\Packages;
use Shariftube\Models\PasswordChanges;
use Shariftube\Models\Purchases;
use Shariftube\Models\ResetPasswords;
use Shariftube\Models\Servers;
use Shariftube\Models\TicketReplays;
use Shariftube\Models\Tickets;
use Shariftube\Models\Users;
use Shariftube\Models\Websites;

/**
 * Display the default index page.
 */
class IndexController extends ControllerBase
{
    public function initialize()
    {
        $date = new \jDateTime(true, true, 'Asia/Tehran');
        $this->view->date = $date;
        if ($this->auth->getIdentity()) {
            $time = time();

            if ($this->auth->getIdentity()->role == 'Admin') {
                $tickets = Tickets::find([
                    'status IN ({status:array})',
                    'bind' => [
                        'status' => ['Open', 'Replay', 'InProgress'],
                    ],
                    'order' => 'modified_at DESC',
                ])->count();
            } else {
                $tickets = Tickets::find([
                    'user_id = :user: AND status IN ({status:array})',
                    'bind' => [
                        'user' => $this->auth->getIdentity()->getId(),
                        'status' => ['Answered'],
                    ],
                    'order' => 'modified_at DESC',
                ])->count();
            }
            $this->view->open_tickets = $tickets;
            $this->view->announcements = Announcements::find([
                'order' => 'created_at DESC',
                'limit' => 4
            ]);

            $this->view->referral_count = Users::findByReferralId($this->auth->getIdentity()->getId())->count();
            $this->view->total_incomes = Incomes::sum([
                'column' => 'amount',
                'conditions' => 'user_id = :user_id: AND deleted_at = 0',
                'bind' => [
                    'user_id' => $this->auth->getIdentity()->getId(),
                ],
            ]);

            $this->view->month_incomes = Incomes::sum([
                'column' => 'amount',
                'conditions' => 'user_id = :user_id: AND created_at BETWEEN :start: AND :end: AND deleted_at = 0',
                'bind' => [
                    'user_id' => $this->auth->getIdentity()->getId(),
                    'start' => $date->date('Y-m-d H:i:s',
                        $date->mktime(0, 0, 0, $date->date('n', $time, false), 1, $date->date('Y', $time, false)),
                        false, false),
                    'end' => $date->date('Y-m-d H:i:s',
                        $date->mktime(23, 59, 59, $date->date('n', $time, false), $date->date('t', $time, false),
                            $date->date('Y', $time, false)), false, false),
                ],
            ]);
        }
    }

    public function indexAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }

        if ($this->request->getPost('progress')) {
            $this->view->disable();
            $response = array(
                'completed' => false,
                'success' => false,
                'index' => intval($this->request->getPost('index')),
                'percentage' => 0,
                'message' => '',
            );

            $file = Files::findFirst([
                'id = :id: AND deleted_at = 0',
                'bind' => [
                    'id' => $this->request->getPost('progress'),
                ],
            ]);
            if ($file) {
                $response['percentage'] = number_format(($file->fetched * 100) / $file->size, 2);
                switch ($file->status) {
                    case 'Waiting':
                        $response['message'] = 'در انتظار دریافت فایل';
                        break;
                    case 'InProgress':
                        $response['message'] = "{$response['percentage']}%";
                        break;
                    case 'Transferring':
                        $response['message'] = 'در حال آماده سازی فایل';
                        break;
                    case 'Failed':
                        $response['completed'] = true;
                        $response['message'] = 'دریافت فایل با مشکل روبرو شد';
                        break;
                    case 'Success':
                        $response['completed'] = true;
                        $response['success'] = true;
                        $response['message'] = 'دریافت فایل به اتمام رسید. <a href="' . $file->getFinalLink() . '">دانلود</a>';
                        break;
                }
            } else {
                $response['completed'] = true;
                $response['message'] = 'فایل یافت نشد';
            }


            $this->response->setContentType('application/json');
            $this->response->setContent(json_encode($response));
            $this->response->send();
            return;
        }

        $this->view->title = 'درخواست ویدئو';
        $this->view->link = $link = vinixhash_decode($this->dispatcher->getParam('link'));
        $this->view->records = array();
        $this->view->label = '';
        $this->view->file_id = 0;
        if ($link) {
            $website = Websites::findWebsite($link);
            if ($this->request->getPost('get')) {
                try {
                    $params = json_decode(preg_replace('/[\x00]+/', '',
                        $this->crypt->decryptBase64($this->request->getPost('params'))));
                } catch (\Exception $e) {
                    $this->flash->error('ویدئوی درخواستی نا معتبر می باشد.');
                    return;
                }
                $file = new Files();
                $file->user_id = $this->auth->getIdentity()->getId();
                $file->website_id = $website->getId();
                $file->type = $params->type;
                $file->name = md5($params->link) . '.' . $params->type;
                while (Files::find([
                    'deleted_at = 0 AND name = :name:',
                    'bind' => [
                        'name' => $file->name,
                    ],
                ])->count()) {
                    $file->name = md5(mt_rand() . uniqid()) . '.' . $file->type;
                }
                $file->label = $params->label;
                $file->size = $params->size;
                $file->uri = $link;
                $file->link = $params->link;
                $file->quality = $params->quality;
                $file->is_3d = $params->is_3d ? 'Yes' : 'No';
                $file->fetched = 0;
                $file->status = 'Waiting';
                try {
                    if (!$file->save()) {
                        $this->flash->error('فایل مورد نظر شما دانلود نشد. لطفا بعدا مجددا تلاش نمایید.');
                        return;
                    }
                } catch (\Exception $e) {
                    $messages = array(
                        'LOW_BALANCE' => sprintf('شما اعتبار کافی برای دریافت این ویدئو ندارید. می توانید از %s حجم بیشتری خرید نمایید.',
                            '<a href="' . $this->url->get(['for' => 'shop']) . '">اینجا</a>'),
                        'NO_SERVER' => 'دریافت این فایل فعلا امکان پذیر نیست. لطفا لحطاتی بعد مجددا تلاش نمایید.',
                    );
                    $message = $e->getMessage();
                    if (isset($messages[$message])) {
                        $message = $messages[$message];
                    }
                    $this->flash->error($message);
                    return;
                }
                $this->view->file_id = $file->getId();
                return;
            }
            if (!$website || !class_exists('\\Shariftube\\Websites\\' . $website->name)) {
                $this->flash->warning('آدرس وارد شده پشتیبانی نمی شود.');
                return;
            }
            $leecher = '\\Shariftube\\Websites\\' . $website->name;
            $leecher = new $leecher;
            $result = $leecher->getInfo($link);
            if ($result === null) {
                $this->flash->error('این ویدئو بخاطر قرانین کپی رایت قابل دریافت نمی باشد.');
                $this->view->records = array();
            } elseif (empty($result) || empty($result['records'])) {
                $this->flash->error('هیچ ویدئویی در آدرس وارد شده یافت نشد.');
                $this->view->records = array();
            } else {
                foreach ($result['records'] as $index => $value) {
                    $value['params'] = $this->crypt->encryptBase64(json_encode($value));
                    $result['records'][$index] = (object)$value;
                }
                $this->view->records = $result['records'];
                $this->view->label = $result['label'];
            }
            unset($result);
        }
    }

    public function searchAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }
        $this->view->start = intval($this->dispatcher->getParam(0));
        $this->view->dur = $this->dispatcher->getParam(1);
        if (!$this->view->dur) {
            $this->view->dur = 'All';
        }
        $this->view->hq = $this->dispatcher->getParam(2);
        if (!$this->view->hq) {
            $this->view->hq = 'All';
        }
        $this->view->qdr = $this->dispatcher->getParam(3);
        if (!$this->view->qdr) {
            $this->view->qdr = 'All';
        }
        $this->view->website = $this->dispatcher->getParam(4);
        if (!$this->view->website) {
            $this->view->website = 'All';
        }
        $this->view->q = $this->dispatcher->getParam(5);
        $this->view->websites = Websites::find();

        $this->view->title = 'جست و جوی ویدئو';

        $this->view->records = $records = array();
        $this->view->captcha = false;
        $this->view->captcha_image = '';
        $this->view->hidden_items = array();
        $this->view->last_item = $this->view->start;
        $this->view->have_next = false;
        if ($this->view->q) {
            $websites = array();
            foreach ($this->view->websites as $item) {
                $list = array_filter(explode(',', $item->domains));
                foreach ($list as $domain) {
                    $websites[$domain] = $item->name;
                }
            }
            $link = 'http://www.google.com/search?hl=en&q=' . urlencode($this->view->q) . ($this->view->website != 'All' && in_array($this->view->website,
                    $websites) ? '+site%3A' . urlencode(array_search($this->view->website,
                        $websites)) : '') . '&num=50&tbm=vid';
            if ($this->view->start > 0) {
                $link .= '&start=' . intval($this->view->start);
            }
            $tbs = array();
            if ($this->view->dur != 'All') {
                $tbs['dur'] = $this->view->dur;
            }
            if ($this->view->hq != 'All') {
                $tbs['hq'] = $this->view->hq;
            }
            if ($this->view->qdr != 'All') {
                $tbs['qdr'] = $this->view->qdr;
            }
            if (!empty($tbs)) {
                $str = array();
                foreach ($tbs as $index => $value) {
                    $str[] = $index . ':' . urlencode($value);
                }
                $link .= '&tbs=' . implode(',', $str);
            }
            $header = array();

            if ($this->request->getPost('captcha')) {
                $params = $this->request->getPost('params');
                $action = preg_replace('/[\x00]+/', '', $this->crypt->decryptBase64($params['action']));
                $header['Referer'] = preg_replace('/[\x00]+/', '', $this->crypt->decryptBase64($params['referer']));
                $query = array();
                foreach ($params as $index => $value) {
                    if (!in_array($index, ['referer', 'action'])) {
                        $query[] = urlencode($index) . '=' . urlencode(preg_replace('/[\x00]+/', '',
                                $this->crypt->decryptBase64($value)));
                    }
                }
                $query[] = 'captcha=' . urlencode($this->request->getPost('code'));
                $query[] = 'submit=Submit';
                $link = "{$action}?" . implode('&', $query);
            }
//            $link = 'http://ipv4.google.com/sorry/IndexRedirect?continue=' . urlencode($link);
//            $content = $this->curl->get($link, 5, 1, $header,false,1);
            $content = $this->curl->get($link, 20, 2, $header);
            if ($content['content']) {
                $dom = new Dom();
                $dom->load($content['content'], ['whitespaceTextNode' => false,]);
                $url = $content['head']['url'];
                unset($content);
                if (count($dom->find('img[src^=/sorry/]'))) {
                    $this->view->captcha = true;
                    $link = $dom->find('img[src^=/sorry/]')->getAttribute('src');
                    $parse = parse_url($url);
                    $image = "{$parse['scheme']}://{$parse['host']}{$link}";

                    $action = $dom->find('form')[0]->getAttribute('action');
                    $path = substr($parse['path'], 0, strrpos($parse['path'], '/'));
                    $action = "{$parse['scheme']}://{$parse['host']}{$path}/{$action}";

                    $hidden = array();
                    $hidden['action'] = $this->crypt->encryptBase64($action);
                    $hidden['referer'] = $this->crypt->encryptBase64($url);
                    foreach ($dom->find('form input[type=hidden]') as $tag) {
                        $hidden[$tag->getAttribute('name')] = $this->crypt->
encryptBase64($tag->getAttribute('value'));
                    }
                    $this->view->hidden_items = $hidden;


                    $content = $this->curl->get($image, 20, 5, array('Referer' => $url));
                    if ($content['content']) {
                        $this->view->captcha_image = 'data:' . @$content['head']['content_type'] . ';base64,' . urlencode(base64_encode($content['content']));
                    }
                    unset($content);
                } else {
                    $index = count($dom->find('#foot .b .csb')) - 1;
                    if ($index >= 0 && strtolower(trim($dom->find('#foot .b .csb')[$index]->nextSibling()->text)) == 'next') {
                        $this->view->have_next = true;
                    }
                    if (!count($dom->find('li.videobox'))) {
                        $this->flash->warning('جست و جوی شما نتیجه ای در بر نداشت.');
                    }

                    foreach ($dom->find('li.videobox') as $index => $li) {
                        $this->view->last_item = $this->view->start + $index + 1;
                        if (isset($websites[$li->find('.kv')->text])) {
                            $item = array();
                            $item['website'] = $websites[$li->find('.kv')->text];
                            $href = $li->find('h3 a')->getAttribute('href');
                            parse_str(substr($href, strpos($href, '?') + 1), $parse);
                            if (!isset($parse['q'])) {
                                continue;
                            }
                            $item['link'] = vinixhash_encode($parse['q']);
                            $item['title'] = $li->find('h3 a')->text;
                            $item['date'] = strtotime($li->find('.st .f .nobr')[0]->text);
                            $item['description'] = strip_tags(substr($li->find('.st')->innerHtml,
                                strpos($li->find('.st')->innerHtml, '<br />')));

                            $item['image'] = '';
                            $src = $li->find('img')[0]->getAttribute('src');
                            if ($src) {
                                $content = $this->curl->get($src, 10, 1);
                                if ($content['content']) {
                                    $item['image'] = 'data:' . @$content['head']['content_type'] . ';base64,' . urlencode(base64_encode($content['content']));
                                }
                                unset($content);
                            }
                            $item['duration'] = '';
                            if (count($li->find('a')[0]->find('div')) == 2) {
                                strtok($li->find('a')[0]->find('div')[1]->text, ' ');
                                $item['duration'] = strtok(' ');
                            }
                            $records[] = (object)$item;
                            unset($item);
                            if (count($records) >= 10) {
                                if (!$this->view->have_next && $index < count($dom->find('li.videobox')) - 1) {
                                    $this->view->have_next = true;
                                }
                                break;
                            }
                        }
                    }
                }
                unset($dom);
                $this->view->records = $records;
                unset($records);
            } else {
                $this->flash->error('جست و جوی مورد نظر شما انجام نشد. لطفا مجددا تلاش نمایید.');
            }
        }


    }

    public function filesAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }
        $this->view->title = 'لیست ویدئوها';
        $this->view->status = array(
            'Waiting' => 'در انتظار پردازش',
            'InProgress' => 'در حال دریافت',
            'Transferring' => 'آماده سازی فایل',
            'Failed' => 'خطا',
            'Success' => 'موفق',
        );

        $currentPage = $this->dispatcher->getParam(0);
        if ($currentPage < 1) {
            $currentPage = 1;
        }
        $name = preg_replace('/(\s+)/', '%', $this->dispatcher->getParam(1));
        if ($name) {
            $files = Files::find([
                'user_id = :user: AND label LIKE :name:',
                'bind' => [
                    'user' => $this->auth->getIdentity()->getId(),
                    'name' => '%' . $name . '%',
                ],
                'order' => 'created_at DESC',
            ]);
        } else {
            $files = Files::find([
                'user_id = :user:',
                'bind' => [
                    'user' => $this->auth->getIdentity()->getId(),
                ],
                'order' => 'created_at DESC',
            ]);
        }

        $paginator = new PaginatorModel([
            'data' => $files,
            'limit' => 10,
            'page' => $currentPage
        ]);
        $this->view->page = $paginator->getPaginate();

        $list = array();
        $servers = Servers::find(['deleted_at = 0']);
        if ($servers) {
            foreach ($servers as $server) {
                $list[$server->getId()] = $server;
            }
        }
        $this->view->servers = $list;
        unset($list, $servers);
    }

    public function shopAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }
        $this->view->title = 'خرید';

        $back = $this->dispatcher->getParam('back');
        if ($back) {
            $gateway = '\\Shariftube\\GateWays\\' . $back;
            if (class_exists($gateway)) {
                $gateway = new $gateway;
                try {
                    $purchase = $gateway->back();
                    if ($purchase) {
                        if ($purchase->doPayment()) {
                            $this->auth->authUserById($this->auth->getIdentity()->getId());
                            $this->flash->success('پرداخت شما با موفقیت انجام شد.');
                        } else {
                            $this->flash->error('پرداخت شما انجام شد. اما به دلیل خطایی در سرور تا لحظاتی دیگر حجم خریداری شده به حسابتان منظور خواهد شد.');
                        }
                    } else {
                        $this->flash->error('خطای ناشناخته. لطفا با پشتیبانی تماس بگیرید.');
                    }
                } catch (\Exception $e) {
                    $this->flash->error($e->getMessage());
                }
            } else {
                $this->flash->error('پرداخت شما پردازش نشد. لطفا با پشتیبانی تماس بگیرید.');
            }
        }

        $id = $this->request->getPost('id');
        if (!$back && $id > 0) {
            $package = Packages::findFirst([
                "id = :id: AND status = 'Enable'",
                'bind' => [
                    'id' => $id,
                ],
            ]);
            if ($package && $package->price >= 1000) {

                $purchase = new Purchases();
                $purchase->user_id = $this->auth->getIdentity()->getId();
                $purchase->package_id = $package->getId();
                $purchase->amount = $package->price;
                $purchase->gateway = 'Payline';
                $purchase->status = 'Waiting';
                try {
                    if ($purchase->save() && $purchase->send()) {
                        $this->view->disable();
                    } else {
                        $this->flash->error('عملیان پرداخت با مشکل روبرو شد. لطفا مجددا تلاش نمایید..');
                    }
                } catch (\Exception $e) {
                    $this->flash->error($e->getMessage());
                }
            } else {
                $this->flash->error('پکیج مورد نظر شمادر سیستم یافت نشد.');
            }
        }


        $this->view->records = Packages::find([
            "status = 'Enable'",
            'order' => 'price',
        ]);
        if (!$this->view->records) {
            $this->flash->warning('در حال حاضر هیچ پکیجی برای خرید وجود ندارد.');
        }
    }

    public function purchasesAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }
        $this->view->title = 'لیست خریدهای گذشته';
        $this->view->status = array(
            'Waiting' => 'در انتظار پرداخت',
            'Paid' => 'پرداخت شده',
            'Success' => 'تکمیل شده',
            'Cancelled' => 'کنسل شده',
        );

        $currentPage = $this->dispatcher->getParam('page');
        if ($currentPage < 1) {
            $currentPage = 1;
        }

        $purchases = Purchases::find([
            "user_id = :user: AND deleted_at = 0",
            'bind' => [
                'user' => $this->auth->getIdentity()->getId(),
            ],
            'order' => 'created_at DESC',
        ]);


        $paginator = new PaginatorModel([
            'data' => $purchases,
            'limit' => 10,
            'page' => $currentPage
        ]);
        $this->view->page = $paginator->getPaginate();

        $list = array();
        $packages = Packages::find();
        if ($packages) {
            foreach ($packages as $package) {
                $list[$package->getId()] = $package;
            }
        }
        $this->view->packages = $list;
        unset($list, $packages);
    }

    public function ticketsAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }
        $this->view->admin = $admin = $this->auth->getIdentity()->role == 'Admin' ? true : false;
        $this->view->title = 'پشتیبانی';
        $this->view->status = array(
            'Open' => 'باز',
            'Answered' => 'پاسخ داده شده',
            'Replay' => 'پاسخ کاربر',
            'InProgress' => 'در حال انجام',
            'Closed' => 'بسته شده',
        );

        $currentPage = $this->dispatcher->getParam(0);
        if ($currentPage < 1) {
            $currentPage = 1;
        }
        $status = strtolower($this->dispatcher->getParam(1));
        if (!in_array($status, ['open', 'all', 'closed'])) {
            if ($admin) {
                $status = 'open';
            } else {
                $status = 'all';
            }
        }
        $this->dispatcher->setParam(1, $status);

        switch ($status) {
            case 'open':
                $status = ['Open', 'Replay', 'InProgress'];
                break;
            case 'closed':
                $status = ['Answered', 'Closed'];
                break;
            default:
                $status = ['Open', 'Answered', 'Replay', 'InProgress', 'Closed'];
                break;
        }
        if ($admin) {
            $tickets = Tickets::find([
                'status IN ({status:array})',
                'bind' => [
                    'status' => $status,
                ],
                'order' => 'modified_at DESC',
            ]);
        } else {
            $tickets = Tickets::find([
                'user_id = :user: AND status IN ({status:array})',
                'bind' => [
                    'user' => $this->auth->getIdentity()->getId(),
                    'status' => $status,
                ],
                'order' => 'modified_at DESC',
            ]);
        }


        $paginator = new PaginatorModel([
            'data' => $tickets,
            'limit' => 10,
            'page' => $currentPage
        ]);
        $this->view->page = $paginator->getPaginate();
    }

    public function ticketAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }
        $this->view->status = array(
            'Open' => 'باز',
            'Answered' => 'پاسخ داده شده',
            'Replay' => 'پاسخ کاربر',
            'InProgress' => 'در حال انجام',
            'Closed' => 'بسته شده',
        );
        $this->view->admin = $admin = $this->auth->getIdentity()->role == 'Admin' ? true : false;
        $this->view->id = $id = $this->dispatcher->getParam('id');
        if ($id > 0) {
            $this->view->title = 'مشاهده تیکت';
            $ticket = Tickets::findFirst([
                'id = :id:',
                'bind' => [
                    'id' => $id,
                ],
            ]);
            if ($ticket->user_id != $this->auth->getIdentity()->getId() && !$admin) {
                $this->view->disable();
                $this->response->redirect(['for' => 'support']);
                return;
            }
            $this->view->ticket = $ticket;

            if ($this->request->getPost('save') || $this->request->getPost('close')){
                $error = array();

                if ($ticket->user_id == $this->auth->getIdentity()->getId()) {
                    $status = 'Replay';
                } else {
                    $status = 'Answered';
                }

                if ($admin && in_array($this->request->getPost('status'), ['Open', 'Answered', 'Replay', 'InProgress', 'Closed'])) {
                    $status = $this->request->getPost('status');
                }

                if ($this->request->getPost('close')) {
                    $status = 'Closed';
                }

                $content = $this->request->getPost('content');
                if (mb_strlen($content, 'UTF-8') < 10) {
                    $error[] = 'متن تیکت را به صورت کامل وارد نمایید.';
                } elseif (mb_strlen($content, 'UTF-8') > 1000) {
                    $error[] = 'توضیحات شما نباید بیشتر از ۱۰۰۰ کاراکتر باشد.';
                }

                if (empty($error)) {
                    $transaction = $this->transaction->get();
                    $ticket->setTransaction($transaction);
                    $ticket->status = $status;
                    if (!$ticket->save()) {
                        $transaction->rollback();
                        $error[] = 'پاسخ شما ذخیره نشد. لطفا لحظاتی بعد تلاش کنید.';
                    }
                }
                if (empty($error)) {
                    $replay = new TicketReplays();
                    $replay->setTransaction($transaction);
                    $replay->content = $content;
                    $replay->user_id = $this->auth->getIdentity()->getId();
                    $replay->ticket_id = $ticket->getId();
                    if (!$replay->save()) {
                        $transaction->rollback();
                        $error[] = 'پاسخ شما ذخیره نشد. لطفا لحظاتی بعد تلاش کنید.';
                    } else {
                        $transaction->commit();
                        $this->flash->success('با تشکر از پاسخ شما.');
                    }
                }
                if (!empty($error)) {
                    foreach ($error as $message) {
                        $this->flash->error($message);
                    }
                }
            }
        } else {
            $this->view->title = 'ارسال تیکت جدید';
            if ($admin) {
                $this->view->disable();
                $this->response->redirect(['for' => 'support']);
                return;
            }
            if ($this->request->getPost('save')){
                $error = array();

                $title = $this->request->getPost('title');
                if (mb_strlen($title, 'UTF-8') < 10) {
                    $error[] = 'عنوان تیکت باید حداقل ۱۰ کاراکتر باشد.';
                }

                $content = $this->request->getPost('content');
                if (mb_strlen($content, 'UTF-8') < 10) {
                    $error[] = 'متن تیکت را به صورت کامل وارد نمایید.';
                } elseif (mb_strlen($content, 'UTF-8') > 1000) {
                    $error[] = 'توضیحات شما نباید بیشتر از ۱۰۰۰ کاراکتر باشد.';
                }

                if (empty($error)) {
                    $transaction = $this->transaction->get();
                    $ticket = new Tickets();
                    $ticket->setTransaction($transaction);
                    $ticket->title = $title;
                    $ticket->user_id = $this->auth->getIdentity()->getId();
                    $ticket->status = 'Open';
                    if (!$ticket->save()) {
                        $transaction->rollback();
                        $error[] = 'تیکت جدید ایجاد نشد. لطفا لحظاتی بعد تلاش کنید.';
                    }
                }
                if (empty($error)) {
                    $replay = new TicketReplays();
                    $replay->setTransaction($transaction);
                    $replay->content = $content;
                    $replay->user_id = $this->auth->getIdentity()->getId();
                    $replay->ticket_id = $ticket->getId();
                    if (!$replay->save()) {
                        $transaction->rollback();
                        $error[] = 'تیکت جدید ایجاد نشد. لطفا لحظاتی بعد تلاش کنید.';
                    } else {
                        $transaction->commit();
                        $this->flash->success('تیکت شما با موفقیت ارسال شد و به زودی توسط اپراتورهای پشتیبانی پاسخ داده خواهد شد.');
                        $this->view->id = $id = $ticket->getId();
                        $this->view->ticket = $ticket;
                        $this->dispatcher->setParam('id', $id);
                    }
                }
                if (!empty($error)) {
                    foreach ($error as $message) {
                        $this->flash->error($message);
                    }
                }
            }
        }

    }

    public function settingsAction()
    {
        if (!$this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'login']);
            return;
        }
        $this->view->title = 'تنظیمات';
        $this->view->user = $this->auth->getIdentity();

        if ($this->request->getPost('apply')) {
            $error = array();

            $password = $this->request->getPost('new_password');
            if (strlen($password) > 0 && strlen($password) < 6) {
                $error[] = 'رمز عبور حداقل باید ۶ کاراکتر باشد.';
            }

            if (strlen($password) > 0 && $password != $this->request->getPost('confirm_password')) {
                $error[] = 'رمز عبور و تکرار آن برابر نیستند.';
            }

            $name = $this->request->getPost('name');
            if (mb_strlen($name, 'UTF-8') < 5) {
                $error[] = 'لطفا نام خود را به صورت کامل وارد کنید.';
            }

            if (!$this->security->checkHash($this->request->getPost('password'), $this->auth->getIdentity()->password)
            ) {
                $error[] = 'پسورد فعلی خود را اشتباه وارد کرده اید.';
            }
            if (empty($error)) {
                $this->auth->getIdentity()->name = $name;
                $password_change = false;
                if (strlen($password) > 0) {
                    $this->auth->getIdentity()->password = $this->security->hash($password);
                    $password_change = true;
                }
                if ($this->auth->getIdentity()->save()) {
                    if ($password_change){
                        $password_change = new PasswordChanges();
                        $password_change->user_id = $this->auth->getIdentity()->getId();
                        $password_change->ip_address = $this->request->getClientAddress();
                        $password_change->user_agent = $this->request->getUserAgent();
                        $password_change->save();
                    }
                    $this->flash->success('تغییرات شما با موفقیت ذخیره شد.');
                } else {
                    $this->flash->error('تغییر شما ذخیره نشد. لطفا مجددا تلاش نمایید.');
                }
            }
            if (!empty($error)) {
                foreach($error as $message) {
                    $this->flash->error($message);
                }
            }
        }
    }

    public function logoutAction()
    {
        $this->view->disable();
        $this->auth->remove();
        $this->response->redirect(['for' => 'login']);
    }

    public function loginAction()
    {
        $this->view->title = 'ورود به سایت';
        if ($this->auth->getIdentity()) {
            $this->view->disable();
            $this->response->redirect(['for' => 'search']);
            return;
        }

        $code = $this->dispatcher->getParam('code');
        if ($code) {
            $reset = ResetPasswords::findFirstByCode($code);
            if (empty($reset) || strtotime($reset->created_at) < time() - 86400 || !$reset->getUser()) {
                $this->flash->error('لینک تغییر رمز عبور اشتباه است. لطفا به آخرین ایمیلی که برای فراموشی رمز عبور دریافت کرده اید مراجعه کنید.');
            } else {
                $password = mt_rand(100000, 999999);
                $user = $reset->getUser();
                $user->password = $this->security->hash($password);
                if (!$user->save()) {
                    $this->flash->error('تغییر رمز عبور انجام نشد. لطفا مجددا تلاش نمایید.');
                } else {
                    $password_change = new PasswordChanges();
                    $password_change->user_id = $user->getId();
                    $password_change->ip_address = $this->request->getClientAddress();
                    $password_change->user_agent = $this->request->getUserAgent();
                    $password_change->save();

                    $this->mail->setTemplate('password');
                    $this->mail->setVar('password', $password);
                    $this->mail->setVar('user', $user);
                    $this->mail->setVar('link', $this->url->getStatic(['for' => 'login']));
                    $this->mail->addAddress($user->email, $user->name);
                    $this->mail->Subject = 'رمز عبور جدید';
                    if ($this->mail->send()) {
                        $reset->delete();
                        $this->flash->success('رمز عبور شما تغییر کرد و رمز عبور جدید برای شما ایمیل شد.');
                    } else {
                        $this->flash->error('ایمیل رمز عبور جدید برای شما ارسال نشد. لطفا مجددا تلاش نمایید.');
                    }
                }
            }
        }

        if ($this->request->getPost('login')) {
            if ($this->auth->check([
                'email' => $this->request->getPost('email'),
                'password' => $this->request->getPost('password'),
            ])
            ) {
                $this->view->disable();
                $this->response->redirect(['for' => 'search']);
                return;
            } else {
                $this->flash->error('ایمیل یا رمز عبور اشتباه است.');
            }
        }

        if ($this->request->getPost('signup')) {
            $error = array();

            $email = $this->request->getPost('email');
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $error[] = 'ایمیل خود را به صورت صحیح وارد نمایید.';
            }
            if ($email != $this->request->getPost('email_confirm')) {
                $error[] = 'تکرار ایمیل با ایمیل وارد شده یکسان نیستند.';
            }
            if (Users::find([
                'deleted_at = 0 AND email = :email:',
                'bind' => [
                    'email' => $email,
                ],
            ])->count()
            ) {
                $error[] = 'با این ایمیل یک کاربر وجود دارد.';
            }

            $password = $this->request->getPost('password');
            if (strlen($password) < 6) {
                $error[] = 'رمز عبور حداقل باید ۶ کاراکتر باشد.';
            }

            $name = $this->request->getPost('name');
            if (mb_strlen($name, 'UTF-8') < 5) {
                $error[] = 'لطفا نام خود را به صورت کامل وارد کنید.';
            }

            $code = $this->request->getPost('code');
            $referral = Users::findFirst([
                'deleted_at = 0 AND referral_code = :code:',
                'bind' => [
                    'code' => $code,
                ],
            ]);
            if (empty($referral)) {
                $error[] = 'کد معرف شما اشتباه می باشد.';
            }

            if (empty($error)) {
                $user = Users::findFirst([
                    'deleted_at = 0 AND email = :email:',
                    'bind' => [
                        'email' => $email,
                    ],
                ]);
                if ($user) {
                    $user->deleted_at = 0;
                    $user->quota = 0;
                    $user->used = 0;
                    $user->remain = 0;
                } else {
                    $user = new Users();
                }
                $user->email = $email;
                $user->password = $this->security->hash($password);
                $user->name = $name;
                $user->referral_id = $referral->getId();
                if ($user->save() && $this->auth->authUserById($user->getId())) {
                    $this->view->disable();
                    $this->response->redirect(['for' => 'search']);
                    return;
                } else {
                    $error[] = 'سیستم موقتا مشکل دارد. لطفا مجددا تلاش نمایید.';
                }
            }
            foreach ($error as $message) {
                $this->flash->error($message);
            }
        }

        if ($this->request->getPost('forgot')) {
            $error = array();

            $email = $this->request->getPost('email');
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $error[] = 'ایمیل خود را به صورت صحیح وارد نمایید.';
            } else {
                $user = Users::findFirst([
                    'deleted_at = 0 AND email = :email:',
                    'bind' => [
                        'email' => $email,
                    ],
                ]);
                if (empty($user)) {
                    $error[] = 'کاربری با این ایمیل در سیستم موجود نیست.';
                } else {
                    $reset = new ResetPasswords();
                    $reset->user_id = $user->getId();
                    if ($reset->save()) {
                        ResetPasswords::find([
                            'user_id = :user_id: AND id != :id:',
                            'bind' => [
                                'user_id' => $user->getId(),
                                'id' => $reset->getId(),
                            ],
                        ])->delete();
                        $this->mail->setTemplate('forgot');
                        $this->mail->setVar('code', $reset->code);
                        $this->mail->setVar('user', $user);
                        $this->mail->setVar('link', $this->url->getStatic(['for' => 'forgot', 'code' => $reset->code]));
                        $this->mail->addAddress($user->email, $user->name);
                        $this->mail->Subject = 'فراموشی رمز عبور';
                        if ($this->mail->send()) {
                            $this->flash->success('یک ایمیل حاوی لینک تغییر رمز عبور برای شما ارسال شد.');
                        } else {
                            $error[] = 'ایمیل فراموشی رمز عبور برای شما ارسال نشد. لطفا مجددا تلاش نمایید.';
                        }
                    } else {
                        $error[] = 'سیستم موقتا مشکل دارد. لطفا مجددا تلاش نمایید.';
                    }
                }
            }
            foreach ($error as $message) {
                $this->flash->error($message);
            }
        }
    }

    public function route404Action()
    {
        $this->view->title = 'آدرس نا معتبر';
    }
}
