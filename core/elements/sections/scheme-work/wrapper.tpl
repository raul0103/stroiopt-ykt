{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/scheme-work.json"
]}

{if $data['status'] == 'success'}
<div class="scheme-work section-margin">
    <div class="container">
        <h2 class="fs-h2 section-title">Схема работы</h2>
        <div class="scheme-work__row">
            {foreach $data['message'] as $item}
                <div class="scheme-work__item fw-600">
                    <div class="scheme-work__item-image" style="background-image: url('{$item['image']}');"></div>
                    <div class="scheme-work__item-title fs-h3">{$item['title']}</div>
                    <div class="scheme-work__item-text">{$item['text']}</div>
                </div>
            {/foreach}
        </div>
    </div>
</div>
{/if}