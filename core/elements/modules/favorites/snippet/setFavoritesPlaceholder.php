<?php

/**
 * Получит из куки все ресурсы в избранном и запишет в плейсхолдер
 * Передать cookie_key при вызове сниппета
 */
if (empty($cookie_key)) return;

$favorite_ids = $_COOKIE[$cookie_key];
$favorite_ids = explode(",", $favorite_ids);
$modx->setPlaceholder($cookie_key, $favorite_ids);
