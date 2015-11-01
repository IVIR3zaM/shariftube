<?php
function vinixhash_encode($str = '')
{
    $key = 'abcdefghijklmnopqrstuvwxyz';
    $out = '';
    $l = strlen($key);
    for ($f = 0; $f < strlen($str); $f++) {
        $c = ord(substr($str, $f, 1));
        $s = $c % $l;
        $n = intval($c / $l);
        $out .= substr($key, $s, 1) . $n;
    }
    return $out;
}

function vinixhash_decode($str = '')
{
    $key = 'abcdefghijklmnopqrstuvwxyz';
    $out = '';
    $l = strlen($key);
    for ($f = 0; $f < strlen($str); $f++) {
        $s = intval(stripos($key, substr($str, $f++ ,1)));
        $n = intval(substr($str, $f ,1));
        $c = ($n*$l)+$s;
        $out .= chr($c);
    }
    return $out;
}