<?php
$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerNamespaces(array(
    'Shariftube\Models' => $config->application->modelsDir,
    'Shariftube\Controllers' => $config->application->controllersDir,
//    'Shariftube\Forms' => $config->application->formsDir,
    'Shariftube' => $config->application->libraryDir
));

$loader->register();

// Use composer autoloader to load vendor classes
require_once __DIR__ . '/../../vendor/autoload.php';
