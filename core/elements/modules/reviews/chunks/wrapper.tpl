<div class="reviews-section section-margin">
  <div class="container">
    <h2 class="fs-h2 section-title">Честные отзывы клиентов</h2>

    {"@FILE modules/reviews/snippets/mltReviewItems.php" | snippet : [
      'tpl' => '@FILE modules/reviews/chunks/review-item.tpl',
      'tplOuter' => '@INLINE <div class="reviews-section__items shadow">{$items}</div>',
      'limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['reviews-section']
      'ratingRowClass' => 'rating-stars-static'
    ]}

    <div class="reviews-section__controls">
      <button onclick="modals.events.open('modal-review')" class="btn btn-primary">Оставить отзыв</button>
      <a href="/reviews/" class="btn btn-secondary">Смотреть все</a>
    </div>
  </div>
</div>

{include 'file:modules/reviews/chunks/review-modals.tpl'}