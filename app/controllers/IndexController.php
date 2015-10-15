<?php
namespace Shariftube\Controllers;

use Phalcon\Http\Response;
use Phalcon\Mvc\Model\Resultset;

/**
 * Display the default index page.
 */
class IndexController extends ControllerBase
{
    public function indexAction()
    {
        $this->view->title = 'پنل کاربری';
        $this->flash->error('dfdff');
    }

    public function logoutAction()
    {
        $this->view->disable();
        $this->auth->remove();
        $this->response->redirect(['for' => 'login']);
    }

    public function loginAction()
    {
        if ($this->auth->check([
            'username' => @$this->json->username,
            'password' => @$this->json->password,
        ])
        ) {

        }
    }

    public function route404Action()
    {
        $this->view->title = 'آدرس نا معتبر';
    }
}
