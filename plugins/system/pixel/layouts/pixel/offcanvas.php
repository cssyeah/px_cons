<?php

use Joomla\CMS\Helper\ModuleHelper;

defined('_JEXEC') or die('Restricted access');

$modules = ModuleHelper::getModules('offcanvas');
?>

<div class="px-offcanvas-wrapper">
    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#px-offcanvas">
        <i class="fas fa-bars"></i>
    </button>

    <div class="offcanvas offcanvas-start" tabindex="-1" id="px-offcanvas" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <?php foreach ($modules as $module) : ?>
                <div class="px-offcanvas-module-content">
                    <?php echo ModuleHelper::renderModule($module) ?>
                </div>
            <?php endforeach ?>
        </div>
    </div>
</div>