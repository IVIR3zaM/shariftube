<?php
namespace Shariftube\Tasks;

use Phalcon\CLI\Task;
use Shariftube\Models\Files;

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
        echo "Finnish\n";
    }

    public function feedAction($params = array())
    {
        if (!isset($params[0]) && !is_numeric($params[0])) {
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
                    'bind' =>[
                        'time'=>date('Y-m-d H:i:s', time() - 60),
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
            } while(count($files));
            sleep($this->config->cli->feed_delays);
        }
        unlink(APP_DIR . '/cache/locks/feed' . $id . '.shutdown');
        fclose($lock);
        echo "Thread stops by shutdown signal\n";
    }

    public function fetchAction($params = array())
    {
        if (!isset($params[0]) && !is_numeric($params[0])) {
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


            sleep($this->config->cli->fetch_delays);
        }
        unlink(APP_DIR . '/cache/locks/fetch' . $id . '.shutdown');
        fclose($lock);
        echo "Thread stops by shutdown signal\n";
    }
}