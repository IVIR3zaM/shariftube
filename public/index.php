<?php

//error_reporting(0);

try {
    define('BASE_DIR', dirname(__DIR__));
    define('APP_DIR', BASE_DIR . '/app');

	$config = include APP_DIR . '/config/config.php';

	include APP_DIR . '/config/loader.php';

	include APP_DIR . '/config/services.php';

//    include APP_DIR . '/config/helpers.php';

	/**
	 * Handle the request
	 */
	$application = new \Phalcon\Mvc\Application($di);

	echo $application->handle()->getContent();

} catch (Exception $e) {
	echo $e->getMessage(), '<br>';
	echo nl2br(htmlentities($e->getTraceAsString()));
}
