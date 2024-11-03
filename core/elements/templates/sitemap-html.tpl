{extends "file:layouts/base.tpl"} 


{block 'content'}
<div class="sitemap-html section-margin section-margin-top">
    <div class="container">
      <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
      {'pdoMenu' | snippet : [
        'parents' => 0
        'where' => '{"class_key:!=" : "msProduct"}'
      ]}
    </div>
</div>
{/block}
