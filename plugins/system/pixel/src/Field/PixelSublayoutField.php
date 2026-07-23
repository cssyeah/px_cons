<?php

namespace Joomla\Plugin\System\Pixel\Field;

use Joomla\CMS\Factory;
use Joomla\Filesystem\Folder;
use Joomla\CMS\Form\FormField;
use Joomla\CMS\Uri\Uri;
use Joomla\Database\ParameterType;
use Joomla\Plugin\System\Pixel\PixelTemplate;
use Joomla\Plugin\System\Pixel\Helper\PixelMenuHelper;

defined('_JEXEC') or die('Restricted access');

class PixelSublayoutField extends FormField
{
    protected $type = 'PixelSublayout';

    public function getInput()
    {
        return PixelTemplate::renderLayout('pixel/fields/pixelsublayout', [
            'name' => $this->name,
            'value' => $this->value,
            'id' => $this->id,
            'fieldname' => $this->fieldname,
            'menuItemGroups' => $this->getMenuItemGroups(),
            'layouts' => $this->getSublayouts(),
        ]);
    }

    protected function getMenuItemGroups()
    {
        $groups = [];

        $menuTypes = $this->getMenuTypes();

        foreach ($menuTypes as $type) {
            $skip = true;
            $menu = [];
            $menuItems = PixelMenuHelper::getMenuItems($type->menutype, 0, 1, 1000);

            foreach ($menuItems['items'] as $item) {
                $uri = Uri::getInstance($item->link);
                $supportedViews = ['com_content_category', 'com_content_categories'];
                $uriKey = $uri->getVar('option') . '_' . $uri->getVar('view');
                $isSupported = in_array($uriKey, $supportedViews);

                $menu[] = [
                    'id' => +$item->id,
                    'title' => str_repeat('- ', $item->level - 1) . $item->title,
                    'disabled' => !$isSupported,
                ];

                if ($isSupported) {
                    $skip = false;
                }
            }

            if (!$skip) {
                $groups["{$type->title} [{$type->menutype}]"] = $menu;
            }
        }

        return $groups;
    }

    protected function getMenuTypes($clientId = 0)
    {
        $db    = Factory::getDbo();
        $query = $db->getQuery(true)
            ->select($db->quoteName(['a.menutype', 'a.title']))
            ->from($db->quoteName('#__menu_types', 'a'));

        if (isset($clientId)) {
            $clientId = (int) $clientId;
            $query->where($db->quoteName('a.client_id') . ' = :clientId')
                ->bind(':clientId', $clientId, ParameterType::INTEGER);
        }

        $db->setQuery($query);

        return $db->loadObjectList();
    }

    protected function getSublayouts()
    {
        $layouts = [];
        $data = $this->form->getData();
        $template = $data->get('template');
        $templatePath = JPATH_ROOT . "/templates/$template/layouts/sublayouts/";

        if (is_dir($templatePath)) {
            $files = Folder::files($templatePath, '.php');
            $layouts = array_merge($layouts, $files);
        }

        $parent = $data->get('parent');
        $parentPath = JPATH_ROOT . "/templates/$parent/layouts/sublayouts/";

        if ($parent && is_dir($parentPath)) {
            $parentLayoutFiles = Folder::files($parentPath, '.php');
            $layouts = array_merge($layouts, $parentLayoutFiles);
        }

        sort($layouts);

        return array_map(function ($file) {
            $info = pathinfo($file);

            return $info['filename'];
        }, $layouts);
    }
}
