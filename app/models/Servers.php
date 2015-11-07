<?php
namespace Shariftube\Models;

class Servers extends BaseModel
{
    public $link;
    public $hostname;
    public $port;
    public $username;
    public $password;
    public $quota;
    public $used;
    public $remain;
    public $enable;
    public $deleted_at;
    public $modified_at;
    public $created_at;

    public function initialize()
    {
        parent::initialize();
        $this->hasMany('id', 'Shariftube\Models\Files', 'server_id', ['alias' => 'Files']);
    }

    public function beforeSave()
    {
        parent::beforeSave();
        if ($this->remain < ($this->getDI()->getConfig()->cli->pause_server_remain * 1024 * 1024) && $this->enable = 'Yes') {
            $this->enable = 'No';
        }
    }

    static public function getServer($quota = 0)
    {
        if ($quota > 0) {
            return Servers::findFirst([
                "deleted_at = 0 AND enable = 'Yes' AND remain >= :quota:",
                'bind' => [
                    'quota' => $quota,
                ],
                'order' => 'id ASC',
            ]);
        }
        return null;
    }

    public function mkdir($dir = '')
    {
        if (!is_numeric($dir)) {
            return false;
        }
        $password = preg_replace('/[\x00]+/', '', $this->getDI()->getCrypt()->decryptBase64($this->password));
        $out = `sshpass -p "{$password}" ssh {$this->username}@{$this->hostname} -p {$this->port} "mkdir ~/{$dir} && chmod 0755 ~/{$dir}"`;
        return ($out ? false : true);
    }

    public function rmdir($dir = '')
    {
        if (!is_numeric($dir)) {
            return false;
        }
        $password = preg_replace('/[\x00]+/', '', $this->getDI()->getCrypt()->decryptBase64($this->password));
        $out = `sshpass -p "{$password}" ssh {$this->username}@{$this->hostname} -p {$this->port} "rm -rf ~/{$dir}"`;
        return ($out ? false : true);
    }

    public function ls($dir = '')
    {
        $result = array();
        if ($dir && !is_numeric($dir)) {
            return $result;
        }
        $password = preg_replace('/[\x00]+/', '', $this->getDI()->getCrypt()->decryptBase64($this->password));
        $command = "sshpass -p '{$password}' ssh {$this->username}@{$this->hostname} -p {$this->port} 'ls ~/{$dir}'";
        $result = array();
        exec($command, $result);
        if (!is_array($result)) {
            $result = array();
        }
        return $result;
    }

    public function du($dir = '')
    {
        if ($dir && !is_numeric($dir)) {
            return false;
        }
        $password = preg_replace('/[\x00]+/', '', $this->getDI()->getCrypt()->decryptBase64($this->password));
        $command = "sshpass -p '{$password}' ssh {$this->username}@{$this->hostname} -p {$this->port} 'du -s ~/{$dir}'";
        $out = array();
        exec($command, $out);
        if (!is_array($out)) {
            return false;
        }
        return intval($out[0] * 1024);
    }

    public function transfer($source = '', $dir = '')
    {
        $result = array();
        if ($dir && !is_numeric($dir)) {
            return $result;
        }
        $password = preg_replace('/[\x00]+/', '', $this->getDI()->getCrypt()->decryptBase64($this->password));
        $command = "sshpass -p '{$password}' rsync -ptrzv -e 'ssh -p {$this->port}' --remove-source-files --progress {$source} {$this->username}@{$this->hostname}:~/{$dir}";
        $out = array();
        exec($command, $out);
        if (is_array($out)) {
            foreach ($out as $line) {
                if (preg_match('/\/?(?P<file>[a-f0-9]{32}\.[a-z0-9]+)$/i', $line, $match)) {
                    $result[] = $match['file'];
                }
            }
        }
        return $result;
    }
}
