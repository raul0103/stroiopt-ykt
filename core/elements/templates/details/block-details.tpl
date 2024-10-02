{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/details.json"
]}

{if $data['status'] == 'success'}
<div class="details-page__details">
    {foreach $data['message'] as $group}
    <div class="details-page__details-group">
        <div class="details-page__details-group-title fs-title-2 fw-600">{$group['title']}</div>
        {foreach $group['items'] as $item} 
            <div class="details-page__details-item">
                <div class="details-page__details-item-title dark-color">{$item['title']}</div>
                <div class="details-page__details-item-value">{$item['value']}</div>
            </div>
        {/foreach}
    </div>
    {/foreach}
</div>
{/if}