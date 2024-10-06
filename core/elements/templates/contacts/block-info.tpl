<div class="contacts-page__info" itemscope itemtype="http://schema.org/LocalBusiness">
  <ul>
    <li>
      <a
        class="fw-600 fs-h3 main-color hover-opacity-7"
        href="tel:{'phone'|config}"
        itemprop="telephone"
        >{'phone'|config}</a
      >
      <div class="contacts-page__info-social">
        <a
          class="has-icon has-icon-whatsapp"
          href="{'whatsapp-link'|config}"
        ></a>
        <a
          class="has-icon has-icon-telegram"
          href="{'telegram-link'|config}"
        ></a>
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
