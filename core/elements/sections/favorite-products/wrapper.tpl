<div class="favorite-products section-margin section-margin-top">
    <div class="container">
      <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
      <div class="favorite-products__row">
          {set $favorite_product_ids = $_modx->getPlaceholder('favorite-products')} 
          {if $favorite_product_ids && $favorite_product_ids | count}
              {'msProducts' | snippet :[
                  'parents' => 0
                  'resources' => $favorite_product_ids | join : ','
                  'tpl' => '@FILE modules/product-cards/chunks/tpl-item.tpl'
                  'includeTVs' => 'remains'
              ]}
          {else}
              Пусто
          {/if}
      </div>
    </div>
  </div>