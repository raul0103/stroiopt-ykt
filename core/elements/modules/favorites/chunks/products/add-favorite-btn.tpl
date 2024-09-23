{if $product_id}
    {if $product_id in list $_modx->getPlaceholder("favorite-products")} 
        {set $favorite_active = "active"}
    {/if}

    <button
    class="favorite-product__btn has-icon has-icon-favorite-v3 {$favorite_active}"
    onclick="addFavorites(this,{$product_id},'favorite-products')"
    ></button>
{else}
    Не передан $product_id
{/if}