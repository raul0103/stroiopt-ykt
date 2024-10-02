<a class="mini-product {if $idx > 5}hidden{/if}" href="{$product['uri']}">
  <div class="mini-product__row">
    <div
      class="mini-product__image"
      style="background-image: url('{$product['thumb']}')"
    ></div>
    <div class="mini-product__content">
      <div class="mini-product__pagetitle fw-600">{$product['pagetitle']}</div>
      <div class="mini-product__price muted-color">
        {$product['count'] ?: 1} x {$product['price']} руб.
      </div>
    </div>
  </div>
</a>
