{extends "file:blocks/side-block/layouts/base.tpl"}

{block "big-info"}
{set $product_id = $_modx->resource.id}
{set $unit = $_modx->resource.unit[0]}

<div class="side-block__big-info fs-body-2 dark-color">
  {include "file:modules/favorites/chunks/products/add-favorite-btn.tpl" text=true}
  <button class="has-icon has-icon-share" onclick="this.classList.toggle('mini-popup-show')">
    Поделиться
    <div class="mini-popup mini-popup-social">
      <ul class="social-icons">
        <li>
          <a
            class="has-icon has-icon-vk"
            title="поделиться во вконтакте"
            href="https://vk.com/share.php?url={$_modx->makeUrl($_modx->resource.id, '', '', 'full')}"
            target="_blank"
            rel="noopener noreferrer"
            ></a>
        </li>
        <li>
          <a
            class="has-icon has-icon-tg"
            title="поделиться в телеграм"
            href="https://t.me/share/url?url={$_modx->makeUrl($_modx->resource.id, '', '', 'full')}&text={$_modx->resource.pagetitle}"
            target="_blank"
            rel="noopener noreferrer"
            ></a>
        </li>
        <li>
          <a
            class="has-icon has-icon-ok"
            title="поделиться в однокласниках"
            href="https://connect.ok.ru/dk?cmd=WidgetSharePreview&st.cmd=WidgetSharePreview&st._aid=ExternalShareWidget_SharePreview&st.title={$_modx->resource.pagetitle}&st.shareUrl={$_modx->makeUrl($_modx->resource.id, '', '', 'full')}"
            target="_blank"
            rel="noopener noreferrer"
            ></a>
        </li>
        <li>
          <a
            class="has-icon has-icon-pn"
            title="поделиться в пинтерест"
            href="https://pinterest.com/pin/create/button/?url={$_modx->makeUrl($_modx->resource.id, '', '', 'full')}&media=&description={$_modx->resource.pagetitle}"
            target="_blank"
            rel="noopener noreferrer"
            ></a>
        </li>
        <li>
          <a
            class="has-icon has-icon-ld"
            title="поделиться в linkedin"
            href="https://www.linkedin.com/shareArticle?mini=true&url={$_modx->makeUrl($_modx->resource.id, '', '', 'full')}"
            target="_blank"
            rel="noopener noreferrer"
            ></a>
        </li>
      </ul>
    </div>
  </button>

</div>
<div class="side-block__big-info fs-h3">
  {$_modx->resource.price} руб. {if $unit}/{$unit}{/if}
</div>
<div class="side-block__big-controls">
  {include "file:modules/product-cards/chunks/cart-controls.tpl"}
</div>
{/block}
