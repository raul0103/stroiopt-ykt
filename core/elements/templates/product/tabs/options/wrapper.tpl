<div class="product-options">
  <div class="product-options__item">
    <label class="product-options__item-title dark-color">Категория:</label>
    <div class="product-options__item-value">
      {$_modx->resource.parent | resource : 'pagetitle'}
    </div>
  </div>

    {foreach $options as $option}
        <div class="product-options__item">
            <label class="product-options__item-title dark-color">{$option.caption}:</label>
            <div class="product-options__item-value">
                {if $option.value is array}
                    {$option.value | join : ', '}
                {else}
                    {$option.value}
                {/if}
            </div>
        </div>
    {/foreach}
</div>