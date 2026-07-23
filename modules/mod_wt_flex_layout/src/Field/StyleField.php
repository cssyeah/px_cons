<?php

namespace Joomla\Module\WTFlexLayout\Site\Field;

use Joomla\CMS\Factory;
use Joomla\CMS\Form\FormField;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Uri\Uri;
use Joomla\Filesystem\Folder;

defined('_JEXEC') or die('Restricted access');

class StyleField extends FormField
{
    protected $type = 'Style';

    public function renderField($options = [])
    {
        $input = Factory::getApplication()->input;

        if (!is_null($input->getString('flexstyle'))) {
            $this->value = $input->getString('flexstyle');
        }

        HTMLHelper::script('modules/mod_wt_flex_layout/media/flexlayout-app/dist/main.js');
        HTMLHelper::stylesheet('modules/mod_wt_flex_layout/media/flexlayout.css');

        return parent::renderField($options);
    }

    protected function getInput()
    {
        $doc = Factory::getDocument();
        $doc->addScriptOptions('flexlayout-data', $this->getData());

        return '
            <div id="flexlayout-app"></div>
            <input type="hidden" name="' . $this->name . '" value="' . $this->value . '" />
        ';
    }

    protected function getData()
    {
        $moduleLayouts = $this->getModuleLayouts();
        $templateLayouts = $this->getTemplateLayouts();

        $_categories = array_merge($moduleLayouts['categories'], $templateLayouts['categories']);

        $keys = array_keys($_categories);
        sort($keys);

        $sortedCategories = array_map(function ($key) use ($_categories) {
            return $_categories[$key];
        }, $keys);

        $categories = array_combine($keys, $sortedCategories);

        $data = [
            'categories' => $categories,
            'styles' => array_merge($moduleLayouts['styles'], $templateLayouts['styles']),
            'templates' => array_merge($moduleLayouts['templates'], $templateLayouts['templates']),
            'value' => $this->value,
        ];

        return $data;
    }

    protected function getModuleLayouts()
    {
        $categories = [];
        $templates = ['mod_wt_flex_layout' => Text::_('MOD_WT_FLEX_LAYOUT')];
        $styles = [];

        $defaultPreviewPath = '/modules/mod_wt_flex_layout/media/default-preview.jpg';
        $path = JPATH_ROOT . '/modules/mod_wt_flex_layout/flexlayout';

        $folders = Folder::folders($path);

        if (!$folders) {
            return [];
        }

        foreach ($folders as $folder) {
            $xmlFile = $path . '/' . $folder . '/config.xml';

            if (!is_file($xmlFile)) {
                continue;
            }

            $xml = simplexml_load_file($xmlFile);

            if (!$xml->title) {
                continue;
            }

            $layoutPreviewPath = "/modules/mod_wt_flex_layout/flexlayout/$folder/preview.jpg";
            $previewUrl = is_file(JPATH_ROOT . $layoutPreviewPath) ? Uri::root(true) . $layoutPreviewPath : Uri::root(true) . $defaultPreviewPath;
            $previewFile = is_file(JPATH_ROOT . $layoutPreviewPath) ? JPATH_ROOT . $layoutPreviewPath : JPATH_ROOT . $defaultPreviewPath;

            list($width, $height) = getimagesize($previewFile);

            $style = [
                'title' => (string) $xml->title,
                'template' => 'mod_wt_flex_layout',
                'value' => 'mod_wt_flex_layout|' . $folder,
                'categories' => [],
                'preview' => [
                    'url' => $previewUrl,
                    'width' => $width,
                    'height' => $height,
                ]
            ];

            if ($xml->categories) {
                foreach ((array) $xml->categories->value as $cat) {
                    $key = strtolower($cat);
                    $categories[$key] = $cat;
                    $style['categories'][] = $key;
                }
            }

            $styles[] = $style;
        }

        return [
            'categories' => $categories,
            'styles' => $styles,
            'templates' => $templates,
        ];
    }

    protected function getTemplateLayouts()
    {
        $categories = [];
        $templates = [];
        $styles = [];

        $language = Factory::getLanguage();
        $defaultPreviewPath = '/modules/mod_wt_flex_layout/media/default-preview.jpg';

        $db = Factory::getDbo();
        $query = "SELECT `element`
            FROM `#__extensions`
            WHERE `type` = 'template'
            AND `enabled` = 1
            AND `client_id` = 0";

        $rows = $db->setQuery($query)->loadColumn();

        foreach ($rows as $template) {
            $flexLayoutPath = JPATH_ROOT . '/templates/' . $template . '/flexlayout';

            if (!is_dir($flexLayoutPath)) {
                continue;
            }

            $folders = Folder::folders($flexLayoutPath);

            if (!$folders) {
                continue;
            }

            foreach ($folders as $folder) {
                $xmlFile = $flexLayoutPath . '/' . $folder . '/config.xml';

                if (!is_file($xmlFile)) {
                    continue;
                }

                $xml = simplexml_load_file($xmlFile);

                if (!$xml->title) {
                    continue;
                }

                $layoutPreviewPath = "/templates/$template/flexlayout/$folder/preview.jpg";
                $previewUrl = is_file(JPATH_ROOT . $layoutPreviewPath) ? Uri::root(true) . $layoutPreviewPath : Uri::root(true) . $defaultPreviewPath;
                $previewFile = is_file(JPATH_ROOT . $layoutPreviewPath) ? JPATH_ROOT . $layoutPreviewPath : JPATH_ROOT . $defaultPreviewPath;

                list($width, $height) = getimagesize($previewFile);

                $style = [
                    'title' => (string) $xml->title,
                    'template' => $template,
                    'value' => $template . '|' . $folder,
                    'categories' => [],
                    'preview' => [
                        'url' => $previewUrl,
                        'width' => $width,
                        'height' => $height,
                    ]
                ];

                if ($xml->categories) {
                    foreach ((array) $xml->categories->value as $cat) {
                        $key = strtolower($cat);
                        $categories[$key] = $cat;
                        $style['categories'][] = $key;
                    }
                }

                $styles[] = $style;
            }

            $language->load('tpl_' . $template, JPATH_ROOT);

            $templates[$template] = Text::_(strtoupper($template));
        }

        return [
            'categories' => $categories,
            'styles' => $styles,
            'templates' => $templates,
        ];
    }
}
