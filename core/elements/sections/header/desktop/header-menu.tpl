<div class="header-menu">
  {'pdoMenu' | snippet : [ 
    'parents' => 0 
    'tplOuter' => '@INLINE
      <ul class="header-menu__nav">
          {$wrapper}
      </ul>'
    'tpl' => '@INLINE
      <li class="header-menu__nav-item">
          <a href="{$link}">{$menutitle}</a>
      </li>' 
    'tplInner' => '@INLINE
      <ul class="header-menu__nav-submenu">
          {$wrapper}
      </ul>'
    'tplParentRow' => '@INLINE
      <li class="header-menu__nav-item has-submenu">
          <a href="{$link}" class="pseudo-arrow pseudo-arrow__down">{$menutitle}</a>
          {$wrapper}
      </li>' 
    ]}
</div>
