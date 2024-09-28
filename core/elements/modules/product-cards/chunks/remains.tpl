{if $remains}
    {set $remains_classes = "@FILE snippets/getRemainsClassName.php" | snippet : [
        "remains" => $remains
    ]}
    <div class="product-card__remains">В наличии <span class="{$remains_classes}">{$remains} шт.</span></div>
{else}
    <div class="product-card__remains empty">Нет в наличии</div>
{/if}
