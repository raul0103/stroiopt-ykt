<?php

/**
 * Класс с основными методами используемыми во всех процессорах
 */
class Main
{
    public function getProduct($product_id)
    {
        global $modx;

        $res = $modx->getObject('msProduct', $product_id);
        return $res ?: null;
    }
}
