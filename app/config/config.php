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
        'modelsDir' => APP_DIR . '/models/',
//        'formsDir' => APP_DIR . '/forms/',
        'viewsDir' => APP_DIR . '/views/',
        'libraryDir' => APP_DIR . '/library/',
        'cacheDir' => APP_DIR . '/cache/',
        'baseUri' => '/',
        'publicUrl' => 'shariftube.ir',
        'cryptSalt' => 'BNKxkQBU0OimPgXJY8xJvGpd',
        'affiliate_percentage' => '30',
    ),
));
