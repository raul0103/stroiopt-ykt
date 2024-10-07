{if !$data}
    {set $data = "@FILE snippets/getJsonData.php" | snippet : [
        "path" => "/assets/template/json/sections/faqs.json"
    ]}
{/if}

{if $data['status'] == 'success'}
<div class="faqs">
    <div class="faqs__row {if $not_columns}not-columns{/if}">
        {if $data['message'] | count > 8}
            {set $columns = '@FILE snippets/splitArray.php' | snippet :[
                'array' => $data['message']
            ]}
            {foreach $columns as $index_column => $column_items}
                <div class="faqs__item-column">
                    {include "file:sections/faqs/outer.tpl" faqs=$column_items}
                </div>
            {/foreach}

        {else}
            {include "file:sections/faqs/outer.tpl" faqs=$data['message']}
        {/if}
    </div>
</div>
{/if}
