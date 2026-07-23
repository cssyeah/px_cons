<?php

use Joomla\Plugin\System\Pixel\PixelTemplate;

defined('_JEXEC') or die('Restricted access');

extract($displayData);

$itemParams = $item->getParams();
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

$class .= ' deeper';

if ($item->parent) {
    $class .= ' parent';
}

$megaData = $megaParams->get('item_' . $item->id);
$extra_class = $megaData->extra_class ?? '';
$class .= $extra_class ? ' ' . $extra_class : '';

$layoutData = [
    'item' => $item,
    'active_id' => $active_id,
];

$item->deeper = true;
?>

<li class="<?php echo $class ?> level0" data-id="<?php echo $item->id ?>">
    <?php
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

    $isFluid = isset($megaData->fluid) && $megaData->fluid === 'on' ? true : false;
    $megaWidth = $megaData->width ?? '640';
    $megaStyle = $isFluid ? '' : 'width: ' . $megaWidth . 'px';
    $megaGridData = $megaData->data ?? [];
    ?>
    <div class="px-menu-sub px-menu-mega-wrapper <?php echo $isFluid ? 'px-mega-fluid' : '' ?>" style="<?php echo $megaStyle ?>">
        <?php foreach ($megaGridData as $row) : ?>
            <div class="<?php echo $isFluid ? 'container' : '' ?>">
                <div class="px-mega-row row">
                    <?php foreach ($row as $col) : ?>
                        <div class="px-mega-col col <?php echo trim($col->extra_class ?? '') ?>">
                            <div class="px-menu-col-inner">
                                <?php
                                $displayData['config'] = $col;

                                echo PixelTemplate::renderLayout('pixel/menu/default_mega_' . $col->content_type, $displayData);
                                ?>
                            </div>
                        </div>
                    <?php endforeach ?>
                </div>
            </div>
        <?php endforeach ?>
    </div>
</li>