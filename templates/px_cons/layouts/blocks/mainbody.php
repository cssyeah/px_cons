<?php

/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */

// This is the code which will be placed in the mainbody section

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelTemplate;

// No direct access.
defined('_JEXEC') or die;

$doc = Factory::getDocument();
?>

<div id="px-page-content" class="px-page-content wrap">
    <div id="px-content" class="px-content">
        <?php if ($doc->countModules('sidebar-l') && $doc->countModules('sidebar-r') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG):  
            echo PixelTemplate::renderBlock('mainbody/mainbody-two-sidebar');
        elseif ($doc->countModules('sidebar-l') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG):  
            echo PixelTemplate::renderBlock('mainbody/mainbody-sidebar-left');
        elseif ($doc->countModules('sidebar-r') && !PIXEL_LAYOUT_EDIT && !PIXEL_COM_CONFIG):
            echo PixelTemplate::renderBlock('mainbody/mainbody-sidebar-right');
        else:
            echo PixelTemplate::renderBlock('mainbody/mainbody-no-sidebar');
        endif; ?>
    </div><!-- #px-content -->
</div><!-- #px-page-content -->