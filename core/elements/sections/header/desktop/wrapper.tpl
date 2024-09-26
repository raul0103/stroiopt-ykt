<header class="header">
  <div class="container">
    {include 'file:sections/header/desktop/header-inform.tpl'}
    {include 'file:sections/header/common/header-search.tpl'}
    
    <div class="header__navigation">
      {include 'file:modules/catalog/chunks/wrapper-desktop.tpl'}
      {include 'file:sections/header/desktop/header-menu.tpl'}

      <div class="header__navigation-controls">
        <button class="btn btn-basic has-icon has-icon-delivery-car">Рассчитать доставку</button>
        <a class="header__navigation-btn btn btn-basic has-icon has-icon-favorite" href="favorites/">
          {include "file:modules/favorites/chunks/products/header-counters.tpl"}
        </a>
        <a class="header__navigation-btn btn btn-basic has-icon has-icon-cart" href="cart/">
          <span class="header-counters" data-cart-product-total>{$_modx->getPlaceholder('custom-placeholders')['counters']['cart']}</span>
        </a>
      </div>
    </div>
  </div>
</header>
