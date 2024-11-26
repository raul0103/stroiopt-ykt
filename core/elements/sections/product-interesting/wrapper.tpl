{set $ids = "@FILE snippets/interestingProducts.php" | snippet}

{$_modx->setPlaceholder('is-swiper-slide',true)}
{set $products = '!msProducts' | snippet :[
  'parents' => $parents ?: $_modx->resource.parent,
  'resources' => $ids
  'tpl' => '@FILE modules/product-cards/chunks/tpl-item.tpl'
  'sortby' => 'RAND()'
  'includeTVs' => 'remains'
  'limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['product-interesting']
]}

{if $products}
<div class="product-interesting section-margin">
  <div class="container">
    <h2 class="fs-h2 section-title">Возможно, вас заинтересует</h2>

    <div class="swiper" data-slider="products">
      <div class="swiper-wrapper">{$products}</div>
      <div class="sm-d-none">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
      </div>
    </div>
  </div>
</div>
{/if}
{$_modx->setPlaceholder('is-swiper-slide',false)}