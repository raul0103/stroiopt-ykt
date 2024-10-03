{extends "file:layouts/base.tpl"} 

{block 'content'}
    {include "file:blocks/breadcrumbs/wrapper.tpl"}
    <div class="product-main" itemscope itemtype="http://schema.org/Product">
      <meta itemprop="brand" content="{'company_name' | config}">

        <div class="container">
          <div class="product-main__row">
            {include "file:templates/product/block-gallery.tpl"}
            {include "file:templates/product/block-info.tpl"}
            {include "file:blocks/side-block/chunks/product.tpl"}
          </div>
          {include "file:templates/product/block-tabs.tpl"}
        </div>
    </div>
    {include "file:sections/product-interesting/wrapper.tpl"}
    {include "file:sections/advantages/wrapper.tpl"}
    {include "file:sections/partners-logo/wrapper.tpl"}
    {include "file:sections/callback-section/wrapper.tpl"}
    {include "file:sections/delivery-map/wrapper.tpl"}
{/block}
