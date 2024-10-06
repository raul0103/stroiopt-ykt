{'@FILE snippets/ajax/ajax.php' | snippet}
{include 'file:modules/fast-search/chunks/init.tpl'}
{'@FILE modules/cart/backend/snippets/ajax.php' | snippet}
{$_modx->setPlaceholder('custom-placeholders', '@FILE snippets/placeholders/index.php' | snippet)}
{'@FILE modules/favorites/snippet/setFavoritesPlaceholder.php' | snippet : ["cookie_key" => "favorite-products"]}

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <base href="/">

    <title>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</title>

    <link rel="apple-touch-icon" sizes="180x180" href="assets/template/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/template/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/template/favicon/favicon-16x16.png">
    <link rel="manifest" href="assets/template/favicon/site.webmanifest">
    <link rel="mask-icon" href="assets/template/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

    <meta name="description" content="{$_modx->resource.description}">

    <link
      rel="stylesheet"
      href="/assets/template/css/main.css?{'file_version' | config}"
    />
  </head>
  <body>
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
