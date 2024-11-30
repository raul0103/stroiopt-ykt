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
    case 'get-catalog':
        $cache_options = [
            xPDO::OPT_CACHE_KEY => 'default/map-resources/' . $modx->context->key . '/',
        ];

        if ($cache_data = $modx->cacheManager->get($data['cache_name'], $cache_options)) {
            if ($data['device'] == 'desktop') {
                $output = $pdoTools->runSnippet("@FILE modules/catalog/snippets/html-desktop.php", [
                    'data' => $cache_data
                ]);
            } elseif ($data['device'] == 'mobile') {
                $output = $pdoTools->runSnippet("@FILE modules/mobile-menu/snippets/html-mobile.php", [
                    'data' => $cache_data
                ]);
                $output = json_encode($output);
            }

            exit($output);
        }
}
