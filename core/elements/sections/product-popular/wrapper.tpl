{$_modx->setPlaceholder('is-swiper-slide',true)}
{set $products = '!msProducts' | snippet :[
  'parents' => 0,
  'resources' => '886,888,1135,1138,6452,6453,6477,6478,6480,6481,6862,7245,7555,7780,8950,9295,9307,29537,33737,44678,44855,44934'
  'tpl' => '@FILE modules/product-cards/chunks/tpl-item.tpl'
  'includeTVs' => 'remains'
]}

{if $products}
<div class="section-margin">
  <div class="container">
    <h2 class="fs-h2 section-title">Популярные товары</h2>

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