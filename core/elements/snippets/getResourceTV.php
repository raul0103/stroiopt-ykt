<?php

/**
 * $id - resource ID
 * $tvName - Название TV
 */

$resource = $modx->getObject('modResource', $id);
return $resource->getTVValue($tvName);
