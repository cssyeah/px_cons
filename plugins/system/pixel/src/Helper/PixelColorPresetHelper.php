<?php

namespace Joomla\Plugin\System\Pixel\Helper;

use Joomla\CMS\Factory;
use Joomla\Plugin\System\Pixel\PixelConfig;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Registry\Registry;

class PixelColorPresetHelper
{
    public static function getActivePreset()
    {
        $doc = Factory::getDocument();
        $params = $doc->params;
        $presetConfig = new Registry($params->get('color_preset'));
        $defaultConfig = static::getDefaultConfig();
        $defaultPreset = $presetConfig->get('default', $defaultConfig->get('default'));
        $cookieKey = PixelConfig::get('cookieKey', '');

        $input = Factory::getApplication()->input;
        $active = $input->cookie->get('pixel_active_preset_' . $cookieKey);

        $result = $active ?: $defaultPreset;

        $doc = Factory::getDocument();
        $doc->addScriptOptions('pixel_active_preset_' . $cookieKey, $result);
        $doc->addScriptOptions('pixel_preset_cookie_key', $cookieKey);

        return $result;
    }

    public static function loadPreset()
    {
        $doc = Factory::getDocument();
        $defaultConfig = static::getDefaultConfig();

        $presets = PixelConfig::get('presets', $defaultConfig->get('presets', []));
        $css = "\n/* Pixel Color Presets */\n";

        foreach ($presets as $preset) {
            $css .= "[data-px-theme=\"{$preset->name}\"] {";

            foreach ($preset->variables as $key => $value) {
                $css .= "$key:$value;";

                list($r, $g, $b) = sscanf($value, "#%02x%02x%02x");
                $css .= "$key-rgb:$r,$g,$b;";
            }

            $css .= "}\n";
        }

        $doc->addStyleDeclaration($css);
    }

    public static function getDefaultConfig()
    {
        $xml = PixelTemplate::getTemplateXml();
        $element = $xml->xpath("//field[@name='color_preset']");

        if (!$element) {
            return new Registry();
        }

        $data = $element[0];
        $default_preset = (string) $data->attributes()->default_preset;

        $presets = [];
        foreach ($data->preset as $item) {
            $preset = [
                'name' => (string) $item->attributes()->name,
            ];
            $variables = [];

            foreach ($item->variable as $var) {
                $varName = (string) $var->attributes()->name;
                $value = (string) $var[0];

                $variables[$varName] = $value;
            }

            $preset['variables'] = $variables;
            $presets[] = (object) $preset;
        }

        $output = new Registry();
        $output->set('default', $default_preset);
        $output->set('presets', $presets);

        return $output;
    }
}
