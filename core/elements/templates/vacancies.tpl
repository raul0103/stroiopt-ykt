{extends "file:layouts/base.tpl"} 

{block 'content'}
{set $vacancies = $_modx->resource.vacancies}
<div class="vacancies-page section-margin section-margin-top">
  <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>

  {if $vacancies} 
  {set $vacancies = $vacancies | fromJSON}
  <div class="page-container page-content">
    <div class="vacancies-page__row">
      {foreach $vacancies as $index => $vacancy}
      <div
        class="vacancies-page__item {if $index == 0}opened{/if}"
        data-opened-element="answer-{$index}"
      >
        <div
          class="vacancies-page__item-name fs-title-1 main-color {if $index == 0}active{/if}"
          data-opened-btn="answer-{$index}"
        >
          {$vacancy['name']} <span class="plus main-color">+</span
          ><span class="minus main-color">-</span>
        </div>
        <div class="vacancies-page__item-description">
          {$vacancy['description']}
        </div>
        <div class="vacancies-page__item-controls">
          <button class="btn btn-primary" onclick="modals.events.open('modal-callback')">
            Заполнить форму
          </button>
        </div>
      </div>
      {/foreach}
    </div>
  </div>
  {/if}
</div>

{include "file:sections/advantages/wrapper.tpl"} 
{include "file:sections/callback-section/wrapper.tpl"}
{/block}
