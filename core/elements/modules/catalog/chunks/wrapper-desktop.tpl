{*set $output = "@FILE modules/catalog/snippets/html-desktop.php" | snippet : [
'data' => $_modx->getPlaceholder('map-catalog-transfer')
]*}

<div class="catalog-header">
  <button
    data-catalog-open="catalog-modal-desktop"
    class="btn btn-primary catalog-header__btn"
    onclick="window.catalog.api.getCatalog('{$_modx->getPlaceholder('catalog_cache_name')}','desktop')"
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
    <div class="catalog-header__nav-container" id="catalog-menu-desktop">{*$output*}</div>
  </div>
</div>
