<?php

/**
 * Плейсхолдеры используемые по несколько раз на странице
 * Вызывается в начале странице в layouts/base.tpl
 */

$path = MODX_CORE_PATH . "/elements/snippets/placeholders/";
$files = ["counters", "limits"];

foreach ($files as $file) {
    $placeholders[$file] = include $path . "_{$file}.php";
}

return $placeholders;
