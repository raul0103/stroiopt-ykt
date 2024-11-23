{if $_modx->resource.content}
  {$_modx->resource.content}
{else}
<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  {'pdoResources' | snippet : [
    'parents' => $_modx->resource.id,
    'tpl' => '@INLINE <sitemap><loc>{$_modx->makeUrl($id, "", "", "full")}</loc></sitemap>'
  ]}
</sitemapindex>
{/if}