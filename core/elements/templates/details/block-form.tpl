<div class="details-page__form">
  <div class="contacts-page__form-title fs-title-1 fw-600">
    Оставьте заявку и мы перезвоним вам
  </div>
  <form action="" class="fs-body-2 form">
    <div class="form__group">
      <label>Ваше имя <span class="error-color">*</span></label>
      <input type="text" name="name" />
    </div>

    <div class="form__group">
      <label>Телефон <span class="error-color">*</span></label>
      <input type="text" name="phone" />
    </div>

    <label class="custom-checkbox">
      <input type="checkbox" checked required />
      <span class="checkmark"></span>
      Я согласен на обработку <a href="{$_modx->makeURL(45956)}" class="btn-link">персональных данных</a>
    </label>

    <div class="form__footer">
      <button class="btn btn-primary" type="submit">Отправить</button>
    </div>
  </form>
</div>
