{extends "file:layouts/base.tpl"} 

{block 'content'}
<div class="delivery-page section-margin section-margin-top">
    <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
  
    <div class="delivery-page__row">
      <div class="page-container page-content">
        {$_modx->resource.introtext}
      </div>
      <div class="delivery-page__table container">
        {include "file:sections/delivery/delivery-table.tpl" show_btn_desktop=true}
      </div>
      <div class="page-container page-content">
        {$_modx->resource.content}
      </div>
    </div>
</div>

{include "file:sections/payment-methods/wrapper.tpl"} 
{include "file:sections/advantages/wrapper.tpl"} 
{include "file:sections/callback-section/wrapper.tpl"}

{/block}
