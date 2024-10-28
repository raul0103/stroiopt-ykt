<div class="product-main__info-docs">
  {if $show_title}
    <div class="product-main__info-docs-title fw-600">Техническая документация:</div>
  {/if}
  <div class="product-main__info-docs-row">
    {foreach $gosts as $gost}
    <div class="product-main__info-docs-item">
      <a class="fs-body-2 has-icon has-icon-download btn btn-bordered" target="_blank" href="/{$gost['file']}">{$gost['name']}</a>
    </div>
    {/foreach}
  </div>
</div>