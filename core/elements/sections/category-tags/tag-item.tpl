{if $idx > 7}
{set $classes = "hidden"}
{$_modx->setPlaceholder('category-tags-show-btn-more', true)}
{/if}
<a class="category-tags__item {$classes}" href="{$uri}">
  <div
    class="category-tags__item-image"
    style="background-image: url('{$main_image}')"
  ></div>
  <div class="category-tags__item-title fs-body-2">
    {$menutitle ?: $pagetitle}
  </div>
</a>
