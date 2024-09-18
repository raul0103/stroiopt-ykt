<?php

/**
 * Получаем данные для меню каталога в формате JSON и кэшируем
 */
$cache_name = "catalog-menu";
$cache_options = [
    xPDO::OPT_CACHE_KEY => 'default/catalog-menu/' . $modx->context->key . '/',
];

if (!$output = $modx->cacheManager->get($cache_name, $cache_options)) {
    if (!$catalog_id = $modx->getOption('catalog_id')) die(json_encode([
        "status" => "error",
        "message" => "Не найдена опция modx: catalog_id. Добавьте в настройках контекста"
    ]));

    $output = $modx->runSnippet('pdoMenu', [
        'parents' => $catalog_id,
        'level' => 2,
        'tplOuter' => '@INLINE [{$wrapper}]',
        'tplInner' => '@INLINE {$wrapper}',
        'tpl' => '@INLINE {
                        "link" : "{$link}",
                        "menutitle" : "{$menutitle}"
                    }',
        'tplParentRow' => '@INLINE {
                                "id": {$id},
                                "menutitle" : "{$menutitle}",
                                "link" : "{$link}",
                                "children" : [{$wrapper}]
                            }'
    ]);

    $modx->cacheManager->set($cache_name, $output, 0, $cache_options);
}

return $output;
