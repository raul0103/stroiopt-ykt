{set $key = $table ~ $delimeter ~ $filter}

{if $idx > $_modx->getPlaceholder('custom-placeholders')['limits']['filter-values']}
  {$_modx->setPlaceholder('category-listing-show-btn-more', true)}
  {set $classes = "hidden"}
{else}
  {$_modx->setPlaceholder('category-listing-show-btn-more', false)}
{/if}

<div class="category-listing__filter-value {$classes}" zzz>
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
