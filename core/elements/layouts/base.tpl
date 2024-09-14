<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</title>

    <link
      rel="stylesheet"
      href="/assets/template/css/style.css?{'file_version' | config}"
    />
  </head>
  <body>
    {include 'file:sections/header/wrapper.tpl'}
    {block 'content'}{/block}

    {include "file:modules/modals/chunks/modal-callback.tpl"}
    {include "file:modules/modals/chunks/modal-callback-success.tpl"}

    <script
      src="/assets/template/js/main.js?{'file_version' | config}"
      defer
    ></script>
  </body>
</html>
