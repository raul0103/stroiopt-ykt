

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
      <span class=" full"></span>
      <span class=" full"></span>
      <span class=" full"></span>
      <span class=" full"></span>
      <span class=" full"></span>
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
