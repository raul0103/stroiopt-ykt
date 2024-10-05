<div class="modal modal-callback" id="modal-callback">
  <div class="modal-overlay" data-modal-close></div>

  <div class="modal-container">
    <div class="modal-callback__header">
      <div class="modal-title fs-title-1">Заказать звонок</div>
    </div>

    <div class="modal-callback__body">
      <div data-modal-body-before>
      {set $email_subject = 'Сообщение со страницы '~$_modx->resource.pagetitle}
      {'!FetchIt' | snippet : [
        'form' => '@INLINE 
          <form class="fs-body-2 form" data-modal-id="modal-callback">
            <div class="form__group">
              <label>Ваше имя <span class="error-color">*</span></label>
              <input type="text" name="name" />
            </div>
    
            <div class="form__group">
              <label>Телефон <span class="error-color">*</span></label>
              <input type="text" name="phone" required/>
              <span class="error-color fs-caption" data-error="phone" style="display: none;"></span>
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
        '
        'emailTo' => 'email' | config
        'emailSubject' => $email_subject
        'emailTpl' => '@FILE chunks/fetchit-email-tpl.tpl'
        'hooks' => 'email'
        'snippet' => 'FormIt'
        'customValidators' => 'phone-format'
        'validate' => 'phone:required:phone-format'
      ]}
      <div class="modal-require-info fs-caption muted-color">
        <span class="error-color">*</span> — обязательные поля
      </div>
    </div>
    <div class="modal__success-window ta-center fw-600 main-color" data-modal-body-after>
      Ваша заявка принята!
    </div>
    </div>

    <div class="modal-icon-close" data-modal-close></div>
  </div>
</div>
