{if $ids}
  {'pdoMenu' | snippet : [
    'parents' => 0
    'resources' => $ids | join
    'tpl' => '@INLINE <li><a class="hover-opacity-7" href="{$link}">{$menutitle}</a></li>'
    'tplOuter' => '@INLINE <ul class="footer__top-menu__list">{$wrapper}</ul>'
    'showHidden' => 1
  ]}
{/if}