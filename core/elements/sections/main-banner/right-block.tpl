{set $email_subject = 'Сообщение со страницы '~$_modx->resource.pagetitle}
{'!FetchIt' | snippet : [
  'form' => '@INLINE 
  <div class="main-banner__right">
    <form class="form main-banner__form fs-body-2">
      <div class="main-banner__form-title fs-title-1 ta-center fw-700">
        Получите скидку на доставку в свой первый заказ !
      </div>
      <div class="form__group">
        <label>Вид продукции</label>
        <input type="text" name="product" />
      </div>
  
      <div class="form__group">
        <label>Имя</label>
        <input type="text" name="name" />
      </div>
      <div class="form__group">
        <label>Телефон</label>
        <input type="text" name="phone" />
        <span class="error-color fs-caption" data-error="phone" style="display: none;"></span>
      </div>
  
      <label class="custom-checkbox">
        <input type="checkbox" checked required />
        <span class="checkmark"></span>
        Соглашаюсь на обработку персональных данных, ознакомлен с
        <a href="{$_modx->makeURL(45956)}" class="btn-link">Политикой конфиденциальности.</a>
      </label>
  
      <div class="form__footer ta-center">
        <button class="btn btn-primary" type="submit">Заказать изделие</button>
      </div>
    </form>
  </div>
  '
  'emailTo' => 'email' | config
  'emailSubject' => $email_subject
  'emailTpl' => '@FILE chunks/fetchit-email-tpl.tpl'
  'hooks' => 'email'
  'snippet' => 'FormIt'
  'customValidators' => 'phone-format'
  'validate' => 'phone:required:phone-format'
]}
