<?php

namespace Joomla\Plugin\System\Pixel;

use Joomla\CMS\Factory;
use Joomla\CMS\Table\Table;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

class PixelConfig
{
    protected static $template;
    protected static $config;

    protected static function loadConfig(): Registry
    {
        if (!self::$config) {
            if (!self::$template) {
                self::$template = Factory::getApplication()->getTemplate();
            }

            $extension = Table::getInstance('Extension');
            $extension->load(['type' => 'template', 'element' => self::$template]);
            self::$config = new Registry($extension->custom_data);
        }

        return self::$config;
    }

    public static function get($key = '', $default = '')
    {
        $config = self::loadConfig();

        return $config->get($key, $default);
    }

    public static function store(Table &$table)
    {
        $params = new Registry($table->params);
        $gkConfig = new Registry();

        $gkConfig->set('optimize_js', $params->get('optimize_js', 0));
        $gkConfig->set('optimize_css', $params->get('optimize_css', 0));
        $gkConfig->set('js_excluded', $params->get('js_excluded', ''));
        $gkConfig->set('css_excluded', $params->get('css_excluded', ''));

        $gkConfig->set('custom_code_after_head', $params->get('custom_code_after_head', ''));
        $gkConfig->set('custom_code_before_head', $params->get('custom_code_before_head', ''));
        $gkConfig->set('custom_code_after_body', $params->get('custom_code_after_body', ''));
        $gkConfig->set('custom_code_before_body', $params->get('custom_code_before_body', ''));

        $colorPreset = new Registry($params->get('color_preset', ''));
        $presets = $colorPreset->get('presets', []);
        $cookieKey = $colorPreset->get('cookieKey', '');
        $gkConfig->set('presets', $presets);
        $gkConfig->set('cookieKey', $cookieKey);

        $megamenu = new Registry($params->get('megamenu', []));
        $gkConfig->set('megamenu', $megamenu);

        $extension = Table::getInstance('Extension');
        $extension->load(['type' => 'template', 'element' => $table->template]);

        if ($extension->extension_id) {
            $extension->custom_data = $gkConfig->toString();
            $extension->store();
        }

        self::removePixelConfig($params);
        $table->params = $params->toString();
    }

    public static function removePixelConfig(Registry &$params)
    {
        $params->set('optimize_js', 0);
        $params->set('optimize_css', 0);
        $params->set('js_excluded', '');
        $params->set('css_excluded', '');
        $params->set('custom_code_after_head', '');
        $params->set('custom_code_before_head', '');
        $params->set('custom_code_after_body', '');
        $params->set('custom_code_before_body', '');

        $colorPreset = new Registry($params->get('color_preset', ''));
        $colorPreset->remove('presets');
        $colorPreset->remove('cookieKey');
        $params->set('color_preset', $colorPreset->toString());

        $params->set('megamenu', '{}');
    }

    public static function injectPixelConfig(&$data)
    {
        self::$template = $data->template;

        $params = new Registry($data->params);
        $params->set('optimize_js', self::get('optimize_js', 0));
        $params->set('optimize_css', self::get('optimize_css', 0));
        $params->set('js_excluded', self::get('js_excluded', ''));
        $params->set('css_excluded', self::get('css_excluded', ''));
        $params->set('custom_code_after_head', self::get('custom_code_after_head', ''));
        $params->set('custom_code_before_head', self::get('custom_code_before_head', ''));
        $params->set('custom_code_after_body', self::get('custom_code_after_body', ''));
        $params->set('custom_code_before_body', self::get('custom_code_before_body', ''));

        $presets = self::get('presets', []);
        $colorPreset = new Registry($params->get('color_preset', ''));
        $colorPreset->set('presets', $presets);
        $colorPreset->set('cookieKey', self::get('cookieKey'));
        $params->set('color_preset', $colorPreset->toString());

        $megamenu = new Registry(self::get('megamenu', ''));
        $params->set('megamenu', $megamenu->toString());

        $data->params = $params->toArray();
    }
}
