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

  {if $docs}
  {set $docs = $docs | fromJSON}

  <div class="product-main__info-docs">
    <div class="product-main__info-docs-title fw-600">Техническая документация:</div>
    <div class="product-main__info-docs-row">
      {foreach $docs as $doc}
      <div class="product-main__info-docs-item">
        <a class="fs-body-2 has-icon has-icon-download btn btn-bordered" target="_blank" href="/{$doc['file']}">{$doc['name']}</a>
      </div>
      {/foreach}
    </div>
  </div>
  {/if}

  {set $dorplitids = 'dorplitids' | config | fromJSON}
  {if $dorplitids && $_modx->resource.parent in list $dorplitids}
    {set $gosts = "@FILE snippets/getJsonData.php" | snippet : [
      "path" => "/assets/template/json/sections/gosts.json"
    ]}
    {if $gosts['status'] == 'success'}
      <div class="product-main__info-docs">
        <div class="product-main__info-docs-title fw-600">Техническая документация:</div>
        <div class="product-main__info-docs-row">
          {foreach $gosts['message'] as $doc}
            {if $doc['id'] == 'plitdor'}
              {foreach $doc['items'] as $item}
                <div class="product-main__info-docs-item">
                  <a class="fs-body-2 has-icon has-icon-download btn btn-bordered" target="_blank" href="/{$item['href']}">{$item['title']}</a>
                </div>
              {/foreach}
            {/if}
          {/foreach}
        </div>
      </div>
    {/if}
  {/if}
</div>
