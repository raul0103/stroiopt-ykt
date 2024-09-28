{extends "file:blocks/side-block/layouts/base.tpl"}

{block "big-info"}
{set $product_id = $_modx->resource.id}
{set $unit = $_modx->resource.unit[0]}

<div class="side-block__big-info fs-body-2 dark-color">
  {include "file:modules/favorites/chunks/products/add-favorite-btn.tpl" text=true}
  <button class="has-icon has-icon-share">Поделиться</button>
</div>
<div class="side-block__big-info fs-h3">
  {$_modx->resource.price} руб. {if $unit}/{$unit}{/if} 
</div>
<div class="side-block__big-controls">
  {include "file:modules/product-cards/chunks/cart-controls.tpl"}
</div>
{/block}
