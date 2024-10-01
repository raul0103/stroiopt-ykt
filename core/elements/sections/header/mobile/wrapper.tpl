<header class="header-mobile">
  <div class="header-mobile__left">
    <button
      class="header-mobile__catalog-btn"
      data-mobile-menu-open="mobile-menu"
    ></button>

    <div class="header-mobile__logo">
      <a href="/">
        <img src="/assets/template/images/other/logo.svg" />
      </a>
    </div>
  </div>
  <div class="header-mobile__right">
    <a class="has-icon has-icon-phone" href="tel:{'phone'|config}"></a>
    <a class="has-icon has-icon-cart" href="cart/">
      <span class="header-counters" data-cart-total-count>{$_modx->getPlaceholder('custom-placeholders')['counters']['cart']['total']['count']}</span>
    </a>
  </div>
</header>

{include 'file:modules/mobile-menu/chunks/wrapper.tpl'}
