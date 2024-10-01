{extends "file:layouts/base.tpl"} 


{block 'content'}
<div class="services-page section-margin section-margin-top">
    <div class="page-container">
      <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
      <div class="services-page__row">
          {'pdoResources' | snippet : [
              'parents' => 'related-services-id' | config
              'includeTVs' => 'main_image'
              'includeContent' => 1
              'tvPrefix' => ''
              'tpl' => '@INLINE 
              <a class="services-page__item" href="{$uri}">
                  <div class="services-page__item-image" style="background-image: url(\'{$main_image}\');"></div>
                  <div class="services-page__item-content page-content">
                      <div class="services-page__item-title fs-title-1">{$pagetitle}</div>
                      {$content}
                  </div>
              </a>'
          ]}
      </div>
    </div>
</div>

{include "file:sections/advantages/wrapper.tpl"}
{include "file:sections/callback-section/wrapper.tpl"}
{/block}
