{var $key = $table ~ $delimeter ~ $filter}
<div class="category-listing__filter-value">
  <label class="{$disabled} custom-checkbox" for="mse2_{$key}_{$idx}">
    <input
      type="checkbox"
      name="{$filter_key}"
      id="mse2_{$key}_{$idx}"
      value="{$value}"
      {$checked}
      {$disabled}
    />
    <span class="checkmark"></span>
    <span>{$title}</span>
  </label>
</div>
