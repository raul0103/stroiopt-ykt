<?php

$snippets_path = MODX_CORE_PATH . "elements/modules/catalog/snippets/";
$catalog_json = include $snippets_path . "data.php";

$catalog_json = str_replace("}{", "},{", $catalog_json);
$catalog_items = json_decode($catalog_json);

$cat_html = '<ul class="catalog-header__nav-items">';
$subcat_html = '';
foreach ($catalog_items as $catalog_item) {

    // Идем по категориям
    if ($catalog_item->children && $catalog_item->id) {
        // HTML подкатегорий
        $subcat_html .= "<ul class='catalog-header__nav-items' id='catalog-subcat-$catalog_item->id'>";
        // Тайтл категории
        $subcat_html .= "<li class='catalog-header__nav-title fs-title-1'>
                                $catalog_item->menutitle
                             </li>";
        // Идем по подкатегориям
        foreach ($catalog_item->children as $subcat) {
            $subcat_html .= "<li class='catalog-header__nav-item'>
                                     <a href='$subcat->link'>$subcat->menutitle</a>
                                 </li>";
        }
        $subcat_html .= "</ul>";

        $cat_html .= "<li class='catalog-header__nav-item has-submenu' data-subcategories-open='catalog-subcat-$catalog_item->id'>
                              <a href='$catalog_item->link' class='pseudo-arrow pseudo-arrow__right'>$catalog_item->menutitle</a>
                          </li>";
    } else {
        $cat_html .= "<li class='catalog-header__nav-item' data-subcategories-open>
                              <a href='$catalog_item->link'>$catalog_item->menutitle</a>
                          </li>";
    }
}

$cat_html .= '</ul>';
$outer = "<div class='catalog-header__nav-categories'>$cat_html</div>
              <div class='catalog-header__nav-subcategories'>$subcat_html</div>";

return $outer;
