<?php
return new \Phalcon\Config(array(
    'mail' => array(
        'host' => 'smtp.mandrillapp.com',
        'port' => '587',
        'username' => 'mrezamaghoul@gmail.com',
        'password' => 'vow1bHRWREYKJCzeRf5k3g',
        'security' => '',
        'timeout' => '30',
        'fromname' => 'Shariftube',
        'from' => 'noreplay@shariftube.ir',
    ),
    'database' => array(
        'adapter' => 'Mysql',
        'host' => 'localhost',
        'username' => 'shariftube',
        'password' => 'q4FCzTQ3rjEBRCrQ',
        'dbname' => 'shariftube',
        'charset' => 'utf8',
//        'options' => array(
//            PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
//        )
    ),
    'application' => array(
        'controllersDir' => APP_DIR . '/controllers/',
        'tasksDir' => APP_DIR . '/tasks/',
        'modelsDir' => APP_DIR . '/models/',
//        'formsDir' => APP_DIR . '/forms/',
        'viewsDir' => APP_DIR . '/views/',
        'libraryDir' => APP_DIR . '/library/',
        'cacheDir' => APP_DIR . '/cache/',
        'baseUri' => '/',
        'publicUrl' => 'shariftube.ir',
        'cryptSalt' => 'BNKxkQBU0OimPgXJY8xJvGpd',
        'affiliate_percentage' => '30',
        'redis_server' => 'tcp://127.0.0.1:6379',
    ),
    'cli' => array(
        'fetch_threads' => 1,
        'fetch_delays' => 5, // seconds
        'feed_threads' => 1, // must be always 1
        'feed_delays' => 3, // seconds
        'transfer_delays' => 60, // seconds
        'delete_after' => 7, // days
        'pause_server_remain' => 100, // mega bytes
        'curl_cache_lifetime' => 900, // seconds
    ),
    'crons' => array(
        'remove' => '0 1 * * *',
        'transferFiles' => '*/2 * * * *',
        'userFresher' => '*/2 * * * *',
        'cleanOldCache' => '0 * * * *',
    ),
));
