<?php
namespace Shariftube\Controllers;

use Phalcon\Http\Response;
use Phalcon\Mvc\Model\Resultset;
use PHPHtmlParser\Dom;
use Shariftube\Models\Incomes;
use Shariftube\Models\ResetPasswords;
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
        $this->view->title = 'درخواست ویدئو';


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
        $this->view->last_item = 0;
        $this->view->have_next = false;
        if ($this->view->q) {
            $websites = array();
            foreach ($this->view->websites as $item) {
                $list = array_filter(explode(',', $item->domains));
                foreach ($list as $domain) {
                    $websites[$domain] = $item->name;
                }
            }
            $link = 'https://www.google.com/search?q=' . urlencode($this->view->q) . ($this->view->website != 'All' && in_array($this->view->website,
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
                        $query[] = urlencode($index) . '=' . urlencode(preg_replace('/[\x00]+/', '',$this->crypt->decryptBase64($value)));
                    }
                }
                $query[] = 'captcha=' . urlencode($this->request->getPost('code'));
                $query[] = 'submit=Submit';
                $link = "{$action}?" . implode('&', $query);
            }
//            $link = 'https://ipv4.google.com/sorry/IndexRedirect?continue=' . urlencode($link);
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
                        $hidden[$tag->getAttribute('name')] = $this->crypt->encryptBase64($tag->getAttribute('value'));
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
//                    if (!count($dom->find('li.videobox'))) {
//                        $this->flash->warning('جست و جوی شما نتیجه ای در بر نداشت.');
//                    }

                    foreach ($dom->find('li.videobox') as $index => $li) {
                        $this->view->last_item = $index + 1;
                        if (isset($websites[$li->find('.kv')->text])) {
                            $item = array();
                            $item['website'] = $websites[$li->find('.kv')->text];
                            $href = $li->find('h3 a')->getAttribute('href');
                            parse_str(substr($href, strpos($href, '?') + 1), $parse);
                            if (!isset($parse['q'])) {
                                continue;
                            }
                            $item['link'] = $parse['q'];
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
