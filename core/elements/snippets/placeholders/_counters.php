<?php

/**
 * Различные значения количеств
 */

$pdoTools = $modx->getService("pdoTools");

try {
    $product_total = $pdoTools->runSnippet("@FILE modules/cart/backend/snippets/getCartTotal.php");
} catch (Exception $e) {
}

return [
    'cart' => [
        'total' => [
            'count' => $product_total["count"] ?: 0,
            'summ' =>  $product_total["summ"] ?: 0
        ]
    ]
];
