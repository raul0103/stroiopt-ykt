<div class="category-listing section-margin" id="mse2_mfilter">
  <div class="container">
    <div class="category-listing__row">
      <div class="category-listing__filters" data-filter-window>
        <div>
          <div class="category-listing__filters-title dark-color">
            Фильтры
            <span class="category-listing__filters-close sm-d-block" data-filter-window-close></span>
          </div>

          <form
            class="form category-listing__filters-row"
            action="{$_modx->resource.id | url}"
            method="post"
            id="mse2_filters"
          >
            {$filters} {*if $filters}
            <div class="d-flex justify-content-between">
              <button class="btn btn-light hidden" type="reset">
                {'mse2_reset' | lexicon}
              </button>
              <button class="btn btn-primary hidden" type="submit">
                {'mse2_submit' | lexicon}
              </button>
            </div>
            {/if*}
          </form>
        </div>
        <div class="category-listing__filters__mobile-controls sm-d-block">
          <button class="btn btn-primary" data-filter-window-close>Применить</button>
          <button class="btn btn-reset" data-filter-window-close onclick="mSearch2.reset();">Сбросить все фильтры</button>
        </div>

        {set $gosts = $_modx->resource.gosts}
      
        {if $gosts}
          {set $gosts = $gosts | fromJSON}
          {include "file:blocks/gosts.tpl" gosts=$gosts}
        {/if}

      </div>

      <div class="category-listing__content">
        <div class="section-margin">
          <div class="category-listing__controls fs-body-1">
            <div class="category-listing__controls-item" id="mse2_sort">
              <label class="sm-d-none">Сортировать по:</label>
              <a
                class="category-listing__controls-item-sort-item"
                href="#"
                data-sort="tv|hits_page"
                data-default="desc"
              >
              <span class="has-icon has-icon-sort sm-d-block"></span>
                Популярности
              </a>
              <a
                class="category-listing__controls-item-sort-item"
                href="#"
                data-sort="ms|price"
                data-default="desc"
              >
                Цене
              </a>
            </div>
            <div class="category-listing__controls-item sm-d-none">
              <label>Показывать по:</label>
              <div class="category-listing__controls-item-select pseudo-arrow pseudo-arrow__down">
                  <select class="fw-600" name="mse_limit" id="mse2_limit" >
                      {foreach [12, 24, 48, 98] as $v}
                          <option value="{$v}"{if $limit == $v} selected{/if}>{$v}</option>
                      {/foreach}
                  </select>
              </div>
            </div>
            <button class="has-icon has-icon-filter sm-d-block" data-filter-window-open>Фильтр</button>
          </div>

          <div class="chips">
            <div class="chips__row" id="mse2_selected" style="display: none;"></div>
          </div>

          <div class="category-listing__products" id="mse2_results">
            {$results}
          </div>

          <div class="mse2_pagination">{'page.nav' | placeholder}</div>
        </div>

        {include "file:sections/content-section/wrapper.tpl"}
      </div>
    </div>
  </div>
</div>
