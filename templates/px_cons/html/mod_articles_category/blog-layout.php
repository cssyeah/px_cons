<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_articles_category
 *
 * @copyright   Copyright (C) 2005 - 2021 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Layout\LayoutHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

$moduleclass_sfx = $params->get('moduleclass_sfx','');
?>

<div class="blog-list<?php echo $moduleclass_sfx; ?> row row-cols-1 row-cols-3">
	<?php if ($grouped) : ?>

	<?php else : ?>
		<?php foreach ($list as $item) : ?>
			<div class="blog-item col-12 col-md-6 col-lg-4">
				<!-- Item image -->
				<?php  
					$images  = json_decode($item->images);

					if (empty($images->image_intro)) {
					    return;
					}

					$imgclass   = empty($images->float_intro) ? $params->get('float_intro') : $images->float_intro;

					$layoutAttr = [
					    'src' => $images->image_intro,
					    'alt' => empty($images->image_intro_alt) && empty($images->image_intro_alt_empty) ? false : $images->image_intro_alt,
					];
				if ($images): ?>
				<a class="item-image" href="<?php echo $item->link; ?>" title="<?php echo $item->title; ?>">
					<?php echo LayoutHelper::render('joomla.html.image', array_merge($layoutAttr, ['itemprop' => 'thumbnailUrl'])); ?>
				</a>
				<?php endif; ?>
				<!-- // Item image -->

				<?php if ($params->get('link_titles') == 1) : ?>
					<h3 class="item-title"><a href="<?php echo $item->link; ?>"><?php echo $item->title; ?></a></h3>
				<?php else : ?>
					<h3><?php echo $item->title; ?></h3>
				<?php endif; ?>

				<div class="item-meta">
					<?php if ($params->get('show_author')) : ?>
		        <span class="item-writtenby">
		          <?php echo $item->displayAuthorName; ?>
		        </span>
			    <?php endif; ?>

					<?php if ($item->displayDate) : ?>
						<span class="item-date">
							<?php echo $item->displayDate; ?>
						</span>
					<?php endif; ?>

					<?php if ($item->displayCategoryTitle) : ?>
					<span class="item-cat">
						<?php echo $item->displayCategoryTitle; ?>
					</span>
					<?php endif; ?>

					<?php if ($item->displayHits) : ?>
		        <span class="mod-articles-category-hits">
		          <?php echo Text::_('PIXEL_HITS'); ?><?php echo $item->displayHits; ?>
		        </span>
			    <?php endif; ?>
				</div>

				<?php if ($params->get('show_tags', 0) && $item->tags->itemTags) : ?>
        <div class="mod-articles-category-tags">
          <?php echo LayoutHelper::render('joomla.content.tags', $item->tags->itemTags); ?>
        </div>
		    <?php endif; ?>

				<?php if ($params->get('show_introtext')) : ?>
					<p class="item-introtext">
						<?php echo $item->displayIntrotext; ?>
					</p>
				<?php endif; ?>

				<?php if ($params->get('show_readmore')) : ?>
					<p class="item-readmore">
						<a class="btn btn-primary <?php echo $item->active; ?>" href="<?php echo $item->link; ?>">
							<?php if ($item->params->get('access-view') == false) : ?>
								<?php echo Text::_('MOD_ARTICLES_CATEGORY_REGISTER_TO_READ_MORE'); ?>
							<?php elseif ($readmore = $item->alternative_readmore) : ?>
								<?php echo $readmore; ?>
								<?php echo HTMLHelper::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
							<?php elseif ($params->get('show_readmore_title', 0) == 0) : ?>
								<?php echo Text::sprintf('MOD_ARTICLES_CATEGORY_READ_MORE_TITLE'); ?>
							<?php else : ?>
								<?php echo Text::_('MOD_ARTICLES_CATEGORY_READ_MORE'); ?>
								<?php echo HTMLHelper::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
							<?php endif; ?>
						</a>
					</p>
				<?php endif; ?>
			</div>
		<?php endforeach; ?>
	<?php endif; ?>
</div>