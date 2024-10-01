{extends "file:layouts/base.tpl"} 

{block 'content'}    
<div class="faqs-page section-margin section-margin-top">
  <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>

  <div class="page-container">{include "file:sections/faqs/wrapper.tpl"}</div>
</div>

{include "file:sections/advantages/wrapper.tpl"}
{include "file:sections/callback-section/wrapper.tpl"}

{/block}
