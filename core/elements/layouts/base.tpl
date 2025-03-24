{'@FILE snippets/ajax/ajax.php' | snippet}
{include 'file:modules/fast-search/chunks/init.tpl'}
{'@FILE modules/cart/backend/snippets/ajax.php' | snippet}
{$_modx->setPlaceholder('custom-placeholders', '@FILE snippets/placeholders/index.php' | snippet)}
{'@FILE modules/favorites/snippet/setFavoritesPlaceholder.php' | snippet : ["cookie_key" => "favorite-products"]}

{set $catalog_id = "catalog_id" | option}
{if $catalog_id}
  {"@FILE modules/map-resources/mapResources.php" | snippet : [
    'parents' => 'catalog_id' | config
    'toPlaceholder' => 'map-catalog-transfer'
    'transfer_ids' => [159 => 0, 886 => 159, 887 => 159, 888 => 159, 889 => 159, 809 => 159, 890 => 159, 138 => 0, 139 => 138, 140 => 138, 141 => 138, 144 => 138, 142 => 138, 807 => 138, 1138 => 138, 200 => 0, 202 => 200, 206 => 200, 201 => 200, 203 => 200, 412 => 200, 419 => 200, 207 => 200, 227 => 0, 228 => 227, 229 => 227, 233 => 227, 235 => 227, 236 => 227, 239 => 227, 232 => 227, 231 => 227, 238 => 227, 230 => 227, 234 => 227, 237 => 227, 240 => 227, 462 => 0, 497 => 462, 490 => 462, 488 => 462, 493 => 462, 499 => 462]
    'transfer_only' => true
    'sortby' => [159,138,200,227,462]
    'where' => '{"class_key":"msCategory"}'
    'depth' => 3
    'save_cache_name' => true
  ]}
{else}
  Не найдена опция catalog_id
{/if}

{"@FILE modules/map-resources/mapResources.php" | snippet : [
  'parents' => 'catalog_id' | config
  'toPlaceholder' => 'map-categories'
  'includeTVs' => 'main_image'
  'where' => '{"class_key":"msCategory"}'
  'depth' => 10
]}

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <base href="/">

    <title>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</title>

    <link rel="apple-touch-icon" sizes="180x180" href="/assets/template/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/template/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/template/favicon/favicon-16x16.png">
    <link rel="manifest" href="/assets/template/favicon/site.webmanifest">
    <link rel="mask-icon" href="/assets/template/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="icon" href="/assets/template/favicon/favicon.ico" type="image/x-icon">

    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

    <meta name="description" content="{$_modx->resource.description}">

    <link
      rel="stylesheet"
      href="/assets/template/css/main.css?{'file_version' | config}"
    />

    <!-- Google Tag Manager -->
    <script>
      (function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({ "gtm.start": new Date().getTime(), event: "gtm.js" });
        var f = d.getElementsByTagName(s)[0],
          j = d.createElement(s),
          dl = l != "dataLayer" ? "&l=" + l : "";
        j.async = true;
        j.src = "https://www.googletagmanager.com/gtm.js?id=" + i + dl;
        f.parentNode.insertBefore(j, f);
      })(window, document, "script", "dataLayer", "{'google_tag_manager' | config}");
    </script>
    <!-- End Google Tag Manager -->
  </head>
  <body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
      <iframe
      src="https://www.googletagmanager.com/ns.html?id={'google_tag_manager' | config}"
      height="0"
      width="0"
      style="display: none; visibility: hidden"
      ></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->
       
    {include 'file:sections/header/wrapper.tpl'}
    {block 'content'}{/block}
    {include 'file:sections/footer/wrapper.tpl'}

    {include "file:modules/modals/chunks/all.tpl"}

    <script
      src="/assets/template/js/main.js?{'file_version' | config}"
      defer
    ></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    
    {if $_modx->user.id}
      <!-- {$_modx->getInfo('', true, '@INLINE {$key} => {$value} <br>')} -->
    {/if}
  </body>
</html>
