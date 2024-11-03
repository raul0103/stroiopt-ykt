<div class="header__inform">
  <div class="header__inform-left">
    <a href="/" class="header__inform-logo">
      <img src="/assets/template/images/other/logo.svg" />
    </a>
    {'descriptor' | config}
  </div>
  <div class="header__inform-right">
    <ul class="header__inform-contact-items">
      <li class="header__inform-contact-item has-icon has-icon-geo fw-500">
        {$_modx->getPlaceholder('virtual')['address']}
      </li>
      <li class="header__inform-contact-item has-icon has-icon-clock fw-500">
        <span class="fw-600">8:00-19:00</span> без выходных
      </li>
    </ul>
    <ul class="header__inform-contact-items">
      <li
        class="header__inform-contact-item header__inform-contact-phone fw-600"
      >
        <div class="phones">
          <a href="tel:{'phone'|config}" class="main-color hover-opacity-7"
            >{'phone'|config}</a
          >
          <a href="tel:{'phone-2'|config}" class="main-color hover-opacity-7"
            >{'phone-2'|config}</a
          >
        </div>
        <a
          href="{'whatsapp-link'|config}"
          class="has-icon has-icon-whatsapp"
        ></a>
        <a
          href="{'telegram-link'|config}"
          class="has-icon has-icon-telegram"
        ></a>
      </li>

      <li class="header__inform-contact-item fw-600">
        <a class="hover-opacity-7" href="mailto:{'email'|config}"
          >{'email'|config}</a
        >
      </li>
    </ul>
  </div>
</div>
