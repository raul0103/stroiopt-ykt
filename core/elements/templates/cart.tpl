{extends "file:layouts/base.tpl"} 


{block 'content'}
    {set $parents_interesting =  'catalog_id' | config}
    {include "file:sections/cart-section/wrapper.tpl"}
    {include "file:sections/product-interesting/wrapper.tpl" parents=$parents_interesting}
{/block}
