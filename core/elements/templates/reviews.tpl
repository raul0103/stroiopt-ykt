{extends "file:layouts/base.tpl"} 

{block 'content'}
<div class="reviews-page section-margin-top">
  <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>

  <div class="section-margin">
    <div class="page-container">

      <div class="reviews-page__controls">
        <button data-modal-open="modal-review" class="btn btn-primary">
          Оставить отзыв
        </button>
        <button data-modal-open="modal-callback" class="btn btn-basic">
          Написать директору
        </button>
      </div>
      
      <div class="reviews-page__items" data-opened-element="reviews">
        {"@FILE modules/reviews/snippets/mltReviewItems.php" | snippet : [
            'tpl' => '@FILE modules/reviews/chunks/review-item-page.tpl'
            'tplOuter' => '@INLINE {$items}'
            'ratingRowClass' => 'rating-stars-static'
        ]}
      </div>

      {if $_modx->getPlaceholder('reviews-paginate')}
        <button
            class="btn btn-bordered show-more-btn"
            data-opened-btn="reviews"
            data-active-text="Скрыть отзывы"
        >
            Загрузить еще отзывы
        </button>
      {/if}
    </div>
  </div>

  {include "file:sections/advantages/wrapper.tpl"} 
  {include "file:sections/callback-section/wrapper.tpl"}
</div>

{include 'file:modules/reviews/chunks/review-modals.tpl'} 

{/block}
