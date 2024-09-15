<div class="header-search">
  {'SimpleSearchForm' | snippet : [ 'landing' => 2, 'tpl' => '@INLINE
  <form
    class="header-search__form form fs-body-2,"
    action="{$landing | url}"
    method="{$method}"
  >
    <img
      src="assets/template/icons/search.svg"
      class="header-search__form-icon"
    />
    <input
      type="text"
      class="header-search__form-input"
      name="{$searchIndex}"
      id="{$searchIndex}"
      value="{$searchValue}"
      placeholder="Поиск по каталогу"
    />

    <input type="hidden" name="id" value="{$landing}" />
  </form>
  ' ]}
  <button data-modal-open="modal-callback" class="btn btn-primary">
    Заказать звонок
  </button>
</div>
