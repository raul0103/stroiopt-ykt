{* $product_count - Вызываю в чанке выше *}

<div class="cart-product-controls">
  {* Форму лучше расположить рядом с кнопками, в JS сначала поиск формы будет по общему parent *}
  <form data-cart-form="{$id}">
    <input type="hidden" name="id" value="{$id}" />
    <input type="hidden" name="price" value="{$price}" />
    <input type="hidden" name="unit" value="{$unit ? $unit[0] : ''}" />
  </form>

  <button class="btn btn-bordered" onclick="cart.event('minus',this,{$id})">
    -
  </button>
  <input
    class="fs-body-1 fw-600"
    onchange="cart.event('change',this,{$id})"
    data-cart-product-count="{$id}"
    type="number"
    value="{$product_count ?: 0}"
  />
  <button class="btn btn-bordered" onclick="cart.event('plus',this,{$id})">
    +
  </button>
</div>
