<?php

/**
 * Разбивает массив на 2 части
 */

// Получаем количество элементов в массиве
$total_elems = count($array);

// Определяем размер каждой части (половины)
$half_size = ceil($total_elems / 2);

// Разбиваем массив на две части
return [
    array_slice($array, 0, $half_size),
    array_slice($array, $half_size)
];
