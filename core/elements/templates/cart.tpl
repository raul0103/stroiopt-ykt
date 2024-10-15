{extends "file:layouts/base.tpl"} 

{block 'content'}

{set $cart_total = $_modx->getPlaceholder('custom-placeholders')['counters']['cart']['total']}

<div class="cart-page section-margin section-margin-top">
    <div class="container">
      <div class="cart-page__top fs-h2">
        <h2>{$_modx->resource.pagetitle}</h2>
        <div class="muted-color">
          (<span data-cart-total-count>{$cart_total['count']}</span>)
        </div>
      </div>
  
      <div class="cart-page__row">
        {set $products = "@FILE modules/cart/backend/snippets/getProducts.php" | snippet} 
        
        {if !$products}
        <div class="cart-page__items">Пусто</div>
        {else}
        <div class="cart-page__items">
          <button class="cart-page__item-delete-btn delete-all error-color" onclick="cart.events.clear();setTimeout(()=>{ location.reload() }, 3000)">
            Очистить корзину
          </button>

          {foreach $products as $product} 
          {set $product_fron_id = "product_fron_id"~$product.id}
          <div class="cart-page__item" id="{$product_fron_id}">
            <div
              class="cart-page__item-image"
              style="background-image: url('{$product['thumb']}')"
            ></div>
            <div class="cart-page__item-content">
              <div class="cart-page__item-content__left">
                <a
                  class="cart-page__item-pagetitle fs-title-2 fw-600"
                  href="{$product['uri']}"
                >
                  {$product['pagetitle']}
                </a>
                <div class="cart-page__item-price muted-color">
                  {$product.price} руб.{if $product.unit}/{$product.unit}{/if}
                </div>
                <div class="cart-page__item-controls">
                  {include "file:modules/favorites/chunks/products/add-favorite-btn.tpl" product_id=$product.id text=true}
                  <button
                    class="cart-page__item-delete-btn muted-color"
                    onclick="{$product_fron_id}.remove();cart.events.remove({$product.id});"
                  >
                    Удалить из корзины
                  </button>
                </div>
              </div>
              <div class="cart-page__item-content__right">
                <div class="cart-page__item-summ fs-title-2 fw-600">
                  <span data-cart-product-summ="{$product.id}"
                    >{$product.summ}</span
                  >
                  руб.
                </div>
                {include "file:modules/cart/frontend/chunks/cart-product-controls.tpl" product_count=$product.count id=$product.id price=$product.price}
              </div>
            </div>
          </div>
          {/foreach}
        </div>
        {/if} 
        
        {include "file:blocks/side-block/chunks/cart.tpl"}
      </div>
    </div>
</div>

    {set $parents_interesting =  'catalog_id' | config}
    {include "file:sections/product-interesting/wrapper.tpl" parents=$parents_interesting}
{/block}
