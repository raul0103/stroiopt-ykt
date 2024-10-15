<div class="product-card__options">
    {set $options = [
        ["title" => "ГОСТ", "key" => "gost"],
        ["title" => "Объем, м3", "key" => "obem-m3"],
        ["title" => "Вес, т", "key" => "mass-t"],
        ["title" => "Масса, т", "key" => "massa-t"],
        ["title" => "Длина, мм", "key" => "dlina-mm"],
        ["title" => "Ширина, мм", "key" => "shirina-mm"],
        ["title" => "Высота, мм", "key" => "vysota-mm"],
    ]}
    {foreach $options as $option}
        {set $value = $_pls[$option['key']][0]}
        {if $value}
            <div class="product-card__option-item fs-caption dark-color">
                <span>{$option['title']}</span>
                <span class="delimiter"></span>
                <span>{$value}</span>
            </div>
        {/if}
    {/foreach}
  </div>