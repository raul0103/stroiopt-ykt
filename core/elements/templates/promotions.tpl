{extends "file:layouts/base.tpl"} 

{block 'content'}    
<div class="promotions-page section-margin section-margin-top">
    <div class="page-container">
      <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
      
      {include "file:sections/promotions-table/wrapper.tpl"}

      {if $_modx->resource.content}
        <div class="page-content section-margin">
          {$_modx->resource.content}
        </div>
      {/if}
    </div>
    
    {include "file:sections/callback-section/wrapper.tpl"}
</div>
{/block}
