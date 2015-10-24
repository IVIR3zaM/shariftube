<?php
namespace Shariftube\Websites;

interface Website
{
    public function getInfo($link);

    public function getVideo($link);
}