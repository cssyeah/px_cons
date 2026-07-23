<?php

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;

defined('_JEXEC') or die('Restricted access');

extract($displayData);

$itemParams = $item->getParams();

if (!$itemParams->get('menu_show')) {
    return '';
}

$class      = 'px-menu-item';

if ($item->id == $default_id) {
    $class .= ' default';
}

if ($item->id == $active_id || ($item->type === 'alias' && $itemParams->get('aliasoptions') == $active_id)) {
    $class .= ' current';
}

if (in_array($item->id, $path)) {
    $class .= ' active';
} elseif ($item->type === 'alias') {
    $aliasToId = $itemParams->get('aliasoptions');

    if (count($path) > 0 && $aliasToId == $path[count($path) - 1]) {
        $class .= ' active';
    } elseif (in_array($aliasToId, $path)) {
        $class .= ' alias-parent-active';
    }
}

if ($item->type === 'separator') {
    $class .= ' divider';
}

if ($item->deeper) {
    $class .= ' deeper';
}

if ($item->parent) {
    $class .= ' parent';
}

$class .= ' level' . $level;

if ($level === 0) {
    $extraParams = $megaParams->get('item_' . $item->id);
    $extra_class = $extraParams->extra_class ?? '';
    $class .= $extra_class ? ' ' . $extra_class : '';
}

echo '<li class="' . $class . '" data-id="' . $item->id . '">';

$layoutData = [
    'item' => $item,
    'active_id' => $active_id,
];

switch ($item->type):
    case 'separator':
    case 'component':
    case 'heading':
    case 'url':
        echo PixelTemplate::renderLayout('pixel/menu/default_' . $item->type, $layoutData);
        break;

    default:
        echo PixelTemplate::renderLayout('pixel/menu/default_url', $layoutData);
        break;
endswitch;

if ($item->deeper) {
    echo '<ul class="px-menu-sub px-menu-sub-deeper">';

    $nextLevel = $displayData['level'] + 1;
    $viewLevels = Factory::getUser()->getAuthorisedViewLevels();

    foreach ($item->getChildren() as $child) {
        if (!in_array($child->access, $viewLevels)) {
            continue;
        }

        $displayData['level'] = $nextLevel;
        $displayData['item'] = $child;

        echo PixelTemplate::renderLayout('pixel/menu/default_item', $displayData);
    }
    echo '</ul>';
}

echo '</li>';
