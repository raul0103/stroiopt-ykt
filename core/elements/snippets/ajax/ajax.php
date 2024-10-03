<?php

if ($_SERVER['REQUEST_METHOD'] !== 'POST') return;

$input = file_get_contents('php://input');
$data = json_decode($input, true);

if (empty($data['ajax_connect']) || empty($data['action'])) return;

$pdoTools = $modx->getService("pdoTools");

switch ($data['action']) {
    case 'get-product-data':
        // sleep(1); // Без этого слишком быстро товар появляется и стремный резкий скачок происходит
        if (!$data['product_id']) exit("Не передан product_id");
        $product = $modx->getObject('msProduct', $data['product_id']);
        if (!$product) exit("Товар не найден");

        $outer = $pdoTools->getChunk("@FILE modules/product-cards/chunks/mini-product/item.tpl", [
            "product" => $product->toArray()
        ]);

        exit($outer);
}
