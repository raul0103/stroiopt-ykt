<?php

/**
 * Различные значения количеств
 */

$pdoTools = $modx->getService("pdoTools");

try {
    $product_total = $pdoTools->runSnippet("@FILE modules/cart/backend/snippets/getProductTotal.php");
} catch (Exception $e) {
}

return [
    'cart' => $product_total ?: 0 // Кол-во товара в корзине
];
