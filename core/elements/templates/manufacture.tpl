{extends "file:layouts/base.tpl"} 

{block 'content'}
{set $photos_manufacture = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/photos-manufacture.json"
]}
{set $photos_unloading = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/photos-unloading.json"
]}

<div class="manufacture-page section-margin section-margin-top">
    <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
  
    <div class="container">
      <div class="section-margin">
        <div class="manufacture-page__categories">
          {'pdoResources' | snippet : [ 
              'parents' => 'catalog_id' | config 
              'tpl' => '@INLINE
              <a class="manufacture-page__categories-item fw-600 hover-opacity-7" href="{$uri}">
              {$menutitle ?: $pagetitle}
              </a>' 
              'depth' => 0 
          ]}
        </div>
      </div>
      {if $photos_manufacture['status'] == 'success'}
      <div class="manufacture-page__photos section-margin" data-slider="manufacture">
        <h3 class="fs-h3 h3-margin">Фото производства</h3>
        <div class="manufacture-page__photos-row" data-slider-wrapper="manufacture">
          {foreach $photos_manufacture['message'] as $item}
          <a class="glightbox manufacture-page__photos-item" data-slider-item="manufacture" href="{$item}">
            <img src="{$item}" />
          </a>
          {/foreach}
        </div>
      </div>
      {/if}

      {if $photos_unloading['status'] == 'success'}
      <div class="manufacture-page__photos" data-slider="unloading">
        <h3 class="fs-h3 h3-margin">Фото разгрузки</h3>
        <div class="manufacture-page__photos-row" data-slider-wrapper="unloading">
          {foreach $photos_unloading['message'] as $item}
          <a class="glightbox manufacture-page__photos-item" data-slider-item="unloading" href="{$item}">
            <img src="{$item}" />
          </a>
          {/foreach}
        </div>
      </div>
      {/if}
    </div>
</div>
  

{include "file:sections/payment-methods/wrapper.tpl"} 
{include "file:sections/advantages/wrapper.tpl"}
{include "file:sections/delivery-map/wrapper.tpl"}
{include "file:sections/callback-section/wrapper.tpl"}

{/block}
