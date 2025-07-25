{extends "file:layouts/base.tpl"} 

{block 'content'}
    {include "file:sections/main-banner/wrapper.tpl"}
    {include "file:modules/popular-categories/chunks/wrapper.tpl"}
    {include "file:sections/related-services/wrapper.tpl"}
    {*include "file:sections/about/wrapper.tpl"*}
    {*include "file:sections/certificates/wrapper.tpl"*}
    {*include "file:sections/thankful-letters/wrapper.tpl"*}
    {include "file:sections/product-popular/wrapper.tpl"}
    {include "file:modules/reviews/chunks/wrapper.tpl"}
    {include "file:sections/works-slider/wrapper.tpl"}
    {include "file:sections/advantages/wrapper.tpl"}
    {include "file:sections/partners-logo/wrapper.tpl"}
    {include "file:sections/callback-section/wrapper.tpl"}
    {include "file:sections/delivery-map/wrapper.tpl"}
{/block}
