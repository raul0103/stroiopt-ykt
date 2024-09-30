{set $products = "@FILE modules/cart/backend/snippets/getProducts.php" | snippet}

<div class="order-section section-margin section-margin-top">
  <div class="container">
    <h2 class="fs-h2">Оформление заказа</h2>
    
    <div class="order-section__row">
      <div class="order-section__main">
        {if !$products} Нет товаров в корзине {else}
          {include "file:sections/order/main-section.tpl"}
        {/if}
      </div>

      {include "file:blocks/side-block/chunks/order.tpl"}
    </div>
  </div>
</div>
