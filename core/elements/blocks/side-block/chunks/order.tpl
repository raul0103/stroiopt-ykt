{extends "file:blocks/side-block/layouts/base.tpl"}

{block "big-info"}
{set $products = "@FILE modules/cart/backend/snippets/getProducts.php" | snippet}
     
<div class="side-block__big-title fs-title-1">Товары в заказе</div>

{if !$products} Нет товаров в корзине {else}
<div class="side-block__products fs-body-2" data-opened-element="side-products">
    {set $idx = 0}
    {foreach $products as $product}
    {set $idx = $idx + 1}

    <a class="side-block__product {if $idx > 5}hidden{/if}" href="{$product['uri']}">
      <div class="side-block__product-row">
        <div
          class="side-block__product-image"
          style="background-image: url('{$product['thumb']}')"
        ></div>
        <div class="side-block__product-content">
          <div class="side-block__product-pagetitle fw-600">
            {$product['pagetitle']}
          </div>
          <div class="side-block__product-price muted-color">
            {$product['count']} x {$product['price']} руб.
          </div>
        </div>
      </div>
    </a>
    {/foreach}

  <button
    class="btn-more pseudo-arrow pseudo-arrow__down fs-body-2 main-color fw-600"
    data-opened-btn="side-products"
    data-active-text="Скрыть"
  >
    Показать все
  </button>
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
