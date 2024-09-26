<div class="cart-section section-margin">
  <div class="container">
    <div class="cart-section__top fs-h2">
      <h2>{$_modx->resource.pagetitle}</h2>
      <div class="muted-color">(<span data-cart-product-total>{$_modx->getPlaceholder('custom-placeholders')['counters']['cart']}</span>)</div>
    </div>
    
    <div class="cart-section__row">
        {set $products = "@FILE modules/cart/backend/snippets/getProducts.php" | snippet}
        
        {if !$products}
            Нет товаров в корзине
        {else}
          <div class="cart-section__row-items">
            {foreach $products as $product}
              <div class="cart-section__item">
                    <div class="cart-section__item-image" style="background-image: url('{$product['thumb']}');"></div>
                    <div class="cart-section__item-content">
                      <div class="cart-section__item-content__left">
                        <a class="cart-section__item-pagetitle fs-title-2 fw-600" href="{$product['uri']}">
                            {$product['pagetitle']}
                        </a>
                        <div class="cart-section__item-price muted-color">
                          {$product.price} руб.{if $product.unit}/{$product.unit}{/if}
                        </div>
                        <div class="cart-section__item-controls">
                            {include "file:modules/favorites/chunks/products/add-favorite-btn.tpl" product_id=$product.id text=true}
                        </div>
                      </div>
                      <div class="cart-section__item-content__right">
                        <div class="cart-section__item-summ fs-title-2 fw-600"><span data-cart-product-summ="{$product.id}">{$product.summ}</span> руб.</div>
                        {include "file:modules/cart/frontend/chunks/cart-product-controls.tpl" product_count=$product.count id=$product.id price=$product.price}
                      </div>
                    </div>
              </div>
            {/foreach}
          </div>
        {/if}
    </div>
  </div>
</div>