<?php

namespace Joomla\Plugin\System\Pixel\Element;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Pixel\PixelTemplate;

defined('_JEXEC') or die('Restricted access');


class PixelPresetElement
{
    public static function renderPresetDropdown($presets = [])
    {
        HTMLHelper::_('behavior.core');
        HTMLHelper::_('bootstrap.dropdown');
        HTMLHelper::script('plugins/system/pixel/media/js/pixeltheme.js', [], ['type' => 'module']);

        echo PixelTemplate::renderLayout('pixel/preset/dropdown', ['presets' => $presets]);
    }

    public static function renderPresetToggle($presetA, $presetB)
    {
        HTMLHelper::_('behavior.core');
        HTMLHelper::script('plugins/system/pixel/media/js/pixeltheme.js', [], ['type' => 'module']);

        echo PixelTemplate::renderLayout('pixel/preset/toggle', ['presets' => [$presetA, $presetB]]);
    }
}
