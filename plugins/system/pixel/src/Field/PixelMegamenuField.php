<?php

namespace Joomla\Plugin\System\Pixel\Field;

use Joomla\CMS\Form\FormField;
use Joomla\Plugin\System\Pixel\PixelTemplate;

defined('_JEXEC') or die('Restricted access');

class PixelMegamenuField extends FormField
{
    protected $type = 'pixelmegamenu';

    public function renderField($options = [])
    {
        return PixelTemplate::renderLayout('pixel/fields/pixelmegamenu', [
            'name' => $this->name,
            'value' => $this->value,
            'fieldname' => $this->fieldname,
        ]);
    }
}
