<div class="contacts-page__info" itemscope itemtype="http://schema.org/LocalBusiness">
  <ul>
    <li>
      <div class="phones">
        <a
          class="fw-600 fs-h3 main-color hover-opacity-7"
          href="tel:{'phone'|config}"
          itemprop="telephone"
          >{'phone'|config}</a
        >
        <a
          class="fw-600 fs-h3 main-color hover-opacity-7"
          href="tel:{'phone'|config}"
          itemprop="telephone"
          >{'phones-2'|config}</a
        >
      </div>
      <div class="contacts-page__info-social">
        <div class="social-wrap">
          <a
            href="{'whatsapp-link'|config}"
            class="btn btn-secondary"
            rel="noindex"
          >Заказать WhatsApp</a>
          <a
            href="{'telegram-link'|config}"
            class="btn btn-secondary"
            rel="noindex"
          >Заказать Telegram</a>
        </div>
      </div>
    </li>
    <li class="fs-large dark-color">
      <a class="hover-opacity-7" href="mailto:{'email'|config}"
        >{'email'|config}</a
      >
    </li>

    <li>
      Режим работы: 09:00 - 19:00
      <div class="fw-500 dark-color fs-caption">
        Прием заявок: круглосуточно
      </div>
    </li>
    <li itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">{$_modx->getPlaceholder('virtual')['address']}</li>
  </ul>

  <meta itemprop="name" content="{'company_name' | config}">
  <meta itemprop="priceRange" content="От {"@FILE snippets/getMinPriceProduct.php" | snippet} RUB">
  <meta itemprop="image" content="/assets/template/favicon/favicon.ico">
  <time itemprop="openingHours" datetime="Mo-Su 08:00−19:00">
            
  </time>
</div>
