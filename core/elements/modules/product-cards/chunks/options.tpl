{set $options = "@FILE snippets/getOptions.php" | snippet}

<div class="product-card__options">
    {foreach $options as $option}
        {set $value = $_pls[$option['key']][0]}
        {if $value}
            <div class="product-card__option-item fs-caption dark-color">
                <span>{$option['title']}</span>
                <span class="delimiter"></span>
                <span>{$value}</span>
            </div>
        {/if}
    {/foreach}
  </div>