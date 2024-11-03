{'pdoCrumbs' | snippet : [
    'tplWrapper' => '@FILE blocks/breadcrumbs/tpl-outer.tpl'
    'tpl' => '@FILE blocks/breadcrumbs/tpl-item.tpl'
    'tplCurrent' => '@FILE blocks/breadcrumbs/tpl-current.tpl'
    'tplHome' => '@FILE blocks/breadcrumbs/tpl-home.tpl'
    'showHome' => 1
    'exclude' => 'catalog_id' | config
    'where' => '{"template:!=":0}'
    'outputSeparator' => '<li class="breadcrumb-item">→</li>'
]}