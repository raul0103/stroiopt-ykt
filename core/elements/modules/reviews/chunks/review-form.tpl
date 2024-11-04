<form action="[[+action]]" id="review-form" class="fs-body-2 form">
  <div class="form__group">
    <label>Ваше имя <span class="error-color">*</span></label>
    <input type="text" name="user_name" aria-label="user-name"/>
    <div data-error-message="user_name" class="form__error-message"></div>
  </div>

  <div class="form__group">
    <label>Отзыв <span class="error-color">*</span></label>
    <textarea name="content" rows="7" aria-label="review"></textarea>
    <div data-error-message="content" class="form__error-message"></div>
  </div>

  [[-
  <div class="form__group custom-file-loader">
    <input type="file" id="file-input" />
    <label for="file-input">Прикрепить файлы</label>
  </div>
  ]]

  <div class="form__group rating-stars">
    <label>Поставьте оценку</label>
    <rating>
      <input type="radio" name="rating" value="1" />
      <input type="radio" name="rating" value="2" />
      <input type="radio" name="rating" value="3" />
      <input type="radio" name="rating" value="4" />
      <input type="radio" name="rating" value="5" checked />
    </rating>
  </div>

  <div class="form__footer">
    <button class="btn btn-primary">Отправить</button>
  </div>
</form>
