{set $key = $table ~ $delimeter ~ $filter}
<fieldset class="category-listing__filter opened" id="mse2_{$key}" data-opened-element="opened-{$key}">
  <div class="category-listing__filter-title pseudo-arrow-before pseudo-arrow-before__down fw-600 filter_title active" data-opened-btn="opened-{$key}">
    {('mse2_filter_' ~ $table ~ '_' ~ $filter) | lexicon}
  </div>

  <div class="search-by-words has-icon has-icon-search">
    <input placeholder="Введите значение" type="text" data-search-by-words="{$key}" />
  </div>

  <div
    class="category-listing__filter-row"
    data-opened-element="filter-{$key}"
    data-search-by-words-container="{$key}"
  >
    {$rows}
  </div>

  {* Плейсхолдер записывается в чанке sections\category-listing\chunks\filters\tpl-filter-row.tpl*}
  {if $_modx->getPlaceholder('category-listing-show-btn-more')}
  <div
    class="category-listing__filter-more-btn pseudo-arrow pseudo-arrow__down fs-body-2 main-color fw-600"
    data-opened-btn="filter-{$key}"
    data-active-text="Скрыть"
  >
    Смотреть все
  </div>
  {/if}
</fieldset>
