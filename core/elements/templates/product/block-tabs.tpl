{set $content = $_modx->resource.content}
{set $tab_pricelist = "@FILE templates/product/tabs/pricelist/wrapper.tpl" | chunk}
{set $tab_delivery = "@FILE templates/product/tabs/delivery/wrapper.tpl" | chunk}
{set $tab_reviews = "@FILE modules/reviews/snippets/mltReviewItems.php" | snippet : [
  'tpl' => '@FILE modules/reviews/chunks/review-item.tpl',
  'tplOuter' => '@INLINE <div class="reviews-section__items col-2">{$items}</div>',
  '-limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['reviews-product']
  'ratingRowClass' => 'rating-stars-static'
  'resource_id' => $_modx->resource.parent
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
{set $controls[] = ["title" => "Сертификаты", "id" => "certs"]}
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
            'tpl' => '@FILE templates/product/tabs/options/wrapper.tpl'
          ]}
      </div>

      {if $content}
        <div class="tabs-section__tabs-item page-content" data-opened-element="description" itemprop="description">
          {$content}
        </div>
      {/if}
      
      {if $tab_pricelist}
        <div class="tabs-section__tabs-item" data-opened-element="price-list">
          {$tab_pricelist}
        </div>
      {/if}

      <div class="tabs-section__tabs-item" data-opened-element="delivery">
        {include "file:sections/delivery/delivery-table.tpl"}
      </div>
      
      <div class="tabs-section__tabs-item" data-opened-element="certs">
        <div class="product-main__certs">
          <img class="glightbox" src="assets/template/images/sections/certs/1.jpg" />
          <img class="glightbox" src="assets/template/images/sections/certs/2.jpg" />
          <img class="glightbox" src="assets/template/images/sections/certs/3.jpg" />
        </div>
      </div>

        <div class="tabs-section__tabs-item" data-opened-element="reviews">
          {$tab_reviews}

          <div class="tabs-section__tabs-controls">
            <button onclick="modals.events.open('modal-review')" class="btn btn-primary">
              Оставить отзыв
            </button>
            <a class="btn btn-secondary" href="reviews/">Смотреть все отзывы</a>
          </div>
        </div>
        {include 'file:modules/reviews/chunks/review-modals.tpl'} 

    </div>
  </div>
</div>
