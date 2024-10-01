{if !$data}
    {set $data = "@FILE snippets/getJsonData.php" | snippet : [
        "path" => "/assets/template/json/sections/faqs.json"
    ]}
{/if}

{if $data['status'] == 'success'}
<div class="faqs">
    <div class="faqs__row {if $not_columns}not-columns{/if}">
        {foreach $data['message'] as $index => $item}
            <div class="faqs__item">
                <div class="faqs__item-question fs-title-2 fw-600" data-opened-btn="answer-{$index}">{$item['question']} <span class="plus main-color">+</span><span class="minus main-color">-</span></div>
                <div class="faqs__item-answer dark-color" data-opened-element="answer-{$index}">{$item['answer']}</div>
            </div>
        {/foreach}
    </div>
</div>
{/if}
