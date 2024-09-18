<?php

if (empty($data)) return;

if (!function_exists("generateModal")) {
    function generateModal(&$menu_modals, $data)
    {
        $menu_modals .= "<div class='mobile-menu__modal' data-mobile-modal='mobile-modal-$data->id'>
                            <div class='mobile-menu__items'>
                            <div class='mobile-menu__back pseudo-arrow-before pseudo-arrow-before__left' data-mobile-modal-back>Назад</div>";

        foreach ($data->children as $children) {
            $open_btn = "";
            if ($children->children) {
                $open_btn = "<span 
                            data-mobile-modal-open='mobile-modal-$children->id'\
                            class='pseudo-arrow pseudo-arrow__right'
                            ></span>";

                $menu_modals .= "<div class='mobile-menu__item'>
                                    <a href='$children->link'>$children->menutitle</a>
                                    $open_btn
                                </div>";
            } else {
                $menu_modals .= "<div class='mobile-menu__item'>
                                    <a href='$children->link'>$children->menutitle</a>
                                </div>";
            }
        }
        $menu_modals .= "</div></div>";

        // Формируем бесконечную вложенность
        foreach ($data->children as $children) {
            if ($children->children) {
                generateModal($menu_modals,  $children);
            }
        }
    }
}

$catalog_json = str_replace("}{", "},{", $data);
$catalog_items = json_decode($catalog_json);

$menu_items = "";
$menu_modals = "";
foreach ($catalog_items as $catalog_item) {
    $open_btn = "";
    if ($catalog_item->children) {
        $open_btn = "<span 
                    data-mobile-modal-open='mobile-modal-$catalog_item->id'\
                    class='pseudo-arrow pseudo-arrow__right'
                    ></span>";

        generateModal($menu_modals, $catalog_item);
    }

    $menu_items .= "<div class='mobile-menu__item'>
                        <a href='$catalog_item->link'>$catalog_item->menutitle</a>
                        $open_btn
                    </div>";
}

return [
    "menu-items" => $menu_items,
    "menu-modals" => $menu_modals
];
