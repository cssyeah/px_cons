<?php

namespace Joomla\Plugin\System\Pixel;

use Exception;
use Joomla\CMS\Factory;
use Joomla\Filesystem\Path;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Layout\FileLayout;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\Plugin\System\Pixel\Helper\PixelGoogleFontHelper;
use Joomla\Plugin\System\Jadev\Helper\ScssHelper;
use Joomla\Registry\Registry;

defined('_JEXEC') or die('Restricted access');

class PixelTemplate
{
    protected static $xml;

    public static function getTemplateXml()
    {
        if (self::$xml) {
            return self::$xml;
        }

        $template = Factory::getApplication()->getTemplate();
        self::$xml = simplexml_load_file(JPATH_ROOT . "/templates/$template/templateDetails.xml");

        return self::$xml;
    }

    public static function getLayoutPath($name)
    {
        $paths = [];

        $template = Factory::getApplication()->getTemplate();
        $paths[] = JPATH_ROOT . "/templates/$template/layouts/";

        $xml = self::getTemplateXml();
        $parent = (string) $xml->parent;

        if ($parent) {
            $paths[] = JPATH_ROOT . "/templates/$parent/layouts/";
        }

        $file = Path::find($paths, $name . '.php');

        return $file;
    }

    public static function render()
    {
        if (!defined('PIXELTEMPLATE')) {
            throw new Exception("Pixel Framework is not enabled.", 500);
        }

        $doc = Factory::getDocument();
        $params = $doc->params;
        $layout = $params->get('template_layout', 'default');
        $layoutFile = self::getLayoutPath($layout);

        if (!file_exists($layoutFile)) {
            throw new Exception("Pixel: Layout \"$layout\" not found", 500);
        }

        $output = static::renderTemplateLayout($layoutFile);

        static::addCss('css/template.css');
        static::addScript('js/template.js', [], ['defer' => true]);

        $info = pathinfo($layoutFile);
        static::addCss('css/' . $info['filename'] . '.css');
        static::addScript('js/' . $info['filename'] . '.js', [], ['defer' => true]);

        static::addCss('css/custom.css');
        static::addScript('js/custom.js', [], ['defer' => true]);

        PixelGoogleFontHelper::initFont();

        echo $output;
    }

    protected static function renderTemplateLayout(string $file)
    {
        ob_start();
        require $file;
        $content = ob_get_clean();

        return $content;
    }

    protected static function findMediaUrl($name)
    {
        $paths = [];

        $template = Factory::getApplication()->getTemplate();
        $paths[] = JPATH_ROOT . "/templates/$template/media/";

        $xml = self::getTemplateXml();
        $parent = (string) $xml->parent;

        if ($parent) {
            $paths[] = JPATH_ROOT . "/templates/$parent/media/";
        }

        $file = Path::find($paths, $name);
        $relativePath = str_replace(JPATH_ROOT, '', $file);
        $relativeUrl = trim(str_replace('\\', '/', $relativePath), '/');

        return [
            'url' => $relativeUrl,
            'version' => $file ? md5(filemtime($file)) : '',
        ];
    }

    public static function addCss($cssFile)
    {
        $input = Factory::getApplication()->input;
        $isPreview = $input->get('gkpreview');
        $onDevMode = PluginHelper::isEnabled('system', 'jadev');

        if ($onDevMode && !$isPreview) {
            $found = ScssHelper::findScssSource('pixel', $cssFile);

            if ($found) {
                HTMLHelper::stylesheet($found['url'], ['version' => time()], $found['attribs']);

                return;
            }
        }

        $result = self::findMediaUrl($cssFile);

        HTMLHelper::stylesheet($result['url'], ['version' => $result['version']]);
    }

    public static function addScript($file = '', $options = [], $attribs = [])
    {
        $result = self::findMediaUrl($file);
        $options['version'] = $result['version'];

        HTMLHelper::script($result['url'], $options, $attribs);
    }

    public static function renderBlock($name)
    {
        $file = self::getLayoutPath("blocks/$name");

        if (!is_file($file)) {
            return '';
        }

        $data = self::renderTemplateLayout($file);

        return $data;
    }


    public static function renderLayout($name = '', $data = [])
    {
        $layout = new FileLayout($name);
        $path = JPATH_PLUGINS . '/system/pixel/layouts/';
        $includePaths = $layout->getIncludePaths();
        $includePaths[] = $path;
        $layout->setIncludePaths($includePaths);

        return $layout->render($data);
    }

    public static function getSublayout()
    {
        $app = Factory::getApplication();
        $menu = $app->getMenu()->getActive();

        if (!$menu) {
            return '';
        }

        $input = $app->input;
        $option = $input->get('option', '');
        $menuOption = $menu->query['option'] ?? '';

        if ($menuOption !== $option) {
            return '';
        }

        $supportedViews = ['com_content_category_article', 'com_content_categories_article'];
        $view = $input->get('view', '');
        $menuView = $menu->query['view'] ?? '';
        $layoutKey = $menuOption . '_' . $menuView . '_' . $view;

        if (!in_array($layoutKey, $supportedViews)) {
            return '';
        }

        $params = Factory::getDocument()->params;
        $sublayoutConfig = new Registry($params->get('sublayout'));

        foreach ($sublayoutConfig as $item) {
            if ($item->id === $menu->id) {
                return $item->layout;
            }
        }

        return '';
    }

    public static function renderSublayout($name)
    {
        $file = self::getLayoutPath("sublayouts/$name");

        if (!is_file($file)) {
            return '';
        }

        $data = self::renderTemplateLayout($file);

        return $data;
    }

    public static function isPixelTemplate()
    {
        $app = Factory::getApplication();

        if ($app->isClient('site')) {
            $template = $app->getTemplate();
            if (!$template) {
                return;
            }

            $xml = self::getTemplateXml();

            return (string) $xml->pixel;
        }

        return;
    }
}
