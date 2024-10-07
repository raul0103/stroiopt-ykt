<?php

/**
 * Отдает массив ID ресурсов по OFFSET и LIMIT
 * $offset 
 * $limit
 */
if (!isset($offset) || !isset($limit)) return;

$table_prefix = $modx->getOption('table_prefix');
$sql = "SELECT id FROM {$table_prefix}site_content WHERE published = 1 AND deleted = 0 AND hidemenu = 0 LIMIT $limit OFFSET $offset";
$result = $modx->query($sql);

$rows = $result->fetchAll(PDO::FETCH_ASSOC);

$ids = array_map(function ($row) {
    return $row['id'];
}, $rows);

if ($outer_type == "string") {
    return implode(',', $ids);
} else {
    return $ids;
}
