{extends "file:layouts/base.tpl"} 


{block 'content'}
    <div class="contents-page section-margin section-margin-top">
        <div class="page-container">
            <h2 class="fs-h2 section-title">{$_modx->resource.pagetitle}</h2>
            <div class="contents-page__row">
                <div class="contents-page__image" style="background-image: url('{$_modx->resource.main_image}');">
                </div>
                <div class="page-content">
                    {$_modx->resource.content}
                </div>
            </div>
        </div>
    </div>
    {include "file:sections/advantages/wrapper.tpl"}
    {include "file:sections/callback-section/wrapper.tpl"}
{/block}
