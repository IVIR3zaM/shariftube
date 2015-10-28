<?php
namespace Shariftube\Tasks;

use Phalcon\CLI\Task;
use Shariftube\Models\Files;
use Shariftube\Models\Servers;

class MainTask extends Task
{
    public function mainAction()
    {
        echo "Running Fetch Threads\n";
        for ($i = 1; $i <= $this->config->cli->fetch_threads; $i++) {
            echo "Running fetch thread #{$i}\n";
            exec(BASE_DIR . "/cli Main fetch {$i} &> /dev/null &");
        }
        echo "Running Feed Threads\n";
        for ($i = 1; $i <= $this->config->cli->feed_threads; $i++) {
            echo "Running feed thread #{$i}\n";
            exec(BASE_DIR . "/cli Main feed {$i} &> /dev/null &");
        }
        echo "Running Server transfer Threads\n";
        exec(BASE_DIR . "/cli Main transfer &> /dev/null &");
        echo "Finnish\n";
    }

    public function transferAction()
    {
        set_time_limit(0);
        $lock = fopen(APP_DIR . '/cache/locks/transfer.lock', 'w+');
        if (!flock($lock, LOCK_EX | LOCK_NB)) {
            echo "Server Transfer thread is already running\n";
            return;
        }
        while (!file_exists(APP_DIR . '/cache/locks/transfer.shutdown')) {
            $dirs = @scandir(APP_DIR . '/cache/files');
            $list = array();
            foreach ($dirs as $dir) {
                if (is_numeric($dir) && is_dir(APP_DIR . '/cache/files/' . $dir)) {
                    $subdirs = @scandir(APP_DIR . '/cache/files/' . $dir);
                    foreach ($subdirs as $subdir) {
                        if (is_numeric($subdir) && is_dir(APP_DIR . '/cache/files/' . $dir . '/' . $subdir)) {
                            $tmp = @scandir(APP_DIR . '/cache/files/' . $dir . '/' . $subdir);
                            foreach ($tmp as $temp) {
                                if (!is_dir(APP_DIR . '/cache/files/' . $dir . '/' . $temp)) {
                                    $list[] = $dir;
                                    break;
                                }
                            }
                        }
                    }

                }
            }

            if (!empty($list)) {
                $list = array_values($list);
                $servers = Servers::find([
                    'id IN ({ids:array})',
                    'bind' => [
                        'ids' => $list,
                    ],
                ]);

                foreach ($servers as $server) {
                    $transfered = $server->transfer(APP_DIR . '/cache/files/' . $server->getId() . '/', '');
                    if (!empty($transfered)) {
                        $files = $server->getFiles([
                            "name IN ({name:array}) AND status = 'Transfering'",
                            'bind' => [
                                'name' => $transfered,
                            ],
                        ]);

                        if ($files) {
                            foreach ($files as $file) {
                                $file->status = 'Success';
                                $file->save();
                            }
                        }
                    }
                }
            }

            for ($i = 0; $i < $this->config->cli->transfer_delays; $i++) {
                sleep(1);
                if (file_exists(APP_DIR . '/cache/locks/transfer.now')) {
                    unlink(APP_DIR . '/cache/locks/transfer.now');
                    break;
                }
                if (file_exists(APP_DIR . '/cache/locks/transfer.shutdown')) {
                    break;
                }
            }
        }
        unlink(APP_DIR . '/cache/locks/transfer.shutdown');
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
                $file->status = 'Transfering';
                if ($file->save()) {
                    file_put_contents(APP_DIR . '/cache/locks/transfer.now', '');
                    $this->redis->del('sharifFile:' . $fileId);
                    $this->redis->srem('sharifSelected', $fileId);
                } else {
                    $this->redis->smove('sharifSelected', 'sharifFiles', $fileId);
                }
                die('OK');
            }

            sleep($this->config->cli->fetch_delays);
        }
        unlink(APP_DIR . '/cache/locks/fetch' . $id . '.shutdown');
        fclose($lock);
        echo "Thread stops by shutdown signal\n";
    }
}