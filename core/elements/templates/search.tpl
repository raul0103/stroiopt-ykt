{extends "file:layouts/base.tpl"} 

{block 'content'}
<div class="search-page section-margin section-margin-top">
    <div class="container">
        <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
        {'SimpleSearch' | snippet : [
            'containerTpl' => '@INLINE 
            <p class="simplesearch-results">{$resultInfo}</p>

            <div class="simplesearch-results-list">
                {$results}
            </div>

            <div class="simplesearch-paging">
                <span class="simplesearch-result-pages">Страницы с результатами поиска:</span>
                {$paging}
            </div>
            '
            'tpl' => '@INLINE 
            <div class="simplesearch-result">
                <div class="fs-title-1">{$idx}. <a href="{$link}" title="{$longtitle}">{$pagetitle}</a></div>
                <div class="extract">
                    <p>{$extract}</p>
                </div>
            </div>
            '
        ]}
    </div>
</div>
{/block}
