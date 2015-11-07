<?php
use Phalcon\Crypt;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Model\Metadata\Files as MetaDataAdapter;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Phalcon\Mvc\Model\Transaction\Manager as TransactionManager;
use Shariftube\Auth\Auth;
use Shariftube\Flash\Flash;
use Shariftube\Mail\Mail;
use Shariftube\Curl\Curl;


$di = new FactoryDefault();

$di->setShared('config', $config);

$di->setShared('transaction', function () {
    return new TransactionManager();
});

$di->setShared('curl', function () {
    return new Curl();
});

$di->setShared('url', function () use ($config) {
    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);
    $url->setStaticBaseUri('https://' . $config->application->publicUrl . $config->application->baseUri);
    return $url;
});

$di->setShared('view', function () use ($di, $config) {
    $view = new View();
    $view->setViewsDir($config->application->viewsDir);
    $view->registerEngines(array(
        '.volt' => function ($view, $di) use ($config) {

            $volt = new VoltEngine($view, $di);

            $volt->setOptions(array(
                'compiledPath' => $config->application->cacheDir . 'volt/',
                'compiledSeparator' => '_'
            ));

            $volt->getCompiler()->addFilter('md5', 'md5');
            $volt->getCompiler()->addFilter('intval', 'intval');
            $volt->getCompiler()->addFilter('strtotime', 'strtotime');
            $volt->getCompiler()->addFilter('vinixhash_encode', 'vinixhash_encode');
            $volt->getCompiler()->addFunction('number_format', 'number_format');
            $volt->getCompiler()->addFunction('implode', 'implode');

            return $volt;
        }
    ));

    return $view;
});


$di->setShared('db', function () use ($config) {
    global $mysql_last_check;
    $mysql_last_check = time();
    $connection = new DbAdapter(array(
        'host' => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname' => $config->database->dbname,
        'charset' => $config->database->charset,
        'persistent' => true,
//        'options' => (array) $config->database->options,
    ));

    $eventsManager = new EventsManager();
    $eventsManager->attach('db:beforeQuery', function () use ($connection) {
        global $mysql_last_check;
        if (/*$connection->getSQLStatement() != 'SELECT 1' && */$mysql_last_check < time() - 900) {
            /*try {
                $connection->execute('SELECT 1');
            } catch (\PDOException $e) {
                if (preg_match('/gone\s+away/i', $e->getMessage())) {*/
            try{
                $connection->connect();

            } catch (\Exception $e){

            }
            /*                }
                        }*/
        }
        $mysql_last_check = time();
        return true;
    });

    $connection->setEventsManager($eventsManager);
    return $connection;
});

$di->setShared('modelsMetadata', function () use ($config) {
    return new MetaDataAdapter(array(
        'metaDataDir' => $config->application->cacheDir . 'metaData/'
    ));
});


$di->setShared('session', function () {
    $session = new SessionAdapter();
    $session->start();
    return $session;
});


$di->setShared('crypt', function () use ($config) {
    $crypt = new Crypt();
    $crypt->setKey($config->application->cryptSalt);
    return $crypt;
});

$di->setShared('dispatcher', function () {
    $dispatcher = new Dispatcher();
    $dispatcher->setDefaultNamespace('Shariftube\Controllers');
    return $dispatcher;
});

$di->setShared('router', function () use ($di) {
    return require __DIR__ . '/routes.php';
});

$di->setShared('auth', function () {
    return new Auth();
});

$di->setShared('mail', function () {
    return new Mail();
});

$di->setShared('flash', function () {
    return new Flash(array(
        'error' => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice' => 'alert alert-info',
        'warning' => 'alert alert-warning'
    ));
});
