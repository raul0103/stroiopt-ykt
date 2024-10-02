{extends "file:layouts/base.tpl"}
{block 'content'}
<div class="contacts-page section-margin section-margin-top">
    <div class="page-container">
      <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
      <div class="contacts-page__col">
        <div class="contacts-page__row">
          {include "file:templates/contacts/block-info.tpl"} 
          {include "file:templates/contacts/block-map.tpl"}
        </div>
  
        <div class="contacts-page__row">
          {include "file:templates/contacts/block-faqs.tpl"} 
          {include "file:templates/contacts/block-form.tpl"}
        </div>
      </div>
    </div>
</div>

{include "file:sections/advantages/wrapper.tpl"}
{include "file:sections/callback-section/wrapper.tpl"}
{/block}
