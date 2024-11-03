<div class="related-services section-margin">
    <div class="container">
        <h2 class="fs-h2 section-title">Сопутствующие услуги</h2>
        <div class="related-services__row">
            {'pdoResources' | snippet : [
                'parents' => 'related-services-id' | config
                'includeTVs' => 'main_image'
                'tvPrefix' => ''
                'tpl' => '@FILE sections/related-services/item.tpl'
            ]}
        </div>
    </div>
</div>