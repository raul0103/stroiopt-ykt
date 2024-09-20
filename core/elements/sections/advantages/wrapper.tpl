{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/advantages.json"
]}

{if $data['status'] == 'success'}
<div class="advantages-section section-margin">
  <div class="container">
    <h2 class="fs-h2 section-title">Преимущества работы с нами</h2>
    
    <div class="advantages-section__row">
      {foreach $data['message'] as $item}
        <div class="advantages-section__item">
          <div class="advantages-section__item-header">
            <div class="advantages-section__item-icon has-icon has-icon-{$item['icon']}"></div>
            <div class="advantages-section__item-title fs-h3">{$item['title']}</div>
          </div>
          <div class="advantages-section__item-body">
            {$item['description']}
          </div>
        </div>
      {/foreach}
    </div>
  </div>
</div>
{/if}