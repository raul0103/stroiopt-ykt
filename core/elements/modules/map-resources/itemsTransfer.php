<?php

/**
 * Скрипт перещает элементы в массиве
 * $data - массив с элемнтами
 * $transfer_ids - массив с ID которые нужно переместить на первый уровень в начало
 */

if (empty($data) || empty($transfer_ids)) return;

if (!function_exists('itemsTransfer')) {
    function itemsTransfer(&$array, &$items, $transfer)
    {

        foreach ($items as $index => &$item) {
            if (in_array($item['id'], $transfer)) {
                unset($items[$index]);
                array_unshift($array, $item);
            }

            if (!empty($item['children'])) {
                itemsTransfer($array, $item['children'], $transfer);
            }
        }
    }
}

$output = $data;

itemsTransfer($output, $output, $transfer_ids);

usort($output, function ($a, $b) use ($transfer_ids) {
    // Получаем позиции id в массиве сортировки
    $posA = array_search($a['id'], $transfer_ids);
    $posB = array_search($b['id'], $transfer_ids);

    // Если id есть в массиве сортировки, сортируем по их позиции
    if ($posA !== false && $posB !== false) {
        return $posA - $posB;
    }
    // Если только один из id есть в массиве сортировки, он идет раньше
    if ($posA !== false) return -1;
    if ($posB !== false) return 1;

    // Если ни один из id нет в массиве сортировки, оставляем их порядок
    return 0;
});


return $output;
