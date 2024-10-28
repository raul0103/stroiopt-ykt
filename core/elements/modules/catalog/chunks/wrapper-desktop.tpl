{set $output = "@FILE modules/catalog/snippets/html-desktop.php" | snippet : [
  'data' => $_modx->getPlaceholder('map-catalog-transfer')
]}

<div class="catalog-header">
  <button
    data-catalog-open="catalog-modal-desktop"
    class="btn btn-primary catalog-header__btn"
  >
    <div class="catalog-header__btn-icon">
      <span></span>
      <span></span>
      <span></span>
    </div>
    <span class="catalog-header__btn-title">Каталог</span>
  </button>

  <div id="catalog-modal-desktop" class="catalog-header__nav">
    <div class="catalog-header__nav-overlay" data-catalog-close></div>
    <div class="catalog-header__nav-container">
      {$output}
    </div>
  </div>
</div>
