<div class="menu-header">
    {'pdoMenu' | snippet : [
        'parents' => 0
        'tplOuter' => '@INLINE
            <ul class="menu-header__nav fs-body-2">
                {$wrapper}
            </ul>'
        'tpl' => '@INLINE 
            <li class="menu-header__nav-item">
                <a href="{$link}">{$menutitle}</a> 
            </li>'
        'tplInner' => '@INLINE 
            <ul class="menu-header__nav-submenu">
                {$wrapper}
            </ul>'
        'tplParentRow' => '@INLINE
            <li class="menu-header__nav-item has-submenu">
                <a href="{$link}">{$menutitle}</a> 
                {$wrapper}
            </li>'
    ]}
</div>