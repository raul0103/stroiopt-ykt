{set $thumb = 'phpthumbof' | snippet : [
  'input' => "{$main_image}",
  'options' => '&w=250&zc=1'
]}

<div class="pop-cat__item">
  <div class="pop-cat__item-left">
    <div>
      <a
        href="{$link}"
        class="pop-cat__item-title fs-title-1 btn-link hover-opacity-7"
      >
        <span
          class="pop-cat__item-image-small"
          style="background-image: url('{$thumb}')"
        ></span>
        <h3>{$menutitle}</h3>
      </a>
      <div data-pop-cat="pop-cat-{$id}" class="pop-cat__item-childs fs-body-1">
        {$wrapper}
      </div>
    </div>
    <div
      data-active-text="Скрыть"
      data-pop-cat-more="pop-cat-{$id}"
      class="pop-cat__show-more btn-link fw-600 pseudo-arrow pseudo-arrow__down"
    >
      Показать еще
    </div>
  </div>
  <div
    class="pop-cat__item-image"
    style="background-image: url('{$thumb}')"
  ></div>
</div>
