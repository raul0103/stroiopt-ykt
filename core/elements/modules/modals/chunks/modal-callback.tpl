<div class="modal modal-callback" id="modal-callback">
  <div class="modal-overlay" data-modal-close></div>

  <div class="modal-container">
    <div class="modal-callback__header">
      <div class="modal-title fs-title-1">Заказать звонок</div>
    </div>

    <div class="modal-callback__body">
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
          Я согласен на обработку персональных данных
        </label>

        <div class="form__footer">
          <button class="btn btn-primary" type="submit">Отправить</button>
        </div>
      </form>
    </div>

    <div class="modal-icon-close" data-modal-close></div>
    <div class="modal-require-info fs-caption muted-color">
      <span class="error-color">*</span> — обязательные поля
    </div>
  </div>
</div>
