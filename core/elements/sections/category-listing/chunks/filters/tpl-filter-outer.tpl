{var $key = $table ~ $delimeter ~ $filter}
<fieldset class="category-listing__filter" id="mse2_{$key}">
  <div class="category-listing__filter-title fw-600">
    {('mse2_filter_' ~ $table ~ '_' ~ $filter) | lexicon}
  </div>
  <div class="category-listing__filter-row">{$rows}</div>
</fieldset>
