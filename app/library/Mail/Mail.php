<?php
namespace Shariftube\Mail;

use Phalcon\Mvc\User\Component;
use Phalcon\Mvc\View;

class Mail extends Component
{
    private $vars = array();
    private $template = null;
    private $phpmailer = null;
    public $ErrorInfo = null;

    public function __construct()
    {
        $this->createPHPMailer();
    }
    public function createPHPMailer()
    {
        $this->phpmailer = new \PHPMailer();
        $this->phpmailer->isHTML(true);
        $this->phpmailer->isSMTP();
        $this->phpmailer->Host = $this->config->mail->host;
        if ($this->config->mail->username) {
            $this->phpmailer->SMTPAuth = true;
            $this->phpmailer->Username = $this->config->mail->username;
            $this->phpmailer->Password = $this->config->mail->password;

        }
	$this->phpmailer->SMTPDebug = 2;
	$this->phpmailer->SMTPAutoTLS = false;
        $this->phpmailer->SMTPSecure = $this->config->mail->security;
        $this->phpmailer->Port = $this->config->mail->port;
        $this->phpmailer->setFrom($this->config->mail->from, $this->config->mail->fromname);
        $this->phpmailer->Timeout = $this->config->mail->timeout;
        $this->phpmailer->CharSet = 'UTF-8';
    }
    public function resetPHPMailer()
    {
        $this->phpmailer = null;
        $this->createPHPMailer();
    }

    public function __call($method, $args)
    {
        return call_user_func_array([$this->phpmailer, $method], $args);
    }

    public function __set($name, $value)
    {
        $this->phpmailer->$name = $value;
    }

    public function __get($name)
    {
        if ($name == 'view') {
            return $this->getDI()->getView();
        }
        if ($name == 'config') {
            return $this->getDI()->getConfig();
        }
        return $this->phpmailer->$name;
    }

    public function setTemplate($template)
    {
        if (!in_array($template, ['header', 'footer']) && $this->view->exists('email/' . $template)) {
            $this->template = $template;
            return true;
        }
        return false;
    }

    public function getTemplate()
    {
        return $this->template;
    }

    public function setVar($name = '', $value = '')
    {
        $this->vars[$name] = $value;
    }

    public function getVar($name = '')
    {
        if (isset($this->vars[$name])) {
            return $this->vars[$name];
        }
        return null;
    }

    public function send()
    {
        if (!$this->template) {
            return false;
        }

        $level = $this->view->getRenderLevel();
        $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);

        foreach ($this->vars as $name => $value) {
            $this->view->setVar($name, $value);
        }

        $this->view->start()->render('email', 'header')->finish();
        $this->Body = $this->view->getContent();

        $this->view->start()->render('email', $this->getTemplate())->finish();
        $content = $this->view->getContent();
        $this->Body .= $content;
        $this->AltBody = strip_tags(str_replace('/(\s+)/', ' ', $content));

        $this->view->start()->render('email', 'footer')->finish();
        $this->Body .= $this->view->getContent();

        $this->view->setRenderLevel($level);

        $ret = $this->phpmailer->send();
        // var_export($this->phpmailer->ErrorInfo);exit;
        if ($ret) {
            $this->resetPHPMailer();
        }

        $this->ErrorInfo = $this->phpmailer->ErrorInfo;
        return $ret;
    }
}
