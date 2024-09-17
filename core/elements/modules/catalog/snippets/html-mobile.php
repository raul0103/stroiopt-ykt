<?php

$snippets_path = MODX_CORE_PATH . "elements/modules/catalog/snippets/";
$catalog_json = include $snippets_path . "data.php";

$catalog_json = str_replace("}{", "},{", $catalog_json);
$catalog_items = json_decode($catalog_json);

$cat_html = '<ul class="">';
foreach ($catalog_items as $catalog_item) {
    $cat_html .= "<a href='$catalog_item->link' class='pseudo-arrow pseudo-arrow__right'>$catalog_item->menutitle</a>";
}
$cat_html .= '</ul>';

$outer = $cat_html;

return $outer;
