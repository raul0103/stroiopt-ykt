<?php

$cat_html = '<ul class="catalog-header__nav-items">';
$subcat_html = '';
foreach ($data as $catalog_item) {

    // Идем по категориям
    if ($catalog_item['children'] && $catalog_item['id']) {
        // HTML подкатегорий
        $subcat_html .= "<div class='catalog-header__nav-items' id='catalog-subcat-{$catalog_item['id']}'>
                            <div class='catalog-header__nav-items-title fs-title-1'>
                                {$catalog_item['menutitle']}
                            </div>
                            <ul class='catalog-header__nav-items-row'>";

        // Идем по подкатегориям
        foreach ($catalog_item['children'] as $subcat) {
            $subcat_html .= "<li class='catalog-header__nav-item'>
                                     <a href='{$subcat['uri']}'>{$subcat['menutitle']}</a>
                                 </li>";
        }
        $subcat_html .= "</ul></div>";

        $bestseller = $catalog_item['bestseller'] ? '<div class="rating-stars-static"><span class="full"></span></div>' : '';
        $cat_html .= "<li class='catalog-header__nav-item has-submenu' data-subcategories-open='catalog-subcat-{$catalog_item['id']}'>
                              <a href='{$catalog_item['uri']}' class='pseudo-arrow pseudo-arrow__right d-flex gap-8'>$bestseller {$catalog_item['menutitle']}</a>
                          </li>";
    } else {
        $cat_html .= "<li class='catalog-header__nav-item' data-subcategories-open>
                              <a href='{$catalog_item['uri']}'>{$catalog_item['menutitle']}</a>
                          </li>";
    }
}

$cat_html .= '</ul>';
$outer = "<div class='catalog-header__nav-categories'>$cat_html</div>
              <div class='catalog-header__nav-subcategories'>$subcat_html</div>";

return $outer;
