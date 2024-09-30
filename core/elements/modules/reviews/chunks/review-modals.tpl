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