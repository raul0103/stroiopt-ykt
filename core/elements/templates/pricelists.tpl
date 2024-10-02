{extends "file:layouts/base.tpl"} 

{block 'content'}
<div class="pricelists-page section-margin section-margin-top">
    <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
  
    <div class="page-container page-content">
      <div class="pricelists-page__intro">
        {$_modx->resource.introtext}
      </div>
      
      <button class="pricelists-page__btn-download btn btn-primary has-icon has-icon-download-white">
          Скачать прайс-лист
      </button>
      
      <div class="pricelists-page__content">
        {$_modx->resource.content}
      </div>
    </div>
</div>

{include "file:sections/payment-methods/wrapper.tpl"} 
{include "file:sections/advantages/wrapper.tpl"} 
{include "file:sections/callback-section/wrapper.tpl"}

{/block}
