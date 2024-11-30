<?php

$options = [
    ["title" => "Объем, м3", "key" => "obem-m3"],
    ["title" => "Вес, т", "key" => "mass-t"],
    ["title" => "Масса, т", "key" => "massa-t"],
    ["title" => "Длина, мм", "key" => "dlina-mm"],
    ["title" => "Ширина, мм", "key" => "shirina-mm"],
    ["title" => "Высота, мм", "key" => "vysota-mm"],
];

// $ids_plitdorozh = $modx->getOption('ids_plitdorozh');
// if (!empty($ids_plitdorozh)) {
//     $ids_plitdorozh = explode(',', $ids_plitdorozh);
// } else {
//     $ids_plitdorozh = [];
// }

// if (!in_array($modx->resource->id, $ids_plitdorozh)) {
//     array_unshift($options, ["title" => "ГОСТ", "key" => "gost"]);
// }

return $options;
