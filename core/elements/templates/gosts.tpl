{extends "file:layouts/base.tpl"} 

{block 'content'}
{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/gosts.json"
]}

<div class="gosts-page section-margin section-margin-top">
  <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>

  <div class="page-container">
    <div class="page-content">{$_modx->resource.introtext}</div>

    {if $data['status'] == 'success'}
    <div class="gosts-page__row">
      {foreach $data['message'] as $group}
      <div class="gosts-page__group">
        <div class="gosts-page__group-title fs-title-2">{$group['title']}</div>
        {foreach $group['items'] as $item}
        <div class="gosts-page__group-item">
          <div class="gosts-page__group-item-title">
            <a class="has-icon has-icon-pdf-icon hover-opacity-7" href="{$item['href']}" >{$item['title']}</a>
            {*
            <div class="gosts-page__group-item-controls">
              <button class="has-icon has-icon-download-blue">Скачать</button>
              <button class="has-icon has-icon-open">Открыть</button>
            </div>
            *}
          </div>
        </div>
        {/foreach}
      </div>
      {/foreach}
    </div>
    {/if}
  </div>
</div>

{include "file:sections/delivery-map/wrapper.tpl"}
{include "file:sections/callback-section/wrapper.tpl"}

{/block}
