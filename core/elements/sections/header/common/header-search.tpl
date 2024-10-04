{set $device = $mobile ? "mobile":"desktop"}
<div class="header__search">
  <form
    class="header__search-form form fs-body-2 fast-search-form"
    action="search/"
    method="get"
    fast-search-form="{$device}"
  >
    <img
      src="/assets/template/icons/search.svg"
      class="header__search-form-icon"
    />
    <input
      type="text"
      class="header__search-form-input fw-600"
      name="search"
      value=""
      fast-search-input="{$device}"
      placeholder="Поиск по каталогу"
    />

    <input type="hidden" name="id" value="2" />
  </form>

  {if !$mobile}
  <button data-modal-open="modal-callback" class="btn btn-primary">
    Заказать звонок
  </button>
  {/if}
</div>
