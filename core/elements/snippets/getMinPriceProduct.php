<?php

$table_prefix = $modx->getOption('table_prefix');
$sql = "select price from {$table_prefix}ms2_products order by price asc limit 1";
$results = $modx->query($sql);
$row = $results->fetch(PDO::FETCH_ASSOC);
return $row['price'];
