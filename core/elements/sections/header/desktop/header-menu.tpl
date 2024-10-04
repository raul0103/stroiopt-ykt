{set $parents = '0,-'~'catalog_id' | config}
<div class="header-menu">
  {'pdoMenu' | snippet : [ 
    'parents' => $parents
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
        {if $template !== 0}
          <a href="{$link}" class="pseudo-arrow pseudo-arrow__down">{$menutitle}</a>
        {else}
          <a class="pseudo-arrow pseudo-arrow__down">{$menutitle}</a>
        {/if}
          {$wrapper}
      </li>' 
    ]}
</div>
