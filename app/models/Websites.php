<?php
namespace Shariftube\Models;

class Websites extends BaseModel
{
    public $name;
    public $domains;

    public function initialize()
    {
        parent::initialize();
        $this->hasMany('id', 'Shariftube\Models\Files', 'server_id', ['alias' => 'Files']);
    }

    static public function findWebsite($link = '')
    {
        $parse = parse_url($link);
        if (@$parse['host']) {
            $parse['host'] = strtolower($parse['host']);
            if (substr($parse['host'], 0 , 4) =='www.'){
                $parse['host'] = substr($parse['host'], 4);
            }
            $parse['host'] = preg_replace('/[^a-z0-9\-\.]+/', '', $parse['host']);
            return Websites::findFirst([
                "domains LIKE '%{$parse['host']}%'",
            ]);
        }
        return null;
    }
}
