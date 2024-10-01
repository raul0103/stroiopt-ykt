<header class="header">
  <div class="container">
    {include 'file:sections/header/desktop/header-inform.tpl'}
    {include 'file:sections/header/common/header-search.tpl'}
    
    <div class="header__navigation">
      {include 'file:modules/catalog/chunks/wrapper-desktop.tpl'}
      {include 'file:sections/header/desktop/header-menu.tpl'}

      <div class="header__navigation-controls">
        <a class="btn btn-secondary has-icon has-icon-delivery-car" href="delivery/">Рассчитать доставку</a>
        <a class="header__navigation-btn btn btn-secondary has-icon has-icon-favorite" href="favorites/">
          {include "file:modules/favorites/chunks/products/header-counters.tpl"}
        </a>
        <a class="header__navigation-btn btn btn-secondary has-icon has-icon-cart" href="cart/">
          <span class="header-counters" data-cart-total-count>{$_modx->getPlaceholder('custom-placeholders')['counters']['cart']['total']['count']}</span>
        </a>
      </div>
    </div>
  </div>
</header>
