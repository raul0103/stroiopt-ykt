{if $idx > $_modx->getPlaceholder('custom-placeholders')['limits']['category-tags']}
  {set $classes = "hidden"}
  {$_modx->setPlaceholder('category-tags-show-btn-more', true)}
{/if}

{set $thumb = 'phpthumbof' | snippet : [
  'input' => "{$main_image}",
  'options' => '&w=50&zc=1'
]}

<a class="category-tags__item {$classes}" href="{$uri}">
  <div
    class="category-tags__item-image"
    style="background-image: url('{$thumb}')"
  ></div>
  <div class="category-tags__item-title">
    {$menutitle ?: $pagetitle}
  </div>
</a>
