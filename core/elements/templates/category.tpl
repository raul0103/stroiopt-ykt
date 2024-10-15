{extends "file:layouts/base.tpl"} 

{block 'content'}
    {include "file:blocks/breadcrumbs/wrapper.tpl"}
    {include "file:sections/category-tags/wrapper.tpl"}
    {include "file:sections/category-listing/wrapper.tpl"}
    {include "file:sections/callback-section/wrapper.tpl"}
    {include "file:sections/scheme-work/wrapper.tpl"}
    {include "file:sections/advantages/wrapper.tpl"}
    {*include "file:sections/certificates/wrapper.tpl"*}
    {*include "file:sections/thankful-letters/wrapper.tpl"*}
    {include "file:sections/delivery-map/wrapper.tpl"}
{/block}
