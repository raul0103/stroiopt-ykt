{set $remains = $_modx->resource.remains}
{set $docs = $_modx->resource.docs}

<div class="product-main__info">
  <div class="product-main__info-article muted-color fs-body-2">Арт. {$_modx->resource.article}</div>
  
  <h1 class="product-main__info-pagetitle fs-h2" itemprop="name">{$_modx->resource.pagetitle}</h1>
  
  <div class="rating-stars-static" itemscope itemprop="aggregateRating" itemtype="http://schema.org/AggregateRating">
    <span class="full"></span>
    <span class="full"></span>
    <span class="full"></span>
    <span class="full"></span>
    <span class="full"></span>

    <meta itemprop="bestRating" content="5">
    <meta itemprop="ratingValue" content="5">
    <meta itemprop="ratingCount" content="82">
  </div>

  <ul class="product-main__info-list fs-body-2">
    {if $remains}
      <li class="has-icon has-icon-success success-color">В наличии {$remains} шт.</li>
    {else}
      <li class="error-color">Нет в наличии</li>
    {/if}
    <li class="has-icon has-icon-delivery-car-v2">Доставка от 1 дня!</li>
    <li class="has-icon has-icon-payment-v2">Оплата после отгрузки</li>
  </ul>

  {set $gosts = "@FILE snippets/getResourceTV.php" | snippet : [
    'id' => $_modx->resource.parent,
    'tvName' => 'gosts'
  ]}

  {if $gosts}
    {set $gosts = $gosts | fromJSON}
    {include "file:blocks/gosts.tpl" gosts=$gosts show_title=true}
  {/if}

</div>
