{extends "file:blocks/side-block/layouts/base.tpl"}

{block "big-info"}
     
<div class="side-block__big-title fs-title-1">Товары в заказе</div>

{if !$products} Пусто {else}
<div class="mini-products fs-body-2" data-opened-element="side-products">
    {set $idx = 0}
    {foreach $products as $product}
      {set $idx = $idx + 1}

      {include "file:modules/product-cards/chunks/mini-product/item.tpl"}
    {/foreach}

  {if $idx > 5}
    <button
      class="btn-more pseudo-arrow pseudo-arrow__down fs-body-2 main-color fw-600"
      data-opened-btn="side-products"
      data-active-text="Скрыть"
    >
      Показать все
    </button>
  {/if}
</div>
{/if}

<div class="side-block__big-info">
  <span class="dark-color fs-body-2">Итого</span>
  <span class="dark-color fw-600" data-cart-total-summ>
    {$_modx->getPlaceholder('custom-placeholders')['counters']['cart']['total']['summ']}
    руб.
  </span>
</div>

<div class="side-block__big-controls"></div>
{/block}
