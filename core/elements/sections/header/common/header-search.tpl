<div class="header__search">
  {'SimpleSearchForm' | snippet : [ 'landing' => 2, 'tpl' => '@INLINE
  <form
    class="header__search-form form fs-body-2,"
    action="{$landing | url}"
    method="{$method}"
  >
    <img
      src="/assets/template/icons/search.svg"
      class="header__search-form-icon"
    />
    <input
      type="text"
      class="header__search-form-input fw-600"
      name="{$searchIndex}"
      value="{$searchValue}"
      placeholder="Поиск по каталогу"
    />

    <input type="hidden" name="id" value="{$landing}" />
  </form>
  ' ]}

  {if !$mobile}
    <button data-modal-open="modal-callback" class="btn btn-primary">
      Заказать звонок
    </button>
  {/if}
</div>
