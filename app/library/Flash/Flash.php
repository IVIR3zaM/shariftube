<?php
namespace Shariftube\Flash;

class Flash
{
    private $message = array();
    private $classes = array(
        'error' => 'errorMessage',
        'success' => 'successMessage',
        'notice' => 'noticeMessage',
        'warning' => 'warningMessage',
    );

    public function __construct($classes = array())
    {
        if (is_array($classes)){
            foreach ($classes as $type => $class) {
                if (isset($this->classes[$type]) && is_string($class)) {
                    $this->classes[$type] = $class;
                }
            }
        }
    }
    public function error($message)
    {
        $this->message['error'][] = $message;
    }

    public function success($message)
    {
        $this->message['success'][] = $message;
    }

    public function notice($message)
    {
        $this->message['notice'][] = $message;
    }

    public function warning($message)
    {
        $this->message['warning'][] = $message;
    }

    public function messages()
    {
        return $this->message;
    }
    public function output()
    {
        foreach ($this->message as $type => $value) {
            foreach ($value as $message) {
                echo '<div class="' . $this->classes[$type] . '">' . $message . '</div>';
            }
        }
    }
}