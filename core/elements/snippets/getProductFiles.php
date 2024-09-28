<?php

if (!$product_id) return;

$thumb_folder = "small/";
$table_prefix = $modx->getOption('table_prefix');

$sql = "SELECT
            `msProductFile`.`path` AS `path`,
            `msProductFile`.`url` AS `url`
        FROM
            `{$table_prefix}ms2_product_files` AS `msProductFile`
        WHERE
            (
                `msProductFile`.`product_id` = $product_id
                AND `msProductFile`.`parent` = 0
                AND `msProductFile`.`type` = 'image'
            )";
$result  = $modx->query($sql);
$rows = $result->fetchAll(PDO::FETCH_ASSOC);

$output = [];
foreach ($rows as $row) {
    if (!empty($row['path']) && !empty($row['url'])) {
        // Меняем путь к первой картинке на путь к уменьшенному изображению
        $thumb = str_replace($row['path'], $row['path'] . $thumb_folder, $row['url']);

        $output[] = [
            "image" => $row['url'],
            "thumb" => $thumb
        ];
    }
}

return $output;