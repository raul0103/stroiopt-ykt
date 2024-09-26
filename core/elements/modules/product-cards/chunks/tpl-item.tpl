{set $product_data = '@FILE modules/cart/backend/snippets/getProductData.php' | snippet : [
  'product_id' => $id
]}

<div class="product-card">
  <div class="product-card__content">
    <div class="product-card__top">
      {include "file:modules/product-cards/chunks/remains.tpl"}
      {include "file:modules/favorites/chunks/products/add-favorite-btn.tpl" product_id=$id}
    </div>

    <div class="product-card__image">
      <a href="{$id | url}">
        {if $thumb?}
        <img src="{$thumb}" alt="{$pagetitle}" title="{$pagetitle}" />
        {else}
        <div class="product-card__image-empty"></div>
        {/if}
      </a>
    </div>
    
    <div class="rating-stars-static">
      <span class="full"></span>
      <span class="full"></span>
      <span class="full"></span>
      <span class="full"></span>
      <span class="full"></span>
    </div>

    <div class="product-card__title">
      <a class="fw-600" href="{$id | url}">{$pagetitle}</a>
    </div>

    {include "file:modules/product-cards/chunks/options.tpl"}

    <div class="product-card__price">
      <span class="product-card__price-current fs-title-2">{$price} руб.</span>
      {if $old_price?}
        <span class="product-card__price-old fs-caption error-color">{$old_price} руб.</span>
      {/if}
    </div>
  </div>

  <div class="product-card__controls">
    <div class="product-card__controls-cart {if $product_data['count'] > 0}active{/if}" data-product-cart-controls="{$id}">
      <div class="hide-active w-100">
        <button class="btn btn-basic w-100" onclick="product_card.events.addFirstProductToCart({$id})">В корзину</button>
      </div>
    
      <div class="show-active w-100">
        <div class="product-card__controls-cart__row">
          <button class="btn btn-basic product-card__controls-cart__main-btn">
            <span class="product-card__controls-cart__main-btn-checkmark"></span>
            <a class="product-card__controls-cart__main-btn-text" href="cart/">В корзинe</a>
          </button>
    
          {include "file:modules/cart/frontend/chunks/cart-product-controls.tpl"}
        </div>
      </div>
    </div>
    

    <button class="btn btn-bordered" data-modal-open="modal-callback">Купить в 1 клик</button>
  </div>

</div>
