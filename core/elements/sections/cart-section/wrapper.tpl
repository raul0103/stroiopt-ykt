{set $cart_total = $_modx->getPlaceholder('custom-placeholders')['counters']['cart']['total']}

<div class="cart-section section-margin">
  <div class="container">
    <div class="cart-section__top fs-h2">
      <h2>{$_modx->resource.pagetitle}</h2>
      <div class="muted-color">(<span data-cart-total-count>{$cart_total['count']}</span>)</div>
    </div>
    
    <div class="cart-section__row">
        {set $products = "@FILE modules/cart/backend/snippets/getProducts.php" | snippet}
        
        {if !$products}
            Нет товаров в корзине
        {else}
          <div class="cart-section__items">
            {foreach $products as $product}
              {set $product_fron_id = "product_fron_id"~$product.id}
              <div class="cart-section__item" id="{$product_fron_id}">
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
                            <button class="cart-section__item-delete-product" onclick="{$product_fron_id}.remove();cart.second_events.remove({$product.id});">Удалить из корзины</button>
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

        <div class="cart-section__side">
          <div class="cart-section__side-big">
            <div class="cart-section__side-big__info">
              <span class="dark-color">Всего позиций</span>
              <span class="dark-color fw-600" data-cart-total-count>{$cart_total['count']}</span>
            </div>
            <div class="cart-section__side-big__info">
              <span class="fs-title-2 fw-600">Итого</span>
              <div class="fs-h3 fw-600"><span data-cart-total-summ>{$cart_total['summ']}</span> руб.</div>
            </div>
            <div class="cart-section__side-big__controls">
              <a class="btn btn-primary" href="order/">
                Оформить заказ
              </a>
              <button class="btn btn-bordered" onclick="window.history.back();">
                Вернуться к покупкам
              </button>
            </div>
          </div>
          <div class="cart-section__side-small">
            <div class="fw-600">Другие способы оформления заказа:</div>
            <div class="cart-section__side-small__social">
              <a
                href="{'whatsapp-link'|config}"
                class="has-icon has-icon-whatsapp"
              ></a>
              <a
                href="{'telegram-link'|config}"
                class="has-icon has-icon-telegram"
              ></a>
            </div>
            <div class="">
              <a class="main-color fw-600" href="mailto:{'email' | config}">{'email' | config}</a>
            </div>
          </div>
        </div>
    </div>
  </div>
</div>