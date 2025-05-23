{set $depth = $_modx->resource.depth ?: 3}
{set $filters = 'ms|price:number,'~$_modx->resource.filters}

{set $params = [
    'element' => 'msProducts'
    'depth' => $depth
    'limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['category-products']
    'parents' => $_modx->resource.id
    '-filters' => 'ms|price:number,msoption|dlina-mm,msoption|obem-m3,msoption|shirina-mm,msoption|standart,msoption|vysota-mm'
    'filters' => $filters
    'tplOuter' => '@FILE sections/category-listing/tpl-outer.tpl'
    'tplFilter.outer.ms|price' => '@FILE sections/category-listing/filters/tpl-filter-slider.tpl'
    'tplFilter.row.ms|price' => '@FILE sections/category-listing/filters/tpl-filter-number.tpl'
    'tplFilter.outer.default' => '@FILE sections/category-listing/filters/tpl-filter-outer.tpl'
    'tplFilter.row.default' => '@FILE sections/category-listing/filters/tpl-filter-row.tpl'
    'includeTVs' => 'hits_page,remains,priority'
    'sort' => 'tv|priority:asc',
    'tpls' => '@FILE modules/product-cards/chunks/tpl-item.tpl'
    'ajaxMode' => 'button'
    'suggestions' => 0
    'showEmptyFilters' => 1
    'suggestionsMaxFilters' => 0
    'suggestionsMaxResults' => 0
    'suggestionsSliders' => false
    'filterOptions' => '{ 
        "more_tpl" : "<button class=\"category-listing__btn-more btn_more\" type=\"button\">Показать еще</button>"
    }'


]}

{'!msPCS' | snippet}
{if $_modx->getPlaceholder('mspcs.option') || $_modx->getPlaceholder('mspcs.where')}
    {set $params['optionFilters'] = $_modx->getPlaceholder('mspcs.option')}
    {set $params['where'] = $_modx->getPlaceholder('mspcs.where')}
{/if}

{'!mFilter2' | snippet : $params}