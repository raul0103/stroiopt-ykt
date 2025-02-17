<ul class="footer__top-contacts">
  <li class="footer__top-contacts__title">Связаться с нами:</li>
  <li class="footer__top-contacts__item footer__top-contacts__phone fw-600">
    <div class="phones">
      <a href="tel:{'phone'|config}" class="main-color">{'phone'|config}</a>
      <a href="tel:{'phone-2'|config}" class="main-color">{'phone-2'|config}</a>
    </div>
    <div class="social-wrap">
      <a
        href="{'whatsapp-link'|config}"
        class="btn btn-primary"
        rel="noindex"
      >Заказать WhatsApp</a>
      <a
        href="{'telegram-link'|config}"
        class="btn btn-primary"
        rel="noindex"
      >Заказать Telegram</a>
    </div>
  </li>
  <li class="footer__top-contacts__item">
    <a href="mailto:{'email'|config}" class="dark-color">{'email'|config}</a>
  </li>
  <li class="footer__top-contacts__item">
    8:00-19:00
    <div class="fs-caption dark-color">Прием заявок: круглосуточно</div>
  </li>
  <li class="footer__top-contacts__item">Адрес офиса: {$_modx->getPlaceholder('virtual')['address']}</li>
</ul>
