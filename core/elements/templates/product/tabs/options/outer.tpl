{foreach $options as $option}
  {if $option.value is array}
      {set $value = $option.value | join : ', '}
  {else}
      {set $value = $option.value}
  {/if}
  {if $value}
    <div class="product-options__item">
        <label class="product-options__item-title dark-color">{$option.caption}:</label>
        <div class="product-options__item-value">
          {$value}
        </div>
    </div>
  {/if}
{/foreach}