<?php
namespace Shariftube\Models;

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Behavior\SoftDelete;

abstract class BaseModel extends Model
{
    protected $id;

    public function initialize()
    {
        if (property_exists(get_called_class(), 'deleted_at')) {
            $this->addBehavior(
                new SoftDelete([
                    'field' => 'deleted_at',
                    'value' => date('Y-m-d H:i:s'),
                ])
            );
        }
    }

    public function getId()
    {
        return $this->id;
    }

    public function beforeCreate()
    {
        if (property_exists(get_called_class(), 'created_at')) {
            $this->created_at = date('Y-m-d H:i:s');
        }
    }

    public function beforeSave()
    {
        if (property_exists(get_called_class(), 'modified_at')) {
            $this->modified_at = date('Y-m-d H:i:s');
        }
    }
}
