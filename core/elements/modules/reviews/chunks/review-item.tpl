<div class="reviews-section__item">
  <div class="reviews-section__item-header">
    <div class="reviews-section__item-author fw-600 ">
      {$user_name}
    </div>
    <div
      class="reviews-section__item-logo"
      style="background-image: url('{$logo ?: '/assets/template/icons/reviews/default.svg'}');"
    ></div>
  </div>

    <div class="reviews-section__item-info">
        {$rating_html}
      <div class="reviews-section__item-date fs-caption">
        {'@FILE snippets/stringDateFormatted.php' | snippet : [
          'dateString' => $createdon
          'hiddens' => ['year']
        ]}
      </div>
    </div>
    
    <div class="reviews-section__item-content">{$content}</div>
</div>
