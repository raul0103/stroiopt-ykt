<?php

/**
 * Получаем данные для меню в формате JSON и кэшируем
 */

$cache_name = $parent_id;
$cache_options = [
    xPDO::OPT_CACHE_KEY => 'default/mobile-menu/' . $modx->context->key . '/',
];

if (!$output = $modx->cacheManager->get($cache_name, $cache_options)) {

    $table_prefix = $modx->getOption('table_prefix');

    $resources = []; // Ресурсы из нескольких итераций
    $iteration_count = $level ?: 0; // Кол-во итераций. Определяет глубину поиска ресурсов

    $data_ids = [];

    // >>> WHERE
    if (!empty($where)) {
        $where = json_decode($where);
    } else {
        $where = [];
    }
    $where = array_merge((array)$where, ["published" => 1, "hidemenu" => 0]);
    $where_string = "";
    foreach ($where as $key => $value) {
        $where_string .= " `$key` = '$value' AND ";
    }
    // <<<


    for ($i = 0; $i <= $iteration_count; $i++) {
        // $sql = "SELECT id,menutitle,pagetitle,uri,parent FROM {$table_prefix}site_content";
        $sql = "SELECT id,menutitle,pagetitle,uri as link,parent FROM {$table_prefix}site_content  ";
        $sql .= " WHERE $where_string ";

        if ($i === 0) {
            $sql .= " parent = $parent_id";
        } else {
            $prev_iteration_index = $i - 1;
            // $parent_ids = array_map(function ($item) {
            //     return $item['id'];
            // }, $parents[$prev_iteration_index]); // ID родителей прошлой итерации

            // $sql .= " WHERE parent IN (" . implode(',', $parent_ids) . ")";
            $sql .= " parent IN (" . implode(',', $data_ids[$prev_iteration_index]) . ")";
        }
        $result = $modx->query($sql);
        $data = $result->fetchAll(PDO::FETCH_ASSOC);

        $resources = array_merge($resources, array_values($data));

        // Сохраняем в массив 
        $data_ids[] = array_map(function ($item) {
            return $item['id'];
        }, $data);
    }

    // Формируем древовидную структуру
    // Фокус. Работаем с конца, так как будем удалять ресурс который нашел родителя
    $resources = array_reverse($resources);

    foreach ($resources as &$resource) {
        foreach ($resources as $index_resource2 => $resource2) {
            if ($resource['id'] == $resource2['parent']) {
                $resource['children'][] = $resource2;
                unset($resources[$index_resource2]);
            }
        }
    }
    $resources = array_reverse($resources);

    $output = json_encode($resources, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);


    $modx->cacheManager->set($cache_name, $output, 0, $cache_options);
}

return $output;
