{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/partners-logo.json"
]}

{if $data['status'] == 'success'}
<div class="partners-logo section-margin">
  <h2 class="fs-h2 section-title">Партнеры и клиенты</h2>
  <div class="container">
    <div class="partners-logo__row">
      {foreach ["left","right"] as $rtl}
      <div class="partners-logo__track swiper" {if $rtl == "right"}dir="rtl"{/if} data-slider="partners-logo-{$rtl}">
          <div class="swiper-wrapper">
              {foreach $data['message'][$rtl] as $item}
                  <div class="partners-logo__track-item swiper-slide" style="background-image: url('{$item}');"></div>
              {/foreach}
          </div>
      </div>
      {/foreach}
    </div>
  </div>
</div>
{/if}