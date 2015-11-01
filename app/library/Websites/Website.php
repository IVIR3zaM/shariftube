<?php
namespace Shariftube\Websites;

use Shariftube\Models\Files;

interface Website
{
    public function getInfo($link = '');

    public function getVideo(Files $file);
}