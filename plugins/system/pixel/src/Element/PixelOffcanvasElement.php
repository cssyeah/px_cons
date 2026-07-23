<?php

namespace Joomla\Plugin\System\Pixel\Element;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Pixel\PixelTemplate;

class PixelOffcanvasElement
{
    public static function render($name = 'pixel/offcanvas')
    {
        HTMLHelper::_('bootstrap.offcanvas');

        echo PixelTemplate::renderLayout($name);
    }
}