{set $footer_menu_ids = 'footer_menu_ids' | config | fromJSON}

<div class="footer__top-menu">
  <div class="footer__top-menu__convert">
    <div class="footer__top-menu__convert-title pseudo-arrow pseudo-arrow__down" data-opened-btn="footer-1">Ассортимент</div>
    <div class="footer__top-menu__convert-container" data-opened-element="footer-1">
      {include "file:sections/footer/top-menu-item.tpl" ids=$footer_menu_ids[0]}
      {include "file:sections/footer/top-menu-item.tpl" ids=$footer_menu_ids[1]}
    </div>
  </div>
  <div class="footer__top-menu__convert">
    <div class="footer__top-menu__convert-title pseudo-arrow pseudo-arrow__down" data-opened-btn="footer-2">О компании</div>
    <div class="footer__top-menu__convert-container" data-opened-element="footer-2">
      {include "file:sections/footer/top-menu-item.tpl" ids=$footer_menu_ids[2]}
    </div>
  </div>
</div>