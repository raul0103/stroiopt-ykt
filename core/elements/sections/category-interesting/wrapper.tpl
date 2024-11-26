
{if $_modx->resource.parent | resource : 'class_key' == 'msCategory'}
  {set $grandfather = $_modx->resource.parent | resource : 'parent'}
  {set $res = '-'~$_modx->resource.parent}
  
  {set $items = 'pdoResources' | snippet : [
    'parents' => $grandfather
    'depth' => 1
    'resources' => $res
    'tpl' => '@INLINE <a class="category-interesting__item" href="{$uri}">#{$pagetitle}</a>'
    'limit' => 4
    'sortby' => 'RAND()'
    'where' => '{"class_key":"msCategory"}'
  ]}
  
  {if $items}
  <div class="container">
    <div class="category-interesting section-margin">
      {$items}
    </div>
  </div>
  {/if}

{/if}