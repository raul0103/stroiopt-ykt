{set $email_subject = 'Сообщение со страницы '~$_modx->resource.pagetitle}
{'!FetchIt' | snippet : [
  'form' => '@INLINE 
  <form class="fs-body-2 form gap-24" data-form-id="order-form">
    <input type="hidden" name="order-type" value="Юридическое лицо">
  
    <div class="form__section form-section-custom-upload">
      <div>Загрузите файл с реквизитами компании вместо заполнения полей</div>
      <div class="custom-upload">
        <input data-custom-upload-input type="file" name="company_docs" />
        <button class="btn btn-bordered has-icon has-icon-upload" type="button">
          Реквизиты компании
        </button>
        <span class="custom-upload__file-name" data-custom-upload-file-name
          >Файл не выбран</span
        >
      </div>
      <div class="muted-color">Макс. размер файла 5 МБ</div>
    </div>
    <div class="form__section">
      <div class="form__section-title fs-title-2 fw-600">Адрес доставки</div>
      <div class="form__group">
        <label>Город</label>
        <input type="text" name="city" />
      </div>
  
      <div class="form__group">
        <label>Улица</label>
        <input type="text" name="street" />
      </div>
  
      <div class="form__group">
        <label>Коментарий</label>
        <input type="text" name="comment" />
      </div>
    </div>
  
    <div class="form__section">
      <div class="form__section-title fs-title-2 fw-600">Покупатель</div>
      <div class="form__group">
        <label>Контактное лицо</label>
        <input type="text" name="name" />
      </div>
  
      <div class="form__group">
        <label>Телефон <span class="error-color">*</span></label>
        <input type="text" name="phone" required />
        <span class="error-color fs-caption" data-error="phone" style="display: none;"></span>
      </div>
  
      <div class="form__group">
        <label>Email</label>
        <input type="text" name="email" />
      </div>
  
      <div class="form__group">
        <label>Название компании</label>
        <input type="text" name="company_name" />
      </div>
  
      <div class="form__group">
        <label>Юрилический адрес</label>
        <input type="text" name="yur-address" />
      </div>
  
      <div class="form__group">
        <label>ИНН/КПП</label>
        <input type="text" name="innkpp" />
      </div>
    </div>
  
    <div class="form__section">
      <div class="form__section-title fs-title-2 fw-600">Способ оплаты</div>
      <div class="form__group-row">
        <div class="form__group-radio custom-radio">
          <input type="radio" id="card" name="payment" value="Безналичный расчет" checked />
          <span class="radio-mark"></span>
          <label for="card">Безналичный расчет</label>
        </div>
      </div>
    </div>
  
    <div class="form__footer-row">
      <button class="btn btn-primary" type="submit">Оформить заказ</button>
      <div><span class="error-color">*</span> — обязательные поля</div>
    </div>
  
    <label class="custom-checkbox">
      <input type="checkbox" checked="" required="" />
      <span class="checkmark"></span>
      Я согласен на обработку <a href="{$_modx->makeURL(45956)}" class="btn-link">персональных данных</a>
    </label>
  </form>
  '
  'emailTo' => 'email' | config
  'emailSubject' => $email_subject
  'emailTpl' => '@FILE chunks/fetchit-email-tpl.tpl'
  'hooks' => 'email'
  'snippet' => 'FormIt'
  'customValidators' => 'phone-format'
  'validate' => 'name:required,phone:required:phone-format'
]}
