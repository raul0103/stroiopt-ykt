{* $product_count - Вызываю в чанке выше *}

<form class="cart-product-controls" onsubmit="cart.submit(event)">
  <input type="hidden" name="id" value="{$id}" />
  <input type="hidden" name="price" value="{$price}" />
  <input type="hidden" name="unit" value="{$unit}" />

  <button class="btn btn-bordered" data-cart-event="minus">-</button>
  <input
    class="fs-body-1 fw-600"
    type="number"
    value="{$product_count ?: 1}"
    onchange="cart.submit(event,this.form);"
    data-cart-event="change"
    data-cart-product-count="{$id}"
  />
  <button class="btn btn-bordered" data-cart-event="plus">+</button>
</form>
