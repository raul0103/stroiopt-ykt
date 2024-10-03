<?php

/**
 * Получаем данные для меню в формате JSON и кэшируем
 */

global $modx;

$cache_name = $parent_id;
$cache_options = [
    xPDO::OPT_CACHE_KEY => 'default/mobile-menu/' . $modx->context->key . '/',
];

if (!$output = $modx->cacheManager->get($cache_name, $cache_options)) {
    $output = $modx->runSnippet('pdoMenu', [
        'parents' => $parent_id ?: 0,
        'level' => $level ?: 2,
        'where' => $where,
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
