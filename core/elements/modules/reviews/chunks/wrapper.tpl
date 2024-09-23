<div class="reviews-section section-margin">
  <div class="container">
    <h2 class="fs-h2 section-title">Честные отзывы клиентов</h2>

    {"@FILE modules/reviews/snippets/mltReviewItems.php" | snippet : [
      'tpl' => '@FILE modules/reviews/chunks/review-item.tpl',
      'tplOuter' => '@FILE modules/reviews/chunks/review-outer.tpl',
      'limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['section-reviews']
      'ratingRowClass' => 'rating-stars-static'
    ]}

    <div class="reviews-section__controls">
      <button data-modal-open="modal-review" class="btn btn-primary">Оставить отзыв</button>
      <a href="/reviews/" class="btn btn-basic">Смотреть все</a>
    </div>
  </div>
</div>


<div class="modal modal-review" id="modal-review">
  <div class="modal-overlay" data-modal-close></div>

  <div class="modal-container">
    
    <div data-modal-body-before>
      <div class="modal-title fs-title-1">Оставить отзыв</div>
      {"@FILE modules/reviews/snippets/mltReviewForm.php" | snippet : [
        'tpl' => '@FILE modules/reviews/chunks/review-form.tpl' 
      ]}
      <div class="modal-require-info fs-caption muted-color">
        <span class="error-color">*</span> — обязательные поля
      </div>
    </div>

    <div data-modal-body-after>
      <div class="modal-title fs-title-1">Спасибо за обратную связь</div>
      Отзыв успешно отправлен
    </div>
    
    <div class="modal-icon-close" data-modal-close></div>
  </div>
</div>