{set $product_data = '@FILE modules/cart/backend/snippets/getProductData.php' |
snippet : [ 'product_id' => $product_id ]}

<div
  class="product-cart-controls {if $product_data['count'] > 0}active{/if}"
  data-product-cart-controls="{$product_id}"
>
  <div class="hide-active w-100">
    <button
      class="btn btn-secondary w-100"
      onclick="product_card.events.addFirstProductToCart({$product_id})"
    >
      В корзину
    </button>
  </div>

  <div class="show-active w-100">
    <div class="product-cart-controls__row">
      <button class="btn btn-secondary product-cart-controls__main-btn">
        <span class="product-cart-controls__main-btn-checkmark"></span>
        <a class="product-cart-controls__main-btn-text" href="cart/"
          >В корзинe</a
        >
      </button>

      {include "file:modules/cart/frontend/chunks/cart-product-controls.tpl"
      product_count=$product_data['count'] id=$product_id}
    </div>
  </div>

  <button
    class="btn btn-bordered"
    onclick="product_card.events.buyOneClick({$product_id});modals.events.open('modal-buy-click')"
  >
    Купить в 1 клик
  </button>
</div>
