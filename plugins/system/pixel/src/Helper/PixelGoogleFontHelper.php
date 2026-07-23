<?php

namespace Joomla\Plugin\System\Pixel\Helper;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Registry\Registry;

class PixelGoogleFontHelper
{
    public static function initFont()
    {
        $doc = Factory::getDocument();
        $params = $doc->params;
        $xml = PixelTemplate::getTemplateXml();
        $xmlFields = $xml->xpath('//field[@type="PixelGoogleFont"]');
        $fields = array_map(function ($field) {
            return [
                'name' => (string) $field->attributes()->name,
                'variable' => (string) $field->attributes()->variable,
            ];
        }, $xmlFields);

        if ($fields) {
            HTMLHelper::stylesheet('https://fonts.googleapis.com', [], ['rel' => 'preconnect']);
            HTMLHelper::stylesheet('https://fonts.gstatic.com', [], ['rel' => 'preconnect', 'crossorigin' => true]);
        }

        $fontFamilies = [];
        $fontSelectors = [];

        foreach ($fields as $field) {
            $data = new Registry($params->get($field['name']));

            if (!$data->get('id')) {
                continue;
            }

            $fontFamilies[] = static::addFont($field['variable'], $data);

            if ($data->get('selectors') && $field['variable']) {
                $fontSelectors[] = static::applyFontSelectors($data->get('selectors', ''), $field['variable']);
            }
        }

        $css = "\n/* Pixel Google Fonts */\n";
        $css .= ":root {";
        $css .= implode("", $fontFamilies);
        $css .= "}\n";
        $css .= implode("", $fontSelectors);

        $doc->addStyleDeclaration($css);
    }

    protected static function applyFontSelectors($selectors, $var)
    {
        $selectors = trim($selectors);
        $selectors = trim($selectors, ',');
        $css = '';

        if ($selectors) {
            $css .= "$selectors {";
            $css .= "font-family: var($var);";
            $css .= "}\n";
        }

        return $css;
    }

    protected static $googleFonts = [];

    protected static function addFont(string $variable, Registry $font)
    {
        if (!static::$googleFonts) {
            // fonts json from https://gwfh.mranftl.com/api/fonts/
            $jsonPath = JPATH_PLUGINS . '/system/pixel/media/vendor/googfonts/fonts.json';
            $data = json_decode(file_get_contents($jsonPath));

            foreach ($data as $item) {
                static::$googleFonts[$item->id] = $item;
            }
        }

        $data = static::$googleFonts[$font->get('id')] ?? false;

        if (!$data) {
            return;
        }

        $fontFamily = urlencode($data->family);

        $selected = $font->get('selected', []);
        if (!$selected) {
            $familyString = $fontFamily;
        }

        if ($selected) {
            $weight = [];

            foreach ($selected as $value) {
                if ($value === 'regular') {
                    $weight[] = '0,400';
                }

                if ($value === 'italic') {
                    $weight[] = '1,400';
                }

                if (preg_match('/^\d+$/', $value)) {
                    $weight[] = "0,$value";
                }

                if (preg_match('/^(\d+)italic/', $value, $match)) {
                    $weight[] = "1," . $match[1];
                }
            }

            sort($weight);

            $weightString = implode(';', $weight);
            $familyString = "$fontFamily:ital,wght@$weightString";
        }

        $link = "https://fonts.googleapis.com/css2?family=$familyString&display=swap";

        HTMLHelper::stylesheet($link);

        return "$variable: '{$data->family}', {$data->category};";
    }
}
