<div class="pop-cat section-margin" id="pop-cat">
    <div class="container">
        <h2 class="fs-h2 section-title">Популярные категории ЖБИ изделий</h2>
        <div class="pop-cat__row">
            {'pdoMenu' | snippet : [
            'level' => 2
            'where' => '{"class_key":"msCategory"}'
            'parents' => 'catalog_id' | option
            'includeTVs' => 'main_image'
            'tvPrefix' => ''
            'tplOuter' => '@INLINE {$wrapper}'
            'tpl' => '@INLINE <a href="{$link}" class="pseudo-arrow pseudo-arrow__right">{$menutitle}</a> '
            'tplInner' => '@INLINE {$wrapper}'
            'tplParentRow' => '@INLINE
                    <div class="pop-cat__item">
                        <div class="pop-cat__item-left">
                            <div>
                                <a href="{$link}" class="pop-cat__item-title fs-title-1 btn-link">
                                    <span
                                    class="pop-cat__item-image-small"
                                    style="background-image: url(\'{$main_image}\')"
                                    ></span>
                                    {$menutitle}
                                </a>
                                <div data-pop-cat="pop-cat-{$id}" class="pop-cat__item-childs fs-body-1">
                                    {$wrapper}
                                </div>
                            </div>
                            <div data-active-text="Скрыть" data-pop-cat-more="pop-cat-{$id}" class="pop-cat__show-more btn-link fw-600 pseudo-arrow pseudo-arrow__down">Показать еще</div>
                        </div>
                        <div
                        class="pop-cat__item-image"
                        style="background-image: url(\'{$main_image}\')"
                        ></div>
                    </div>'
            ]}
        </div>
    </div>
</div>