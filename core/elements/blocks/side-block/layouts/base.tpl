<div class="side-block">
  <div class="side-block__big">
    {block "big-info"}{/block}
  </div>
  <div class="side-block__small">
    <div class="fw-600">Другие способы оформления заказа:</div>
    <div class="side-block__small-social">
      <div class="social-wrap">
        <a
          href="{'whatsapp-link'|config}"
          class="btn btn-secondary"
        >Заказать WhatsApp</a>
        <a
          href="{'telegram-link'|config}"
          class="btn btn-secondary"
        >Заказать Telegram</a>
      </div>
    </div>
    <a class="mail-button fw-600 btn btn-primary" href="mailto:{'email' | config}">
      {'email' | config}
      <span class="has-icon has-icon-copy mail-button__copy" onclick="copyText(event,'{'email' | config}')"></span>
    </a>
  </div>
</div>
