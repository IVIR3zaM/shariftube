<?php
namespace Shariftube\Tasks;

use Phalcon\CLI\Task;
use Shariftube\Models\Files;
use Shariftube\Models\Purchases;
use Shariftube\Models\Servers;
use Shariftube\Models\Users;

class MainTask extends Task
{
    public function mainAction()
    {
        $current_time = time();
        foreach ($this->config->crons as $cron => $time) {
            $time = array_values(array_filter(explode(' ', $time)));
            if (count($time) != 5) {
                continue;
            }
            $test = 1;
            foreach ($time as $index => $value) {
                switch ($index) {
                    case 0:
                        $target = intval(date('i', $current_time)); // minute
                        break;
                    case 1:
                        $target = date('G', $current_time); //hour
                        break;
                    case 2:
                        $target = date('j', $current_time); //day of month
                        break;
                    case 3:
                        $target = date('n', $current_time); //month
                        break;
                    case 4:
                        $target = date('w', $current_time); //day of week
                        break;
                }
                $value = array_filter(explode(',', $value));
                if (empty($value)) {
                    $test = 0;
                    break;
                }
                $test = count($value);
                foreach ($value as $val) {
                    $val = preg_replace('/\s+/', '', $val);
                    if ($val != '*') {
                        if (strpos($val, '-') !== false) {
                            $val = array_values(array_filter(explode('-', $val)));
                            if (count($val) != 2 || $target < $val[0] || $target > $val[1]) {
                                $test--;
                                continue;
                            }
                        } elseif (strpos($val, '/') !== false) {
                            $val = array_values(array_filter(explode('/', $val)));
                            if (count($val) != 2 || $val[0] != '*' || $target % $val[1]) {
                                $test--;
                                continue;
                            }
                        } elseif (intval($val) != $target) {
                            $test--;
                            continue;
                        }
                    }
                }
                if ($test <= 0) {
                    break;
                }
            }
            if ($test <= 0) {
                continue;
            }

            echo "Running cron '{$cron}'\n";
            exec(BASE_DIR . "/cli Main {$cron} > /dev/null &");
        }

        echo "Running Fetch Threads\n";
        for ($i = 1; $i <= $this->config->cli->fetch_threads; $i++) {
            echo "Running fetch thread #{$i}\n";
            exec(BASE_DIR . "/cli Main fetch {$i} > /dev/null &");
        }
        echo "Running Feed Threads\n";
        for ($i = 1; $i <= $this->config->cli->feed_threads; $i++) {
            echo "Running feed thread #{$i}\n";
            exec(BASE_DIR . "/cli Main feed {$i} > /dev/null &");
        }

        echo "Running Server transfer Threads\n";
        $dirs = @scandir(APP_DIR . '/cache/files');
        foreach ($dirs as $dir) {
            if (is_numeric($dir) && is_dir(APP_DIR . '/cache/files/' . $dir)) {
                $subdirs = @scandir(APP_DIR . '/cache/files/' . $dir);
                foreach ($subdirs as $subdir) {
                    if (is_numeric($subdir) && is_dir(APP_DIR . '/cache/files/' . $dir . '/' . $subdir)) {
                        $tmp = @scandir(APP_DIR . '/cache/files/' . $dir . '/' . $subdir);
                        foreach ($tmp as $temp) {
                            if (!is_dir(APP_DIR . '/cache/files/' . $dir . '/' . $temp)) {
                                echo "Running Server transfer thread #{$dir}\n";
                                exec(BASE_DIR . "/cli Main transfer {$dir} > /dev/null &");
                                break;
                            }
                        }
                    }
                }

            }
        }
        echo "Finnish\n";
    }

