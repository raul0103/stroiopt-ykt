{extends "file:layouts/base.tpl"} 

{block 'content'}
{set $products = "@FILE modules/cart/backend/snippets/getProducts.php" | snippet}

<div class="order-page section-margin section-margin-top">
  <div class="container">
    <h2 class="fs-h2">Оформление заказа</h2>
    
    <div class="order-page__row">
      <div class="order-page__main">
        {if !$products} Нет товаров в корзине {else}
          {include "file:templates/order/block-main.tpl"}
        {/if}
      </div>

      {include "file:blocks/side-block/chunks/order.tpl"}
    </div>
  </div>
</div>
{/block}
