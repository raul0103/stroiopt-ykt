<div class="cart-product-controls active">

  <div class="hide-active w-100">
    <button class="btn btn-basic  w-100">
      В корзину
    </button>
  </div>

  <div class="show-active w-100">
    <div class="cart-product-controls__row">
      <button class="btn btn-basic cart-product-controls__main-btn">
        <span class="cart-product-controls__main-btn-checkmark"></span>
        <span class="cart-product-controls__main-btn-text">В корзинe</span>
      </button>
      <div class="cart-product-subcontrols">
        {* Форму лучше расположить рядом с кнопками, в JS сначала поиск формы будет по общему parent *}
        <form data-cart-form="{$id}">
          <input type="hidden" name="id" value="{$id}">
          <input type="hidden" name="price" value="{$price}">
          <input type="hidden" name="unit" value="{$unit ? $unit[0] : ''}">
        </form>

        <button class="btn btn-bordered" onclick="cart.events.minus(this,{$id})">-</button>
        <input  class="fs-body-1 fw-600" onchange="cart.events.change(this,{$id})" data-cart-product-count="{$id}" type="number" value="0" />
        <button class="btn btn-bordered" onclick="cart.events.plus(this,{$id})">+</button>
      </div>
    </div>
  </div>
  
</div>
