

<div class="product-card">
  <div class="product-card__top">
    В наличии 1 шт.

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
  <div class="product-card__rating">тут рейтинг</div>

  <div class="product-card__title">
    <a href="{$id | url}">{$pagetitle}</a>
  </div>

  <div class="product-card__options">
    <div class="product-card__option-item">
      <span>Объем</span>
      <span>0,91 м3</span>
    </div>
    <div class="product-card__option-item">
      <span>Вес</span>
      <span>1,380 т</span>
    </div>
    <div class="product-card__option-item">
      <span>Длина</span>
      <span>2 780 мм</span>
    </div>
  </div>

  <div class="product-card__price">
    <span>{$price} руб.</span>
    {if $old_price?}
    <span>{$old_price} руб.</span>
    {/if}
  </div>

  <form class="product-card__controls ms2_form" method="post">
    <input type="hidden" name="id" value="{$id}" />
    <input type="hidden" name="count" value="1" />
    <input type="hidden" name="options" value="[]" />

    <div class="product-card__controls-row">
      <button
        type="submit"
        class="btn btn-basic"
        name="ms2_action"
        value="cart/add"
      >
        В корзину
      </button>
    </div>
  </form>
</div>
