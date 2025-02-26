{if $_modx->resource.template == 1}
  {set $output = "@FILE modules/catalog/snippets/html-desktop.php" | snippet : [
  'data' => $_modx->getPlaceholder('map-catalog-transfer')
  ]}
{/if}

<div class="catalog-header">
  <button
    data-catalog-open="catalog-modal-desktop"
    class="btn btn-primary catalog-header__btn"
    {if $_modx->resource.template != 1}onclick="window.catalog.api.getCatalog('{$_modx->getPlaceholder('catalog_cache_name')}','desktop')"{/if}
  >
    <div class="catalog-header__btn-icon">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <span>Каталог</span>
  </button>

  <div id="catalog-modal-desktop" class="catalog-header__nav">
    <div class="catalog-header__nav-overlay" data-catalog-close></div>
    <div class="catalog-header__nav-container" id="catalog-menu-desktop">{$output?:"Загрузка..."}</div>
  </div>
</div>
