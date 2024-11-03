<div class="pop-cat section-margin" id="pop-cat">
    <div class="container">
        <h2 class="fs-h2 section-title">Каталог ЖБИ изделий</h2>
        <div class="pop-cat__row">
            {'pdoMenu' | snippet : [
            'level' => 2
            'where' => '{"class_key":"msCategory"}'
            'parents' => 'catalog_id' | option
            'includeTVs' => 'main_image'
            'tvPrefix' => ''
            'tplOuter' => '@INLINE {$wrapper}'
            'tpl' => '@INLINE <a href="{$link}" class="pseudo-arrow pseudo-arrow__right hover-opacity-7">{$menutitle}</a> '
            'tplInner' => '@INLINE {$wrapper}'
            'tplParentRow' => '@FILE modules/popular-categories/chunks/parent-row.tpl'
            ]}
        </div>
    </div>
</div>