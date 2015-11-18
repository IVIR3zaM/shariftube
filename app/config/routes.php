<?php
/*
 * Define custom routes. File gets included in the router service definition.
 */

$router = new Phalcon\Mvc\Router(false);

$router->add('/', array(
    'controller' => 'index',
    'action' => 'index',
))->setName('home');

$router->add('/comment/(.*)', array(
    'controller' => 'index',
    'action' => 'comment',
    'auth' => 1,
))->setName('comment');

$router->add('/link/(.+)', array(
    'controller' => 'index',
    'action' => 'index',
    'link' => 1,
))->setName('link');

$router->add('/unsubscribe/(.+)', array(
    'controller' => 'index',
    'action' => 'unsubscribe',
    'email' => 1,
))->setName('link');

$router->add('/video/(.+)', array(
    'controller' => 'index',
    'action' => 'video',
    'id' => 1,
))->setName('video');

$router->add('/play/([0-9]+)', array(
    'controller' => 'index',
    'action' => 'play',
    'id' => 1,
))->setName('play');

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

$router->add('/files/:params', array(
    'controller' => 'index',
    'action' => 'files',
    'params' => 1,
))->setName('files');

$router->add('/shop/([\w]*)', array(
    'controller' => 'index',
    'action' => 'shop',
    'back' => 1,
))->setName('shop');

$router->add('/purchases/([0-9]*)', array(
    'controller' => 'index',
    'action' => 'purchases',
    'page' => 1,
))->setName('purchases');

$router->add('/support/:params', array(
    'controller' => 'index',
    'action' => 'tickets',
    'params' => 1,
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
