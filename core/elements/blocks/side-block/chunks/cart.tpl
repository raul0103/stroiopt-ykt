{extends "file:blocks/side-block/layouts/base.tpl"}

{block "big-info"}
<div class="side-block__big-info">
  <span class="dark-color">Всего позиций</span>
  <span class="dark-color fw-600" data-cart-total-count>
    {$cart_total['count']}
  </span>
</div>
<div class="side-block__big-info">
  <span class="fs-title-2 fw-600">Итого</span>
  <div class="fs-h3 fw-600">
    <span data-cart-total-summ> {$cart_total['summ']} </span> руб.
  </div>
</div>
<div class="side-block__big-controls">
  <a class="btn btn-primary" href="order/">Оформить заказ</a>
  <button class="btn btn-bordered" onclick="window.history.back();">
    Вернуться к покупкам
  </button>
</div>
{/block}
