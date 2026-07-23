<?php

namespace Joomla\Plugin\System\Pixel\Helper;

use Joomla\CMS\Factory;
use Joomla\Filesystem\Folder;
use Joomla\CMS\Form\Form;
use Joomla\CMS\Helper\ModuleHelper;

class PixelFormHelper
{
    public static function extendAdminForm(Form $form, $data)
    {
        $input = Factory::getApplication()->input;
        $name = $form->getName();

        if ($name === 'com_modules.module') {
            $module = isset($data->module) ? $data->module : '';

            if (!$module) {
                $jform = $input->get("jform", [], 'array');
                $module = $jform['module'];
            }

            if ($module) {
                $files = self::findXmlFiles($module);

                foreach ($files as $file) {
                    $form->loadFile($file);
                }
            }

            $globalFiles = self::findXmlFiles('com_modules.module');

            foreach ($globalFiles as $file) {
                $form->loadFile($file);
            }
        }
    }

    public static function extendSiteForm(Form $form)
    {
        $input = Factory::getApplication()->input;
        $name = $form->getName();

        if ($name === 'com_config.modules' || $name === 'com_modules.module') {
            $id = $input->getString('id', '');
            $module = ModuleHelper::getModuleById($id);

            if ($module) {
                $name = strtolower($module->module);
                $files = self::findXmlFiles($name);

                foreach ($files as $file) {
                    $form->loadFile($file);
                }
            }

            $globalFiles = self::findXmlFiles('com_modules.module');

            foreach ($globalFiles as $file) {
                $form->loadFile($file);
            }
        }
    }

    public static function findXmlFiles($name)
    {
        $files = [];
        $templates = Folder::folders(JPATH_SITE . '/templates', '.', false, true);

        foreach ($templates as $tpl) {
            $xmlFile = $tpl . '/templateDetails.xml';
            $extendFormFile = $tpl . '/form/' . $name . '.xml';

            if (!is_file($xmlFile)) {
                continue;
            }

            $xml = simplexml_load_file($xmlFile);

            if ((string) $xml->pixel && is_file($extendFormFile)) {
                $files[] = $extendFormFile;
            }
        }

        return $files;
    }
}
