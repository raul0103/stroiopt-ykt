{set $product_count = '@FILE modules/cart/backend/snippets/getProductCount.php' | snippet : [
  'product_id' => $id
]}

<div class="cart-product-controls">
  {* Форму лучше расположить рядом с кнопками, в JS сначала поиск формы будет по общему parent *}
  <form data-cart-form="{$id}">
    <input type="hidden" name="id" value="{$id}" />
    <input type="hidden" name="price" value="{$price}" />
    <input type="hidden" name="unit" value="{$unit ? $unit[0] : ''}" />
  </form>

  <button class="btn btn-bordered" onclick="cart.events.minus(this,{$id})">
    -
  </button>
  <input
    class="fs-body-1 fw-600"
    onchange="cart.events.change(this,{$id})"
    data-cart-product-count="{$id}"
    type="number"
    value="{$product_count}"
  />
  <button class="btn btn-bordered" onclick="cart.events.plus(this,{$id})">
    +
  </button>
</div>
