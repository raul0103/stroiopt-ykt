<div class="category-listing section-margin" id="mse2_mfilter">
  <div class="container">
    <div class="category-listing__row">
      <div class="category-listing__filters">
        <div class="category-listing__filters-title dark-color fs-title-1">
          Фильтры
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

      <div class="category-listing__content">
        <div class="category-listing__controls fs-body-1">
          <div class="category-listing__controls-item" id="mse2_sort">
            <label>Сортировать по:</label>
            <a
              class="category-listing__controls-item-sort-item"
              href="#"
              data-sort="tv|hits_page"
              data-default="desc"
            >
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
          <div class="category-listing__controls-item">
            <label>Показывать по:</label>
            <div class="category-listing__controls-item-select pseudo-arrow pseudo-arrow__down">
                <select class="fw-600" name="mse_limit" id="mse2_limit" >
                    {foreach [12, 24, 48, 98] as $v}
                        <option value="{$v}"{if $limit == $v} selected{/if}>{$v}</option>
                    {/foreach}
                </select>
            </div>
          </div>
        </div>

        {*
        <div class="row">
          {if $tpls}
          <div id="mse2_tpl" class="col-md-6">
            <a href="#" data-tpl="0" class="{$tpl0}"
              >{'mse2_chunk_default' | lexicon}</a
            >
            /
            <a href="#" data-tpl="1" class="{$tpl1}"
              >{'mse2_chunk_alternate' | lexicon}</a
            >
          </div>
          {/if}
        </div>

        <div id="mse2_selected_wrapper">
          <div id="mse2_selected">
            {'mse2_selected' | lexicon}:<span></span>
          </div>
        </div>
        *}

        <div class="category-listing__products" id="mse2_results">
          {$results}
        </div>

        <div class="mse2_pagination">{'page.nav' | placeholder}</div>
      </div>
    </div>
  </div>
</div>
