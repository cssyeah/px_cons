<?php

use Joomla\Plugin\System\Pixel\PixelTemplate;

defined('_JEXEC') or die('Restricted access');

extract($displayData);

$itemMap = [];

foreach ($list as $item) {
    if (in_array($item->id, $config->menu_ids)) {
        $itemMap['item_' . $item->id] = $item;
    }
}

?>
<div class="px-mega-menuitem-wrapper">
    <ul class="px-mega-menuitem-list">
        <?php foreach ($itemMap as $item) : ?>
            <li>
                <?php
                $displayData['item'] = $item;

                switch ($item->type):
                    case 'separator':
                    case 'component':
                    case 'heading':
                    case 'url':
                        echo PixelTemplate::renderLayout('pixel/menu/default_' . $item->type, $displayData);
                        break;

                    default:
                        echo PixelTemplate::renderLayout('pixel/menu/default_url', $displayData);
                        break;
                endswitch;
                ?>
            </li>
        <?php endforeach ?>
    </ul>
</div>