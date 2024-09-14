<div class="header-search">
  {'SimpleSearchForm' | snippet : [ 'landing' => 2, 'tpl' => '@INLINE
  <form
    class="sheader-search__form"
    action="{$landing | url}"
    method="{$method}"
  >
    <input
      type="text"
      class="sheader-search__form-input"
      name="{$searchIndex}"
      id="{$searchIndex}"
      value="{$searchValue}"
    />
    <input type="hidden" name="id" value="{$landing}" />
  </form>
  ' ]}
  <button data-modal-open="modal-callback" class="btn btn-primary">
    Заказать звонок
  </button>
  <button data-modal-open="modal-callback-success" class="btn btn-basic">
    Заказать звонок
  </button>
</div>
