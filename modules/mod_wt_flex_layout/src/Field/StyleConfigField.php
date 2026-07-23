<?php

namespace Joomla\Module\WTFlexLayout\Site\Field;

use Joomla\CMS\Factory;
use Joomla\CMS\Form\Form;
use Joomla\CMS\Form\FormField;
use Joomla\CMS\Language\Text;
use Joomla\Registry\Registry;
use SimpleXMLElement;

defined('_JEXEC') or die('Restricted access');

class StyleConfigField extends FormField
{
    protected $type = 'StyleConfig';

    public function renderField($options = [])
    {
        $flexStyle = '';

        $params = new Registry($this->form->getData()->get('params'));
        if ($params) {
            $flexStyle = $params->get('flexstyle', '');
        }

        $input = Factory::getApplication()->input;

        if (!is_null($input->getString('flexstyle'))) {
            $flexStyle = $input->getString('flexstyle');
        }

        if (!$flexStyle) {
            return '<div class="alert alert-success">Please select a layout by clicking the Select button.</div>';
        }

        return $this->renderStyleConfig($flexStyle);
    }

    protected function renderStyleConfig($flexStyle)
    {
        $frags = explode('|', $flexStyle);

        if (count($frags) !== 2) {
            return;
        }

        list($type, $name) = $frags;

        if ($type === 'mod_wt_flex_layout') {
            $xmlConfigFile = JPATH_ROOT . '/modules/mod_wt_flex_layout/flexlayout/' . $name . '/config.xml';
        } else {
            $xmlConfigFile = JPATH_ROOT . '/templates/' . $type . '/flexlayout/' . $name . '/config.xml';
        }

        if (!is_file($xmlConfigFile)) {
            return '<i>config.xml not found</i>';
        }

        $xmlConfig = simplexml_load_file($xmlConfigFile);
        $attribs = $xmlConfig->fields->attributes();

        if ($attribs->name) {
            $attribs->name = 'styleconfig';
        } else {
            $xmlConfig->fields->addAttribute('name', 'styleconfig');
        }

        $fieldsXml = $xmlConfig->fields->asXML();
        $title = (string) $xmlConfig->title;

        $str = '<?xml version="1.0" encoding="utf-8"?>
            <form>
                <title>' . $title . '</title>
                <fields name="jform">
                    <fields name="params">
                        ' . $fieldsXml . '
                    </fields>
                </fields>
            </form>
        ';

        $formXml = new SimpleXMLElement($str);

        $form = new Form('tmp');
        $form->load($formXml);

        $value = [
            'jform' => [
                'params' => [
                    'styleconfig' => $this->value,
                ]
            ]
        ];

        $form->bind($value);

        $fieldsets = $form->getFieldsets();

        $output = '<div class="flexlayout-style-config">';

        foreach ($fieldsets as $fieldset) {
            $output .= '<div class="flexlayout-fieldset-wrapper">';

            $output .= $fieldset->label ? '<div class="flexlayout-fieldset-label">' . Text::_($fieldset->label) . '</div>' : '';

            $output .= '<div class="flexlayout-fieldset-content">';
            $output .= $form->renderFieldset($fieldset->name);
            $output .= '</div>';

            $output .= '</div>';
        }
        $output .= '</div>';

        return $output;
    }
}
