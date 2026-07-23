<?php

namespace Joomla\Module\WTFlexLayout\Site\Dispatcher;

use Joomla\CMS\Dispatcher\AbstractModuleDispatcher;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Registry\Registry;

defined('_JEXEC') or die;

class Dispatcher extends AbstractModuleDispatcher
{
    public function dispatch()
    {
        $this->loadLanguage();

        $displayData = $this->getLayoutData();

        // Stop when display data is false
        if ($displayData === false) {
            return;
        }

        // Execute the layout without the module context
        $loader = static function (array $displayData) {
            // If $displayData doesn't exist in extracted data, unset the variable.
            if (!\array_key_exists('displayData', $displayData)) {
                extract($displayData);
                unset($displayData);
            } else {
                extract($displayData);
            }

            /**
             * Extracted variables
             * -----------------
             * @var   \stdClass  $module
             * @var   Registry   $params
             */

            $flexstyle = $params->get('flexstyle', '');
            $frags = explode('|', $flexstyle);

            if (count($frags) !== 2) {
                return;
            }

            list($template, $name) = $frags;

            if ($template === 'mod_wt_flex_layout') {
                $file = JPATH_ROOT . '/modules/mod_wt_flex_layout/flexlayout/' . $name . '/tmpl/default.php';
                $xmlConfigFile = JPATH_ROOT . '/modules/mod_wt_flex_layout/flexlayout/' . $name . '/config.xml';
            } else {
                $file = JPATH_ROOT . '/templates/' . $template . '/flexlayout/' . $name . '/tmpl/default.php';
                $xmlConfigFile = JPATH_ROOT . '/templates/' . $template . '/flexlayout/' . $name . '/config.xml';
            }

            if (!is_file($file) || !is_file($xmlConfigFile)) {
                return;
            }

            HTMLHelper::stylesheet('modules/mod_wt_flex_layout/media/style.css');

            $xmlConfig = simplexml_load_file($xmlConfigFile);
            $relPath = $template === 'mod_wt_flex_layout' ? 'modules/mod_wt_flex_layout' : 'templates/' . $template;

            if (!empty($xmlConfig->assets->scripts->path)) {
                foreach ((array) $xmlConfig->assets->scripts->path as $path) {
                    HTMLHelper::script($path);
                    HTMLHelper::script($relPath . '/flexlayout/' . $name . '/' . $path);
                }
            }

            if (!empty($xmlConfig->assets->stylesheets->path)) {
                foreach ((array) $xmlConfig->assets->stylesheets->path as $path) {
                    HTMLHelper::stylesheet($path);
                    HTMLHelper::stylesheet($relPath . '/flexlayout/' . $name . '/' . $path);
                }
            }

            require $file;
        };

        $loader($displayData);
    }

    protected function getLayoutData()
    {
        $displayData = parent::getLayoutData();
        $styleconfig = new Registry($displayData['params']->get('styleconfig'));
        $displayData['styleconfig'] = $styleconfig;

        return $displayData;
    }
}
