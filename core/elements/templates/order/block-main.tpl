<div class="tabs-section">
  <div class="tabs-section__container">
    <div class="tabs-section__controls">
      <div class="tabs-section__controls-row half">
        <button
          class="tabs-section__controls-item fw-600 active"
          data-opened-btn="order-physique"
          data-close-early="true"
          data-toggle-not="true"
        >
          Физическое лицо
        </button>
        <button
          class="tabs-section__controls-item fw-600"
          data-opened-btn="order-yurist"
          data-close-early="true"
          data-toggle-not="true"
        >
          Юридическое лицо
        </button>
      </div>
    </div>
    <div class="tabs-section__tabs">
      <div
        class="tabs-section__tabs-item opened"
        data-opened-element="order-physique"
      >
        {include "file:templates/order/form-physique.tpl"}
      </div>
      <div class="tabs-section__tabs-item" data-opened-element="order-yurist">
        {include "file:templates/order/form-yurist.tpl"}
      </div>
    </div>
  </div>
</div>
