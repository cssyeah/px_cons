<?php

namespace Joomla\Plugin\System\Pixel\Helper;

use Joomla\CMS\Factory;
use Joomla\Filesystem\File;
use Joomla\CMS\Uri\Uri;
use MatthiasMullie\Minify;

class PixelOptimizeHelper
{
    public static function css($buffer = '', $excluded = [])
    {
        preg_match_all('/<link.*?href="(.*?)".*?rel="stylesheet".*?>/', $buffer, $matches);

        foreach ($matches[1] as $key => $value) {
            if (!self::isInternalFile($value)) {
                continue;
            }

            if (self::isExcluded($value, $excluded)) {
                continue;
            }

            $cacheFile = JPATH_CACHE . '/pixel_asset_cache/css/' . md5($value) . '.css';
            $info = parse_url($value);
            $path = $info['path'];
            $cleanPath = self::cleanPath($path);
            $sourceFile = JPATH_ROOT . '/' . $cleanPath;

            if (!is_file($sourceFile) || pathinfo($cleanPath)['extension'] !== 'css') {
                continue;
            }

            $sourceTime = filemtime($sourceFile);

            $css = '';

            if (is_file($cacheFile) && filemtime($cacheFile) > $sourceTime) {
                $css = file_get_contents($cacheFile);
            } else {
                $source = file_get_contents($sourceFile);
                if (preg_match('/@import/', $source)) {
                    continue;
                }

                preg_match_all('/url\((.*?)\)/', $source, $urlMatches);

                foreach ($urlMatches[1] as $_k => $url) {
                    $sourceFolder = pathinfo($cleanPath)['dirname'];
                    $url = self::cleanCssUrl($url, $sourceFolder);
                    $url = "url($url)";

                    $source = str_replace($urlMatches[0][$_k], $url, $source);
                }

                require_once JPATH_ROOT . '/plugins/system/pixel/lib/vendor/autoload.php';

                $minifier = new Minify\CSS;
                $minifier->add($source);
                $css = $minifier->minify();

                File::write($cacheFile, $css);
            }

            $doc = Factory::getDocument();
            $tab = $doc->_getTab();
            $lineEnd = $doc->_getLineEnd();
            $style = "<!--$value-->$lineEnd$tab<style>$css</style>";
            $buffer = str_replace($matches[0][$key], $style, $buffer);
        }

        return $buffer;
    }

    public static function js($buffer = '', $excluded = [])
    {
        preg_match_all('/<script.*?src="(.*?)".*?><\/script>/', $buffer, $matches);

        foreach ($matches[1] as $key => $value) {
            if (!self::isInternalFile($value)) {
                continue;
            }

            if (self::isExcluded($value, $excluded)) {
                continue;
            }

            $scriptTag = $matches[0][$key];
            if (preg_match('/ (async|defer|type="module")/', $scriptTag)) {
                continue;
            }

            $cacheFile = JPATH_CACHE . '/pixel_asset_cache/js/' . md5($value) . '.js';
            $info = parse_url($value);
            $path = $info['path'];
            $cleanPath = self::cleanPath($path);
            $sourceFile = JPATH_ROOT . '/' . $cleanPath;

            if (!is_file($sourceFile) || pathinfo($cleanPath)['extension'] !== 'js') {
                continue;
            }

            $sourceTime = filemtime($sourceFile);
            $js = '';

            if (is_file($cacheFile) && filemtime($cacheFile) > $sourceTime) {
                $js = file_get_contents($cacheFile);
            } else {
                require_once JPATH_ROOT . '/plugins/system/pixel/lib/vendor/autoload.php';

                $minifier = new Minify\JS;
                $minifier->add($sourceFile);
                $js = $minifier->minify();

                File::write($cacheFile, $js);
            }

            $doc = Factory::getDocument();
            $tab = $doc->_getTab();
            $lineEnd = $doc->_getLineEnd();
            $script = "<!--$value-->$lineEnd$tab<script>$js</script>";
            $buffer = str_replace($matches[0][$key], $script, $buffer);
        }

        return $buffer;
    }

    protected static function cleanPath($path)
    {
        $rootUrl = Uri::root(true);
        $length = strlen($rootUrl) + 1;

        return substr($path, $length);
    }

    protected static function cleanCssUrl($url, $folder)
    {
        $url = trim($url);
        $url = trim($url, "\'\"");

        if (preg_match('/^\/[a-zA-Z_\.\-0-9]/', $url)) {
            return $url;
        }

        if (preg_match('/^(http|https):\/\//', $url)) {
            return $url;
        }

        $uri = Uri::getInstance($url);
        $uriPath = $uri->getPath();

        if (preg_match('/^\.\.\//', $uriPath) || preg_match('/^[a-zA-Z_\.\-0-9]/', $uriPath)) {
            $path = JPATH_ROOT . '/' . $folder . '/' . $uriPath;
            $realPath = realpath($path);

            if ($realPath && is_file($realPath)) {
                $newUrl = str_replace(JPATH_ROOT, '', $realPath);
                $newUrl = str_replace('\\', '/', $newUrl);

                return Uri::root(true) . $newUrl;
            }
        }

        return $url;
    }

    protected static function isExcluded($str, $excluded)
    {
        foreach ($excluded as $value) {
            if (strpos($str, $value) !== false) {
                return true;
            }
        }

        return false;
    }

    protected static function isInternalFile($key)
    {
        if (preg_match('/^\/[a-zA-Z_\-0-9]/', $key)) {
            return true;
        }

        if (preg_match('/^(http|https):\/\//', $key) && Uri::isInternal($key)) {
            return true;
        }

        return false;
    }
}
