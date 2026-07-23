<?php

namespace Joomla\Plugin\System\Pixel\Element;

use Joomla\Plugin\System\Pixel\PixelTemplate;

class PixelScrollTopElement
{
    public static function render()
    {
        echo PixelTemplate::renderLayout('pixel/scrolltop');
    }
}