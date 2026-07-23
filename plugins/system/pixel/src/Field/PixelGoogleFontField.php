<?php

namespace Joomla\Plugin\System\Pixel\Field;

use Joomla\CMS\Factory;
use Joomla\CMS\Form\FormField;
use Joomla\Plugin\System\Pixel\PixelTemplate;

defined('_JEXEC') or die('Restricted access');

class PixelGoogleFontField extends FormField
{
    protected $type = 'PixelGoogleFont';

    public function getInput()
    {
        // fonts json from https://gwfh.mranftl.com/api/fonts/
        $json = JPATH_PLUGINS . '/system/pixel/media/vendor/googfonts/fonts.json';
        $rawFonts = (array) json_decode(file_get_contents($json));
        $fonts = array_map(function ($font) {

            return [
                'id' => $font->id,
                'family' => $font->family,
                'variants' => $font->variants,
            ];
        }, $rawFonts);

        $doc = Factory::getDocument();
        $doc->addScriptOptions('googlefonts', $fonts);

        $data = [
            'id' => $this->id,
            'value' => $this->value,
            'name' => $this->name,
            'fieldname' => $this->fieldname,
            'variable' => (string) $this->element->attributes()->variable,
        ];

        return PixelTemplate::renderLayout('pixel/fields/pixelgooglefont', $data);
    }
}
