<?php

use Joomla\CMS\Helper\ModuleHelper;

defined('_JEXEC') or die('Restricted access');

extract($displayData);
$modules = ModuleHelper::getModules($config->position);
?>
<div class="px-mega-position-wrapper">
    <?php foreach ($modules as $module): ?>
        <div class="px-mega-module <?php echo 'px-mod-' . $module->id ?>">
            <?php echo ModuleHelper::renderModule($module) ?>
        </div>
    <?php endforeach ?>
</div>