{if $remains}
    {if $remains < 100}
        {set $remains_classes = "error-color"}
    {else}
        {set $remains_classes = "success-color"}
    {/if}
    <div class="product-card__remains">В наличии <span class="{$remains_classes}">{$remains} шт.</span></div>
{else}
    <div class="product-card__remains empty">Нет в наличии</div>
{/if}
