<div class="category-tags">
  <div class="container">
    <h2 class="fs-h2 category-tags__title">Плиты перекрытия</h2>

    <div class="category-tags__row" data-opened-element="category-tags">
        {'!pdoResources' | snippet :[
            'tpl' => '@FILE sections/category-tags/tag-item.tpl'
            'includeTVs' => 'main_image'
            'tvPrefix' => ''
            'limit' => 0
            'depth' => 0
        ]}

        {* Плейсхолдер записывается в чанке sections/category-tags/tag-item.tpl*}
        {if $_modx->getPlaceholder('category-tags-show-btn-more')}
          <div
            class="category-tags__item show-more"
            data-opened-btn="category-tags"
            data-active-text="Скрыть"
          >
            Показать еще
          </div>
        {/if}
    </div>
  </div>
</div>
