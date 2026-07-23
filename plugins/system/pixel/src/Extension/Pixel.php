<?php

namespace Joomla\Plugin\System\Pixel\Extension;

use Exception;
use Joomla\CMS\Factory;
use Joomla\CMS\Form\Form;
use Joomla\CMS\Plugin\CMSPlugin;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\Plugin\System\Pixel\PixelConfig;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Plugin\System\Pixel\Helper\PixelFormHelper;
use Joomla\Plugin\System\Pixel\Helper\PixelOptimizeHelper;

defined('_JEXEC') or die('Restricted access');

class Pixel extends CMSPlugin
{
    public function onAfterRoute()
    {
        if (PixelTemplate::isPixelTemplate()) {
            define('PIXELTEMPLATE', 1);

            $app = Factory::getApplication();
            $input = $app->input;
            $option = $input->get('option');
            $view = $input->get('view');

            if ($option === 'com_config' && $view === 'templates') {
                throw new Exception("Pixel Framework do not support edit template config at frontend.", 500);
            }
        }
    }

    public function onExtensionBeforeSave($context, $table, $isNew)
    {
        if ($isNew || $context !== 'com_templates.style') {
            return;
        }

        PixelConfig::store($table);
    }

    public function onContentPrepareForm(Form $form, $data)
    {
        $app = Factory::getApplication();

        if ($app->isClient('administrator')) {
            PixelFormHelper::extendAdminForm($form, $data);
        }

        if ($app->isClient('site')) {
            PixelFormHelper::extendSiteForm($form);
        }

        $formName = $form->getName();
        if ($formName === 'com_templates.style') {
            $gkFields = $form->getXml()->xpath("//fieldset[@addfieldprefix=\"Joomla\\Plugin\\System\\Pixel\Field\"]");

            if ($gkFields && $data) {
                $lang = $app->getLanguage();
                $lang->load('plg_system_pixel', JPATH_ADMINISTRATOR);

                PixelConfig::injectPixelConfig($data);
                define('ON_PIXELTEMPLATE_FORM', 1);
            }
        }
    }

    public function onAfterRender()
    {
        if (!defined('PIXELTEMPLATE')) {
            return;
        }

        $app = Factory::getApplication();
        $input = $app->input;

        $option = $input->get('option');
        $view = $input->get('view');
        $layout = $input->get('layout');

        if ($option === 'com_config' || ($option === 'com_content' && $view === 'form' && $layout === 'edit')) {
            return;
        }

        $html = $app->getBody();
        $frags = explode('</head>', $html);
        if (count($frags) !== 2) {
            return;
        }

        $head = $frags[0];
        $body = $frags[1];
        $onDevMode = PluginHelper::isEnabled('system', 'jadev');

        if (PixelConfig::get('optimize_css') && !$onDevMode) {
            $cssExcluded = PixelConfig::get('css_excluded', '');
            $cssExcludedFiles = array_filter(array_map('strtolower', explode("\n", $cssExcluded)));

            $head = PixelOptimizeHelper::css($head, $cssExcludedFiles);
        }

        if (PixelConfig::get('optimize_js') && !$onDevMode) {
            $jsExcluded = PixelConfig::get('js_excluded', '');
            $jsExcludedFiles = array_filter(array_map('strtolower', explode("\n", $jsExcluded)));

            $head = PixelOptimizeHelper::js($head, $jsExcludedFiles);
        }

        $return = $head . '</head>' . $body;

        $app->setBody($return);
    }
}
