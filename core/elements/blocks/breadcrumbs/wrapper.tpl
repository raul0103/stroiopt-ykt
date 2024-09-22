{'pdoCrumbs' | snippet : [
    'tplWrapper' => '@FILE blocks/breadcrumbs/tpl-outer.tpl'
    'tpl' => '@FILE blocks/breadcrumbs/tpl-item.tpl'
    'showHome' => 1
    'exclude' => 'catalog_id' | config
    'outputSeparator' => '<li class="breadcrumb-item">→</li>'
]}