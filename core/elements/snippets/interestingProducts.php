<?php

/**
 * Скрипт отдает ID интересных товаров. Всего 12 товаровы
 * 1. Находим первые 3 товара с наивысшим приоритетом
 * 2. 7 товаров из этой же категории по вычисляемому offset
 * 3. Выводим 2 товара из категории уровнем выше по двум предыдущим правилам
 */
function getPriorityProducts($rows, $limit)
{
    $filtered = array_filter($rows, function ($item) {
        return isset($item['value']) && $item['value'] !== null;
    });
    usort($filtered, function ($a, $b) {
        return $a['value'] <=> $b['value'];
    });
    $products = array_slice($filtered, 0, $limit);

    // Убираем из $rows элементы, которые есть в $products
    $rows = array_filter($rows, function ($item) use ($products) {
        foreach ($products as $product) {
            if ($product['id'] === $item['id']) {
                return false; // Исключаем элемент
            }
        }
        return true; // Оставляем элемент
    });
    return [
        'rows' => array_values($rows),
        'products' => $products
    ];
}

function getProduct($parent)
{
    global $modx;
    $table_prefix = $modx->getOption('table_prefix');
    $sql = "select
            sc.id,
            tv.value
        from
            {$table_prefix}site_content AS sc
            LEFT JOIN {$table_prefix}site_tmplvar_contentvalues as tv ON tv.tmplvarid = 9
            AND tv.contentid = sc.id
        where
            sc.parent = {$parent} AND sc.class_key = 'msProduct'";

    $result = $modx->query($sql);
    return $result->fetchAll(PDO::FETCH_ASSOC);
}

// >>> 1.
$rows = getProduct($modx->resource->parent);
if (empty($rows)) return;

$resource_index = array_search($modx->resource->id, array_column($rows, 'id'));
$priority_limit = 3;
$priority_products = getPriorityProducts($rows, $priority_limit);
$rows = $priority_products['rows'];
// <<<

// >>> 2.
if (count($priority_products['products']) == 0) {
    $chunk_size = 7 + $priority_limit;
} else {
    $chunk_size = 7;
}

$start = floor($resource_index / $chunk_size) * $chunk_size;
$group = array_slice($rows, $start, $chunk_size);

$products = array_merge($priority_products['products'], $group);
// <<<

// >>> 3.
// $parent = $modx->getObject('modResource', $modx->resource->parent);
// if ($parent->class_key == 'msCategory') {
//     $grandfather = $parent->parent;
//     $rows = getProduct($grandfather,true);

//     $priority_products = getPriorityProducts($rows, 2);
//    

//     $products = array_merge($priority_products['products'], $group);
// }
// <<<

$ids = array_column($products, 'id');

return implode(',', $ids);
