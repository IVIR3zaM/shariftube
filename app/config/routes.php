<?php
/*
 * Define custom routes. File gets included in the router service definition.
 */

$router = new Phalcon\Mvc\Router(false);

$router->add('/', array(
    'controller' => 'index',
    'action' => 'index',
))->setName('home');

$router->add('/link/(.+)', array(
    'controller' => 'index',
    'action' => 'index',
    'link' => 1,
))->setName('link');

$router->add('/search/:params', array(
    'controller' => 'index',
    'action' => 'search',
    'params' => 1,
))->setName('search');

$router->add('/login/', array(
    'controller' => 'index',
    'action' => 'login',
))->setName('login');

$router->add('/login/(.+)', array(
    'controller' => 'index',
    'action' => 'login',
    'code' => 1,
))->setName('forgot');

$router->add('/logout/', array(
    'controller' => 'index',
    'action' => 'logout',
))->setName('logout');

$router->add('/files/([0-9]*)', array(
    'controller' => 'index',
    'action' => 'files',
    'page' => 1,
))->setName('files');

$router->add('/shop/', array(
    'controller' => 'index',
    'action' => 'shop',
))->setName('shop');

$router->add('/purchases/', array(
    'controller' => 'index',
    'action' => 'purchases',
))->setName('purchases');

$router->add('/support/', array(
    'controller' => 'index',
    'action' => 'tickets',
))->setName('support');

$router->add('/ticket/([0-9]*)', array(
    'controller' => 'index',
    'action' => 'ticket',
    'id' => 1,
))->setName('ticket');

$router->add('/settings/', array(
    'controller' => 'index',
    'action' => 'settings',
))->setName('settings');

$router->notFound(
    array(
        'controller' => 'index',
        'action' => 'route404'
    )
);

return $router;
