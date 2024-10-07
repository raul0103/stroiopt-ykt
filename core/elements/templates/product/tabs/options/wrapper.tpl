<div class="product-options">


    {if $options | count > 8}
      {set $option_columns = "@FILE snippets/splitArray.php"|snippet:[
        'array' => $options
      ]}
      {foreach $option_columns as $option_column}
        <div class="product-options__column">
          {include "file:templates/product/tabs/options/outer.tpl" options=$option_column}
        </div>
      {/foreach}
    {else}
        {include "file:templates/product/tabs/options/outer.tpl" options=$options}
    {/if}
</div>