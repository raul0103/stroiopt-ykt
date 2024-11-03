{set $key = $table ~ $delimeter ~ $filter}
<fieldset
  class="category-listing__filter opened"
  id="mse2_{$key}"
  data-opened-element="opened-{$key}"
>
  <div class="category-listing__filter-title pseudo-arrow-before pseudo-arrow-before__down active fw-600 filter_title"  data-opened-btn="opened-{$key}">Цена, руб.</div>
  <div class="category-listing__filter-price-inputs fs-body-2">{$rows}</div>
  <div class="mse2_number_slider"></div>
</fieldset>
