{set $items = "@FILE modules/map-resources/mapGetResourcesByWhere.php" | snippet : [
  'data' => $_modx->getPlaceholder('map-categories'),
  'where' => '{"parent":'~$_modx->resource.id~',"template":4}'
]}

<div class="category-tags">
  <div class="container">
    <h2 class="fs-h2 category-tags__title">{$_modx->resource.pagetitle}</h2>
      {if $items}
        {set $limit = 7}
            <div class="category-tags__row" data-opened-element="category-tags">
                {foreach $items as $idx => $item}
                  {if $idx > $limit}
                    {set $hide_class = "hidden"}
                    {set $show_more = true}
                  {else}
                    {set $hide_class = ""}
                    {set $show_more = false}
                  {/if}

                  {set $thumb = 'phpthumbof' | snippet : [
                    'input' => "{$item['main_image']}",
                    'options' => '&w=50&zc=1'
                  ]}
                
                  <a class="category-tags__item {$hide_class}" href="{$item['uri']}">
                    <div
                      class="category-tags__item-image"
                      style="background-image: url('{$thumb}')"
                    ></div>
                    <div class="category-tags__item-title">{$item['menutitle'] ?: $item['pagetitle']}</div>
                  </a>

                {/foreach}
                  
                {if $show_more}
                  <div
                    class="category-tags__item show-more"
                    data-opened-btn="category-tags"
                    data-active-text="Скрыть"
                  >
                    Показать еще
                  </div>
                {/if}
            </div>
      {/if}

  </div>
</div>

{foreach [
  ['template'=>26,'title'=>'Длина','limit' => 7],
  ['template'=>27,'title'=>'Ширина','limit' => 7],
  ['template'=>28,'title'=>'Высота','limit' => 7],
  ]
as $condition}

  {set $items = "@FILE modules/map-resources/mapGetResourcesByWhere.php" | snippet : [
    'data' => $_modx->getPlaceholder('map-categories'),
    'where' => '{"parent":'~$_modx->resource.id~',"template":'~$condition['template']~'}'
  ]}

  {if $items}
    <div class="category-tags">
      <div class="container">

        <div class="category-tags__row d-flex" data-opened-element="category-tags-{$condition['template']}">
            <b>{$condition['title']}</b>

            {foreach $items as $idx => $item}
              {if $idx > $condition['limit']}
                {set $hide_class = "hidden"}
                {set $show_more = true}
              {else}
                {set $hide_class = ""}
                {set $show_more = false}
              {/if}

              <a class="category-tags__item {$hide_class}" style="width: max-content;" href="{$item['uri']}">
                <div class="category-tags__item-title">{$item['menutitle'] ?: $item['pagetitle']}</div>
              </a>

            {/foreach}
              
            {if $show_more}
              <div
                class="category-tags__item show-more"
                data-opened-btn="category-tags-{$condition['template']}"
                data-active-text="Скрыть"
              >
                Показать еще
              </div>
            {/if}
        </div>

      </div>
    </div>
  {/if}

{/foreach}