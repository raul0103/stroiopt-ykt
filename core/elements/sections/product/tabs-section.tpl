{set $content = $_modx->resource.content}
{set $tab_pricelist = "@FILE sections/product/tabs/pricelist/wrapper.tpl" | chunk}
{set $tab_delivery = "@FILE sections/product/tabs/delivery/wrapper.tpl" | chunk}
{set $tab_reviews = "@FILE modules/reviews/snippets/mltReviewItems.php" | snippet : [
  'tpl' => '@FILE modules/reviews/chunks/review-item.tpl',
  'tplOuter' => '@FILE modules/reviews/chunks/review-outer.tpl',
  'limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['product-reviews']
  'ratingRowClass' => 'rating-stars-static'
]}

{set $controls = []}
{set $controls[] = ["title" => "Характеристики", "id" => "tab-harakt", "classes" => "active"]}
{if $content}
  {set $controls[] = ["title" => "Описание", "id" => "description"]}
{/if}
{if $tab_pricelist}
  {set $controls[] = ["title" => "Прайс-лист", "id" => "price-list"]}
{/if}
{set $controls[] = ["title" => "Доставка", "id" => "delivery"]}
{set $controls[] = ["title" => "Отзывы", "id" => "reviews"]}

<div class="tabs-section section-margin">
  <div class="tabs-section__container">
    <div class="tabs-section__controls">
      <div class="tabs-section__controls-row">
        {foreach $controls as $control}
        <button
          class="tabs-section__controls-item fw-600 {$control['classes']}"
          data-opened-btn="{$control['id']}"
          data-close-early="true"
          data-toggle-not="true"
        >
          {$control["title"]}
        </button>
        {/foreach}
      </div>
    </div>
    <div class="tabs-section__tabs">
      <div
        class="tabs-section__tabs-item opened"
        data-opened-element="tab-harakt"
      >
          {'msProductOptions' | snippet : [
            'tpl' => '@FILE sections/product/tabs/options/wrapper.tpl'
          ]}
      </div>

      {if $content}
        <div class="tabs-section__tabs-item" data-opened-element="description">
          {$content}
        </div>
      {/if}
      
      {if $tab_pricelist}
        <div class="tabs-section__tabs-item" data-opened-element="price-list">
          {$tab_pricelist}
        </div>
      {/if}

      <div class="tabs-section__tabs-item" data-opened-element="delivery">
        {$tab_delivery}
      </div>
      
      {if $tab_reviews}
        <div class="tabs-section__tabs-item" data-opened-element="reviews">
          {$tab_reviews}
          <a class="btn-additional btn btn-basic" href="reviews/">Смотреть все отзывы</a>
        </div>
      {/if}
    </div>
  </div>
</div>
