<?php
namespace Shariftube\Models;

class Websites extends BaseModel
{
    public $name;
    public $domains;

    public function ModelInitialize()
    {
        $this->hasMany('id', 'Shariftube\Models\Files', 'server_id', ['alias' => 'Files']);
    }

    static public function findWebsite($link = '')
    {
        $parse = parse_url($link);
        if (@$parse['host']) {
            return Websites::findFirst([
                'domains REGEXP :domain:',
                'bind' => [
                    'domain' => $parse['host'],
                ]
            ]);
        }
        return null;
    }
}
