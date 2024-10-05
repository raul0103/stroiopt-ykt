<div class="callback-section section-margin">
  <div class="container">
    <div class="callback-section__container">
      <h2 class="fs-h2 section-title">
        Не нашли то, что искали ?<br />Перезвоним и ответим на все вопросы !
      </h2>

      <div class="callback-section__row">
        {set $email_subject = 'Сообщение со страницы '~$_modx->resource.pagetitle}
        {'!FetchIt' | snippet : [
          'form' => '@INLINE 
            <form class="form fs-body-2">
              <div class="form__group">
                <label>Имя</label>
                <input type="text" name="name" />
              </div>
              <div class="form__group">
                <label>Телефон</label>
                <input type="text" name="phone" required/>
                <span class="error-color fs-caption" data-error="phone" style="display: none;"></span>
              </div>
    
              <label class="custom-checkbox">
                <input type="checkbox" checked required />
                <span class="checkmark"></span>
                Согласен на обработку <a href="{$_modx->makeURL(45956)}" class="btn-link">персональных данных</a>
              </label>
    
              <div class="form__footer ta-center">
                <button class="btn btn-primary" type="submit">
                  Заказать обратный звонок
                </button>
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

        <div class="callback-section__inform">
          <div class="fs-large">
            Вы можете самостоятельно связаться<br />с экспертом по ЖБИ позвонив
            по телефону:
          </div>

          <a href="tel:{'phone'|config}" class="fs-h2 main-color"
            >{'phone'|config}</a
          >
        </div>
      </div>
    </div>
  </div>
</div>
