{$_modx->setPlaceholder('custom-placeholders', '@FILE snippets/placeholders/index.php' | snippet)}

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <base href="/">

    <title>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</title>

    <link
      rel="stylesheet"
      href="/assets/template/css/main.css?{'file_version' | config}"
    />
  </head>
  <body>
    {include 'file:sections/header/wrapper.tpl'}
    {block 'content'}{/block}
    {include 'file:sections/footer/wrapper.tpl'}

    {include "file:modules/modals/chunks/modal-callback.tpl"}
    {include "file:modules/modals/chunks/modal-callback-success.tpl"}

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
