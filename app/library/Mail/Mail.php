<?php
namespace Shariftube\Mail;

use Phalcon\Mvc\User\Component;
use Phalcon\Mvc\View;
use Shariftube\Models\Unsubscribes;

class Mail extends Component
{
    private $unsubscribes = array();
    private $emails = array();
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
        // $this->phpmailer->SMTPDebug = 2;
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

    public function addAddress($address, $name = '', $force_send = false)
    {
        if (!$force_send && Unsubscribes::count([
                'email = :email:',
                'bind' => [
                    'email' => $address,
                ],
            ])
        ) {
            $this->unsubscribes[] = $address;
            return false;
        }
        $result = call_user_func_array([$this->phpmailer, 'addAddress'], [$address, $name]);
        if ($result) {
            $this->emails[] = $address;
            if ($this->getDI()->getUrl()) {
                $this->vars['unsubscribe'][$address] = $this->getDI()->getUrl()->getStatic([
                    'for' => 'unsubscribe',
                    'email' => vinixhash_encode($address),
                ]);
            } else {
                $this->vars['unsubscribe'][$address] = 'https://shariftube.ir/unsubscribe/' . vinixhash_encode($address);
            }
            if (!$force_send) {
                $this->phpmailer->addCustomHeader('List-Unsubscribe', '<' . $this->vars['unsubscribe'][$address] . '>');
            }
        }
        return $result;
    }

    public function send()
    {
        if (empty($this->emails)) {
            if (empty($this->unsubscribes)) {
                return false;
            } else {
                return null;
            }
        }
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