    public function emailAction($params)
    {
        set_time_limit(0);
        if (count($params) < 3) {
            echo "Invalid params\n";
            return;
        }
        $template = $params[0];
        $file = $params[1];
        $subject = $params[2];
        if (!file_exists(APP_DIR . '/views/email/' . $template . '.volt')) {
            echo "template not found\n";
            return;
        }
        if ($file == 'user' && isset($params[3])) {
            $ids = array_values(array_filter(explode(',', $params[3])));
            $users = Users::find([
                'id IN ({ids:array})',
                'bind' => [
                    'ids' => $ids,
                ],
            ]);
            if (!$users) {
                echo "no users found\n";
                return;
            }
            $emails = array();
            foreach ($users as $user) {
                $emails[] = [$user->email, $user->name];
            }
            $start = 0;
            $limit = count($emails);
        } elseif (!file_exists(APP_DIR . '/cache/emails/' . $file . '.csv')) {
            echo "emails not found\n";
            return;
        } else {
            $list = explode("\n", file_get_contents(APP_DIR . '/cache/emails/' . $file . '.csv'));
            $emails = array();
            foreach ($list as $line) {
                $email = trim(strtolower(strtok($line, ',')));
                $name = trim(strtok(','));
                if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $emails[] = [$email, $name];
                }
            }

            $start = 0;
            if (isset($params[3]) && $params[3] > 0) {
                $start = intval($params[3]);
            }
            $limit = count($emails);
            if (isset($params[4]) && $params[4] > 0 && $params[4] < $limit) {
                $limit = intval($params[4]) - $start;
            }
        }

