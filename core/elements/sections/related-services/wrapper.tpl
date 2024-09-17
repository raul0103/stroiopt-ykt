
<div class="related-services section-margin">
    <div class="container">
        <h2 class="fs-h2 section-title">Сопутствующие услуги</h2>
        <div class="related-services__row">
            {'pdoResources' | snippet : [
            'parents' => 'related-services-id' | config
            'includeTVs' => 'main_image'
            'tvPrefix' => ''
            'tpl' => '@INLINE 
            <a class="related-services__item fw-600" href="{$uri}">
                <div class="related-services__item-image" style="background-image: url(\'{$main_image}\');"></div>
                <div class="related-services__item-title">{$menutitle?:$pagetitle}</div>
            </a>'
            ]}
        </div>
    </div>
</div>