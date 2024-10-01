{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/payment-methods.json"
]}

{if $data['status'] == 'success'}
<div class="payment-methods section-margin">
    <div class="container">
      <h3 class="fs-h3">Вы можете оплатить следующими способами:</h3>
      <div class="payment-methods__row">
        {foreach $data['message'] as $item}
        <div class="payment-methods__item">
          <div class="payment-methods__item-image">
            <img src="{$item['image']}" />
          </div>
          <div class="payment-methods__item-title fs-body-2 fw-600">{$item['title']}</div>
        </div>
        {/foreach}
      </div>
    </div>
</div>
{/if}