        echo "{$limit} emails found from {$start}\n";
        for ($i = $start; $i < ($start + $limit); $i++) {
            $email = $emails[$i][0];
            $name = $emails[$i][1];
            echo "Sending #{$i}: {$email}: ";
            $this->mail->setTemplate($template);
            $this->mail->setVar('email', $email);
            $this->mail->setVar('name', $name);
            $this->mail->addAddress($email, $name);
            $this->mail->Subject = $subject;
            if ($this->mail->send()) {
                echo 'Sent';
            } else {
                echo 'Failed';
            }
            echo "\n";
        }
        echo "Finnish\n";
    }

    public function paymentFresherAction()
    {
        $purchases = Purchases::find([
            "status = 'Paid' AND modified_at < :time:",
            'bind' => [
                'time' => date('Y-m-d H:i:s', strtotime('-5 Minutes')),
            ],
        ]);
        if ($purchases) {
            foreach ($purchases as $purchase) {
                $purchase->doPayment();
            }
        }
    }

    public function cleanOldCacheAction()
    {
        if (file_exists(APP_DIR . '/cache/curl')) {
            $dirs = @scandir(APP_DIR . '/cache/curl');
            foreach ($dirs as $file) {
                if (!in_array($file, ['.', '..']) && !is_dir(APP_DIR . '/cache/curl/' . $file)) {
                    if (filemtime(APP_DIR . '/cache/curl/' . $file) < strtotime("-{$this->config->cli->curl_cache_lifetime} Seconds")) {
                        unlink(APP_DIR . '/cache/curl/' . $file);
                    }
                }
            }
        }
    }

    public function userFresherAction()
    {
        $users = Users::find(['deleted_at = 0 AND quota > 0']);
        if ($users) {
            foreach ($users as $user) {
                $user->used = Files::sum([
                    'column' => 'size',
                    'conditions' => 'user_id = :id: AND status IN({status:array})',
                    'bind' => [
                        'id' => $user->getId(),
                        'status' => ['Waiting', 'InProgress', 'Transferring', 'Success'],
                    ],
                ]);
                $user->remain = $user->quota - $user->used;
                $user->save();
            }
        }
    }

    public function transferFilesAction()
    {
        $files = Files::find([
            "deleted_at = 0 AND status = 'Transferring' AND size = fetched"
        ]);
        if ($files) {
            foreach ($files as $file) {
                $dir = date('Ymd', strtotime($file->created_at));
                if (file_exists(APP_DIR . '/cache/files/' . $file->getServer()->getId() . '/' . $dir)
                    && !file_exists(APP_DIR . '/cache/files/' . $file->getServer()->getId() . '/' . $dir . '/' . $file->name)
                ) {
                    $file->status = 'Success';
                    $file->save();
                }
            }
        }
    }

    public function removeAction()
    {
        $servers = Servers::find(['deleted_at = 0']);
        if ($servers) {
            foreach ($servers as $server) {
                foreach ($server->ls() as $dir) {
                    if (preg_match('/^[\d]{8}$/', $dir)) {
                        $time = strtotime(substr($dir, 0, 4) . '-' . substr($dir, 4, 2) . '-' . substr($dir, 6, 2));
                        if ($time < strtotime("-{$this->config->cli->delete_after} Days")) {
                            $server->rmdir($dir);
                        }
                    }
                }
                $files = $server->getFiles([
                    'deleted_at = 0 AND created_at < :date:',
                    'bind' => [
                        'date' => date('Y-m-d', strtotime("-{$this->config->cli->delete_after} Days")),
                    ],
                ]);
                if ($files) {
                    foreach ($files as $file) {
                        $file->name = null;
                        $file->save();
                    }

                    $files->delete();
                }
                $server->used = Files::sum([
                    'column' => 'size',
                    'conditions' => 'server_id = :id: AND deleted_at = 0',
                    'bind' => [
                        'id' => $server->getId(),
                    ],
                ]);
                $remain = $server->remain;
                $server->remain = $server->quota - $server->used;
                if ($remain < ($this->config->cli->pause_server_remain * 1024 * 1024) || $server->remain < ($this->config->cli->pause_server_remain * 1024 * 1024)) {
                    if ($server->remain < ($this->config->cli->pause_server_remain * 1024 * 1024)) {
                        $server->enable = 'No';
                    } else {
                        $server->enable = 'Yes';
                    }
                }
                $server->save();
            }
        }
    }

    public function transferAction($params)
    {
        set_time_limit(0);
        if (!isset($params[0]) || !is_numeric($params[0])) {
            echo "Invalid transfer id\n";
            return;
        }
        $id = intval($params[0]);
        $server = Servers::findFirst([
            'id = :id:',
            'bind' => [
                'id' => $id,
            ],
        ]);
        if (!$server) {
            echo "Server #{$id} Not found\n";
            return;
        }
        $lock = fopen(APP_DIR . '/cache/locks/transfer' . $id . '.lock', 'w+');
        if (!flock($lock, LOCK_EX | LOCK_NB)) {
            echo "Server Transfer  thread #{$id} is already running\n";
            return;
        }

        while (!file_exists(APP_DIR . '/cache/locks/transfer' . $id . '.shutdown')) {
            $transfered = $server->transfer(APP_DIR . '/cache/files/' . $server->getId() . '/', '');
            if (!empty($transfered)) {
                $files = $server->getFiles([
                    "name IN ({name:array}) AND status = 'Transferring'",
                    'bind' => [
                        'name' => $transfered,
                    ],
                ]);

                if ($files) {
                    foreach ($files as $file) {
                        @unlink(APP_DIR . '/cache/files/' . $server->getId() . '/' . date('Ymd', strtotime($file->created_at)) . '/' . $file->name);
                        $file->status = 'Success';
                        $file->save();
                    }
                }
            }

            for ($i = 0; $i < $this->config->cli->transfer_delays; $i++) {
                sleep(1);
                if (file_exists(APP_DIR . '/cache/locks/transfer.now')) {
                    unlink(APP_DIR . '/cache/locks/transfer.now');
                    break;
                }
                if (file_exists(APP_DIR . '/cache/locks/transfer' . $id . '.shutdown')) {
                    break;
                }
            }
        }
        unlink(APP_DIR . '/cache/locks/transfer' . $id . '.shutdown');
        fclose($lock);
        echo "Thread stops by shutdown signal\n";
    }

    public function feedAction($params = array())
    {
        set_time_limit(0);
        if (!isset($params[0]) || !is_numeric($params[0])) {
            echo "Invalid fetch id\n";
            return;
        }
        $id = intval($params[0]);
        $lock = fopen(APP_DIR . '/cache/locks/feed' . $id . '.lock', 'w+');
        if (!flock($lock, LOCK_EX | LOCK_NB)) {
            echo "Feed thread #{$id} is already running\n";
            return;
        }

        while (!file_exists(APP_DIR . '/cache/locks/feed' . $id . '.shutdown')) {
            do {
                $files = Files::find([
                    "status = 'Waiting' OR (status = 'InProgress' AND locked_at < :time:)",
                    'bind' => [
                        'time' => date('Y-m-d H:i:s', time() - 60),
                    ],
                ]);
                if (!empty($files)) {
                    foreach ($files as $file) {
                        if (!$this->redis->sismember('sharifFiles', $file->getId()) && !$this->redis->sismember('sharifSelected', $file->getId())) {
                            $file->locked_at = date('Y-m-d H:i:s');
                            $file->status = 'InProgress';
                            if ($file->save()) {
                                $this->redis->sadd('sharifFiles', [$file->getId()]);
                                $this->redis->set('sharifFile:' . $file->getId(), serialize($file));
                            }
                        }
                    }
                }
                sleep($this->config->cli->feed_delays);
            } while (!file_exists(APP_DIR . '/cache/locks/feed' . $id . '.shutdown') && count($files));
            sleep($this->config->cli->feed_delays);
        }
        unlink(APP_DIR . '/cache/locks/feed' . $id . '.shutdown');
        fclose($lock);
        echo "Thread stops by shutdown signal\n";
    }

    public function fetchAction($params = array())
    {
        set_time_limit(0);
        if (!isset($params[0]) || !is_numeric($params[0])) {
            echo "Invalid fetch id\n";
            return;
        }
        $id = intval($params[0]);
        $lock = fopen(APP_DIR . '/cache/locks/fetch' . $id . '.lock', 'w+');
        if (!flock($lock, LOCK_EX | LOCK_NB)) {
            echo "Fetch thread #{$id} is already running\n";
            return;
        }

        while (!file_exists(APP_DIR . '/cache/locks/fetch' . $id . '.shutdown')) {
            while (!file_exists(APP_DIR . '/cache/locks/fetch' . $id . '.shutdown') && ($fileId = $this->redis->srandmember('sharifFiles'))) {
                $this->redis->smove('sharifFiles', 'sharifSelected', $fileId);
                $file = unserialize($this->redis->get('sharifFile:' . $fileId));
                set_time_limit(0);
                $website = $file->getWebsite();
                if (!$website || !class_exists('\\Shariftube\\Websites\\' . $website->name)) {
                    if ($file->setFailed() && $file->save()) {
                        $this->redis->del('sharifFile:' . $fileId);
                        $this->redis->srem('sharifSelected', $fileId);
                    } else {
                        $this->redis->smove('sharifSelected', 'sharifFiles', $fileId);
                    }
                    continue;
                }

                $leecher = '\\Shariftube\\Websites\\' . $website->name;
                $leecher = new $leecher;
                $result = $leecher->getVideo($file);
                if ($result === null) {
                    $this->redis->del('sharifFile:' . $fileId);
                    $this->redis->srem('sharifSelected', $fileId);
                    continue;
                } elseif (!$result) {
                    if ($file->setFailed() && $file->save()) {
                        $this->redis->del('sharifFile:' . $fileId);
                        $this->redis->srem('sharifSelected', $fileId);
                    } else {
                        $this->redis->smove('sharifSelected', 'sharifFiles', $fileId);
                    }
                    continue;
                }
                $file->status = ($result > 1 ? 'Success' : 'Transferring');
                if ($file->save()) {
                    file_put_contents(APP_DIR . '/cache/locks/transfer.now', '');
                    $this->redis->del('sharifFile:' . $fileId);
                    $this->redis->srem('sharifSelected', $fileId);
                } else {
                    $this->redis->smove('sharifSelected', 'sharifFiles', $fileId);
                }
            }

            sleep($this->config->cli->fetch_delays);
        }
        unlink(APP_DIR . '/cache/locks/fetch' . $id . '.shutdown');
        fclose($lock);
        echo "Thread stops by shutdown signal\n";
    }
}