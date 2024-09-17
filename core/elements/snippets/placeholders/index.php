<?php

/**
 * Плейсхолдеры используемые по несколько раз на странице
 * Вызывается в начале странице в layouts/base.tpl
 */

$path = MODX_CORE_PATH . "/elements/snippets/placeholders/";
$placeholders = [
    'counters' => include $path . "_counters.php"
];

return $placeholders;
