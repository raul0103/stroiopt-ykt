{set $product_data = '@FILE modules/cart/backend/snippets/getProductData.php' |
snippet : [ 'product_id' => $product_id ]}

<form
  class="product-cart-controls {if $product_data['count'] > 0}active{/if}"
  data-cart-form="{$product_id}"
  onsubmit="cart.submit(event)"
>
  <input type="hidden" name="id" value="{$product_id}" />
  <input type="hidden" name="price" value="{$price}" />
  <input type="hidden" name="unit" value="{$unit | gettype == 'array' ? $unit[0] : $unit}" />

  <div class="hide-active w-100">
    <button
      class="btn btn-secondary w-100 pseudo-cart"
      data-cart-event="plus"
      onclick="this.form.classList.add('active')"
      aria-label="cart-add"
    ></button>
  </div>

  <div class="show-active w-100">
    <div class="product-cart-controls__row">
      <button class="btn btn-secondary product-cart-controls__main-btn">
        <span class="product-cart-controls__main-btn-checkmark"></span>
        <a
          class="product-cart-controls__main-btn-text pseudo-cart-v2"
          href="cart/"
        ></a>
      </button>

      <div class="cart-product-controls">
        <button class="btn btn-bordered" data-cart-event="minus">-</button>
        <input
          class="fs-body-1 fw-600"
          type="number"
          value="{$product_data['count'] ?: 1}"
          onchange="cart.submit(event,this.form);"
          data-cart-event="change"
          data-cart-product-count="{$product_id}"
        />
        <button class="btn btn-bordered" data-cart-event="plus" aria-label="cart-add">+</button>
      </div>
    </div>
  </div>

  <button
    class="btn btn-bordered"
    type="button"
    onclick="product_card.events.buyOneClick({$product_id});modals.events.open('modal-buy-click')"
  >
    Купить в 1 клик
  </button>
</form>
