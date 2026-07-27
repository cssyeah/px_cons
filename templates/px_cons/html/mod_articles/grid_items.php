<?php

/**
 * @package     Joomla.Site
 * @subpackage  mod_articles
 *
 * @copyright   (C) 2024 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Layout\LayoutHelper;

if ($params->get('articles_layout') == 1) {
  $gridCols = 'grid-cols-' . $params->get('layout_columns');
}

$currentDate = Factory::getDate()->format('Y-m-d H:i:s');

?>
<div class="articles-slide-wrapper-<?php echo $module->id; ?>">
<ul class="articles-slides articles owl-carousel owl-theme">
  <?php foreach ($items as $item) : ?>
    <?php
    $displayInfo = $item->displayHits || $item->displayAuthorName || $item->displayCategoryTitle || $item->displayDate;
    $canEdit = $item->params->get('access-edit');
    ?>
    <?php if ($params->get('item_title') || $displayInfo || $params->get('show_tags') || $params->get('show_introtext') || $params->get('img_intro_full')  && !empty($item->imageSrc) || $params->get('show_readmore')) : ?>
      <li class="slide slide-item">
        <article class="article-item" itemscope itemtype="https://schema.org/Article">
          <div class="mod-articles-item-content">
            <?php if ($params->get('item_title')) : ?>
              <?php $item_heading = $params->get('item_heading', 'h4'); ?>
              <<?php echo $item_heading; ?> class="mod-articles-title" itemprop="name">
                <?php if ($params->get('link_titles') == 1) : ?>
                  <?php $attributes = ['class' => 'mod-articles-link ' . $item->active, 'itemprop' => 'url']; ?>
                  <?php $link = htmlspecialchars($item->link, ENT_COMPAT, 'UTF-8', false); ?>
                  <?php $title = htmlspecialchars($item->title, ENT_COMPAT, 'UTF-8', false); ?>
                  <?php echo HTMLHelper::_('link', $link, $title, $attributes); ?>
                <?php else : ?>
                  <?php echo htmlspecialchars($item->title, ENT_QUOTES, 'UTF-8'); ?>
                <?php endif; ?>
              </<?php echo $item_heading; ?>>
            <?php endif; ?>

            <?php if ($item->state === 0) : ?>
              <span class="badge bg-warning"><?php echo Text::_('JUNPUBLISHED'); ?></span>
            <?php endif; ?>

            <?php if ($item->publish_up > $currentDate) : ?>
              <span class="badge bg-warning"><?php echo Text::_('JNOTPUBLISHEDYET'); ?></span>
            <?php endif; ?>

            <?php if ($item->publish_down !== null && $item->publish_down < $currentDate) : ?>
              <span class="badge bg-warning"><?php echo Text::_('JEXPIRED'); ?></span>
            <?php endif; ?>

            <?php echo $item->event->afterDisplayTitle; ?>

            <?php if ($displayInfo) : ?>
              <?php $listClass = ($params->get('info_layout') == 1) ? 'list-inline' : 'list-unstyled'; ?>
              <ul class="<?php echo $listClass; ?>">
                <li class="article-info-term">
                  <span class="visually-hidden">
                    <?php echo Text::_('MOD_ARTICLES_INFO'); ?>
                  </span>
                </li>

                <?php if ($item->displayAuthorName) : ?>
                  <li class="mod-articles-writtenby <?php echo ($params->get('info_layout') == 1 ? 'list-inline-item' : ''); ?>">
                    <?php echo htmlspecialchars($item->displayAuthorName, ENT_QUOTES, 'UTF-8'); ?>
                  </li>
                <?php endif; ?>

                <?php if ($item->displayCategoryTitle) : ?>
                  <li class="mod-articles-category <?php echo ($params->get('info_layout') == 1 ? 'list-inline-item' : ''); ?>">
                    <?php if ($item->displayCategoryLink) : ?>
                      <a href="<?php echo $item->displayCategoryLink; ?>">
                        <?php echo htmlspecialchars($item->displayCategoryTitle, ENT_QUOTES, 'UTF-8'); ?>
                      </a>
                    <?php else : ?>
                      <?php echo htmlspecialchars($item->displayCategoryTitle, ENT_QUOTES, 'UTF-8'); ?>
                    <?php endif; ?>
                  </li>
                <?php endif; ?>

                <?php if ($item->displayDate) : ?>
                  <li class="mod-articles-date <?php echo ($params->get('info_layout') == 1 ? 'list-inline-item' : ''); ?>">
                    <?php echo htmlspecialchars($item->displayDate, ENT_QUOTES, 'UTF-8'); ?>
                  </li>
                <?php endif; ?>

                <?php if ($item->displayHits) : ?>
                  <li class="mod-articles-hits <?php echo ($params->get('info_layout') == 1 ? 'list-inline-item' : ''); ?>">
                    <?php echo $item->displayHits; ?>
                  </li>
                <?php endif; ?>
              </ul>
            <?php endif; ?>

            <?php if (in_array($params->get('img_intro_full'), ['intro', 'full']) && !empty($item->imageSrc)) : ?>
              <?php echo LayoutHelper::render('joomla.content.' . $params->get('img_intro_full') . '_image', $item); ?>
            <?php endif; ?>

            <?php if ($params->get('show_tags', 0) && $item->tags->itemTags) : ?>
              <div class="mod-articles-tags">
                <?php echo LayoutHelper::render('joomla.content.tags', $item->tags->itemTags); ?>
              </div>
            <?php endif; ?>

            <?php echo $item->event->beforeDisplayContent; ?>

            <?php if ($params->get('show_introtext', 1)) : ?>
              <?php echo $item->displayIntrotext; ?>
            <?php endif; ?>

            <?php echo $item->event->afterDisplayContent; ?>

            <?php if ($params->get('show_readmore') && !empty($item->fulltext)) : ?>
              <?php if ($params->get('show_readmore_title', '') !== '') : ?>
                <?php $item->params->set('show_readmore_title', $params->get('show_readmore_title')); ?>
                <?php $item->params->set('readmore_limit', $params->get('readmore_limit')); ?>
              <?php endif; ?>
              <?php echo LayoutHelper::render('joomla.content.readmore', ['item' => $item, 'params' => $item->params, 'link' => $item->link]); ?>
            <?php endif; ?>
          </div>
        </article>
      </li>
    <?php endif; ?>
  <?php endforeach; ?>
</ul>
</div>

<script>
  (function($){
    jQuery(document).ready(function($) {
      var owlArticleSlide<?php echo $module->id; ?> = $(".articles-slide-wrapper-<?php echo $module->id; ?> .owl-carousel");
      owlArticleSlide<?php echo $module->id; ?>.owlCarousel({
        addClassActive: true,
        margin: 32,
        stagePadding: 200,
        items: 3,
        loop: true,
        nav : 0,
        dotsSpeed: 400,
        slideTransition: 'linear',
        autoplaySpeed: 6000,
        dots: 1,
        autoplay: 0,
        animateIn: 'fadeIn',
        animateOut: 'fadeOut',
        autoplayTimeout: 5000,
        smartSpeed: 1200,
        mouseDrag: false,
        navText: [
        '<i class="fa-solid fa-chevron-left"></i>', // HTML for the previous button
        '<i class="fa-solid fa-chevron-right"></i>'  // HTML for the next button
        ]
      });
      
      // Go to the next item
      $('.fl-owl-next').click(function() {
        owlArticleSlide<?php echo $module->id; ?>.trigger('next.owl.carousel');
      })
      
      // Go to the previous item
      $('.fl-owl-prev').click(function() {
        owlArticleSlide<?php echo $module->id; ?>.trigger('prev.owl.carousel');
      })
    });

  })(jQuery);
</script>