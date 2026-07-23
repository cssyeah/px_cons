<?php

namespace Joomla\Plugin\System\Pixel\Field;

use Joomla\Filesystem\Folder;
use Joomla\CMS\Form\Field\ListField;

defined('_JEXEC') or die('Restricted access');

class PixelLayoutField extends ListField
{
    protected $type = 'gklayout';

    protected function getOptions()
    {
        $options = array();
        $data = $this->form->getData();
        $files = [];
        
        $template = $data->get('template');
        $templateLayoutPath = JPATH_ROOT . "/templates/$template/layouts/";
        
        if (is_dir($templateLayoutPath)) {
            $templateLayoutFiles = Folder::files(JPATH_ROOT . "/templates/$template/layouts/", '.php');
            $files = array_merge($files, $templateLayoutFiles);
        }

        $parent = $data->get('parent');
        $parentLayoutPath = JPATH_ROOT . "/templates/$parent/layouts/";

        if ($parent && is_dir($parentLayoutPath)) {
            $parentLayoutFiles = Folder::files(JPATH_ROOT . "/templates/$parent/layouts/", '.php');
            $files = array_merge($files, $parentLayoutFiles);
        }

        sort($files);

        foreach ($files as $file) {
            $info = pathinfo($file);
            $options[] = array(
                'text' => $info['filename'],
                'value' => $info['filename'],
            );
        }

        return $options;
    }
}
