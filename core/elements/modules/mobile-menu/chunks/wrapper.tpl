{set $map_menu = "@FILE modules/map-resources/mapResources.php" | snippet : [
  'parents' => 0
  'where' => '{"class_key":"modDocument"}'
  'depth' => 2
]}

{set $menu_html = "@FILE modules/mobile-menu/snippets/html-mobile.php" | snippet : [
  'data' => $map_menu
]}

{set $catalog_html = "@FILE modules/mobile-menu/snippets/html-mobile.php" | snippet : [
  'data' => $_modx->getPlaceholder('map-catalog-transfer')
]}

<div class="mobile-menu fs-body-2 fw-600" id="mobile-menu">
  {include 'file:sections/header/common/header-search.tpl' mobile=true}

  <div class="mobile-menu__modal opened" data-mobile-modal="mobile-modal-main">
  
    <div class="mobile-menu__items">
      <div class="mobile-menu__item">
        <button
          data-mobile-modal-open="mobile-modal-catalog"
          class="btn btn-primary pseudo-arrow pseudo-arrow__right mobile-menu__catalog-btn"
        >
          Каталог
        </button>
      </div>
  
      {$menu_html["menu-items"]}
    </div>
  </div>
  
  <div class="mobile-menu__modal" data-mobile-modal="mobile-modal-catalog">
    <div class="mobile-menu__items">
      <div class="mobile-menu__back  pseudo-arrow-before pseudo-arrow-before__left pseudo-text-back" data-mobile-modal-back></div>
      {$catalog_html["menu-items"]}
    </div>
  </div>
  
  <div class="mobile-menu__footer">
    <div class="mobile-menu__footer-contacts">
      <div class="mobile-menu__footer-left">
        <a href="tel:{'phone'|config}" class="main-color fs-body-1 fw-600">{'phone'|config}</a>
        <a
          href="{'whatsapp-link'|config}"
          class="has-icon has-icon-whatsapp"
        ></a>
        <a
          href="{'telegram-link'|config}"
          class="has-icon has-icon-telegram"
        ></a>
      </div>
      <div class="mobile-menu__footer-right">
        <a href="mailto:{'email'|config}" class="fw-400">{'email'|config}</a>
      </div>
    </div>
    <div class="fw-500 mobile-menu__footer-descriptor">
      {'descriptor' | config}
    </div>
  </div>

  {$menu_html["menu-modals"]}
  {$catalog_html["menu-modals"]}
</div>
