<div class="mobile-menu" id="mobile-menu">
  
    {include 'file:sections/header/common/header-search.tpl' mobile=true}
  
    <div class="mobile-menu__items">
      
      {include 'file:modules/catalog/chunks/wrapper-mobile.tpl'}
  
      {'pdoMenu' | snippet : [ 
        'parents' => 0 
        'tplOuter' => '@INLINE{$wrapper}'
        'tpl' => '@INLINE
          <div class="mobile-menu__item">
              <a href="{$link}">{$menutitle}</a>
          </div>' 
        'tplInner' => '@INLINE {$wrapper}'
        'tplParentRow' => '@INLINE
          <div class="mobile-menu__item has-submenu">
            <a
              href="{$link}"
              class="pseudo-arrow pseudo-arrow__right"
              data-mobile-submenu-open="mobile-submenu-{$id}"
              >{$menutitle}</a
            >
            <div class="mobile-menu__submenu" id="mobile-submenu-{$id}">
              <div class="mobile-menu__item" data-mobile-submenu-back>Назад</div>
              {$wrapper}
            </div>
          </div>' 
      ]}
    </div>
  </div>