{extends "file:modules/modals/layots/base.tpl"} 

{block 'params'}
  {set $id='modal-buy-click'}
  {set $title="Купить в 1 клик"}
  {set $show_body_before=true}
{/block}

{block 'body'}
  {set $email_subject = 'Сообщение со страницы '~$_modx->resource.pagetitle}
  {'!FetchIt' | snippet : [
    'form' => '@INLINE 
      <form class="fs-body-2 form" data-modal-id="modal-buy-click">
        <div class="form__group">
          <label>Ваше имя <span class="error-color">*</span></label>
          <input type="text" name="name" aria-label="user-name"/>
        </div>

        <div class="form__group">
          <label>Телефон <span class="error-color">*</span></label>
          <input type="text" name="phone" required aria-label="user-phone"/>
          <span class="error-color fs-caption" data-error="phone" style="display: none;"></span>
        </div>

        <div class="form__group buy-click-container" id="buy-click-container"></div>

        <label class="custom-checkbox">
          <input type="checkbox" checked required aria-label="policy"/>
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
{/block}