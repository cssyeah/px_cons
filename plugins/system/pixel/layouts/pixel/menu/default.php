<?php

defined('_JEXEC') or die;

use Joomla\Plugin\System\Pixel\PixelTemplate;

extract($displayData);

$mainMenuLevel = 999;
$mainMenu = [];

foreach ($list as $item) {
    if ($item->level > $mainMenuLevel) {
        continue;
    }

    $mainMenuLevel = $item->level;
    $mainMenu[] = $item;
}

$id = '';

if ($tagId = $params->get('tag_id', '')) {
    $id = ' id="' . $tagId . '"';
}
?>
<div class="px-menu-wrapper px-mod-<?php echo $moduleid ?>" menu-mode="<?php echo $mode ?>">
    <div class="px-menu">
        <ul <?php echo $id; ?> class="px-nav<?php echo ' ' . $class_sfx; ?>">
            <?php foreach ($mainMenu as $i => $item) {
                $displayData['level'] = 0;
                $displayData['item'] = $item;
                $megaData = $megaParams->get('item_' . $item->id);

                if (
                    is_object($megaData)
                    && isset($megaData->megamenu)
                    && $megaData->megamenu === 'on'
                ) {
                    echo PixelTemplate::renderLayout('pixel/menu/default_mega', $displayData);
                } else {
                    echo PixelTemplate::renderLayout('pixel/menu/default_item', $displayData);
                }
            }
            ?>
        </ul>
    </div>
</div>