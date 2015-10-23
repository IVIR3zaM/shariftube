<?php
use Phalcon\Crypt;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Model\Metadata\Files as MetaDataAdapter;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Shariftube\Auth\Auth;
use Shariftube\Flash\Flash;
use Shariftube\Mail\Mail;


$di = new FactoryDefault();

$di->setShared('config', $config);

$di->setShared('url', function () use ($config) {
    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);
    $url->setStaticBaseUri('http://' . $config->application->publicUrl . $config->application->baseUri);
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
            $volt->getCompiler()->addFunction('number_format', 'number_format');
            $volt->getCompiler()->addFunction('implode', 'implode');

            return $volt;
        }
    ));

    return $view;
});


$di->setShared('db', function () use ($config) {
    return new DbAdapter(array(
        'host' => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname' => $config->database->dbname,
        'charset' => $config->database->charset,
//        'options' => (array) $config->database->options,
    ));
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
