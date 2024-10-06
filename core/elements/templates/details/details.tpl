{extends "file:layouts/base.tpl"} 

{block 'content'}
<div class="details-page section-margin section-margin-top">
  <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>

  <div class="page-container">
    <div class="details-page__row">
      {include "file:templates/details/block-details.tpl"}
      <div class="details-page__right">
        {include "file:templates/details/block-map.tpl"} 
        {include "file:templates/details/block-form.tpl"}
      </div>
    </div>
  </div>
</div>

{include "file:sections/advantages/wrapper.tpl"}
{include "file:sections/callback-section/wrapper.tpl"}
{/block}
