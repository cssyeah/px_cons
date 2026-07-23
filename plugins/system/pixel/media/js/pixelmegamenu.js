/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */

(() => {
  let showTimer = 0;
  const mobileBreakpoint = +Joomla.getOptions('pixel_mobile_menu_breakpoint');

  document.querySelectorAll('.px-menu > .px-nav').forEach($el => {
    initMenu($el);
  })

  if (isTouchDevice() && !isMobileScreen()) {
    document.addEventListener('click', event => {
      const $target = event.target;

      if ($target.classList.contains('px-menu-caret')) {
        return;
      }

      const $level0 = event.target.closest('.px-menu-item.level0');

      hideOtherDropdowns($level0);
    })
  }

  function isMobileScreen() {
    const htmlWidth = document.querySelector('html').clientWidth;

    return mobileBreakpoint > htmlWidth;
  }

  function isTouchDevice() {
    return (('ontouchstart' in window) ||
      (navigator.maxTouchPoints > 0) ||
      (navigator.msMaxTouchPoints > 0));
  }

  function updateMobileMenu($el) {
    const $menu = $el.closest('.px-menu-wrapper');

    if (isMobileScreen()) {
      $menu.classList.add('px-menu-mobile');
    } else {
      $menu.classList.remove('px-menu-mobile');
    }
  }

  function initMenu($el) {
    updateMobileMenu($el);
    window.addEventListener('resize', () => updateMobileMenu($el));

    initMenuToggleButton($el);

    $el.querySelectorAll(':scope > .deeper').forEach($item => {
      intDropdownMainMenu($item);
    })
  }

  function initMenuToggleButton($el) {
    if (!isMobileScreen()) {
      return;
    }

    const $container = $el.parentElement;
    const $btn = document.querySelector('.px-menu-toggle-btn');

    let working = false;

    if (!$btn) {
      return;
    }

    $container.addEventListener('transitionend', () => {
      if (!working) {
        return;
      }

      if ($container.classList.contains('px-dropdown-opened')) {
        $container.classList.remove('px-dropdown-opened');
      } else {
        $container.classList.add('px-dropdown-opened');
      }

      $container.classList.remove('px-dropdown-ready');

      css($container, {
        'height': '',
      });

      working = false;
    })

    $btn.addEventListener('click', () => {
      if (working) {
        return;
      }

      working = true;

      $container.classList.add('px-dropdown-ready');

      const menuHeight = $el.offsetHeight;

      css($container, {
        'height': menuHeight + 'px',
      });

      if ($container.classList.contains('px-dropdown-opened')) {
        setTimeout(() => {
          css($container, {
            'height': '0px',
          });
        });
      }
    })
  }

  function intDropdownMainMenu($el) {
    const $link = $el.querySelector(':scope > a');
    const $dropdown = $el.querySelector(':scope > .px-menu-sub');

    if (isTouchDevice()) {
      $link.addEventListener('click', event => {
        if ($dropdown.classList.contains('px-show')) {
          hideDropdown($dropdown);
          return;
        }

        event.stopPropagation();
        event.preventDefault();

        const $currentMain = $dropdown.closest('.px-menu-item.level0');

        if (!isMobileScreen()) {
          hideOtherDropdowns($currentMain);
        }

        showDropdown($dropdown);
      })
    } else {
      $el.addEventListener('mouseenter', () => {
        showDropdown($dropdown);
      })

      $el.addEventListener('mouseleave', () => {
        hideDropdown($dropdown);
      })
    }

    $el.querySelectorAll('.px-menu-item.deeper').forEach($deeperSubmenu => {
      initDeeperDropdownMenu($deeperSubmenu);
    })
  }

  function hideOtherDropdowns($current) {
    document.querySelectorAll('.px-menu-item.level0').forEach($el => {
      if ($current && $current.isSameNode($el)) {
        return;
      }

      $el.querySelectorAll('.px-ready.px-show').forEach($sub => {
        $sub.classList.remove('px-ready', 'px-show');
      });

      $el.querySelectorAll('.px-parent-active').forEach($item => {
        $item.classList.remove('px-parent-active');
      })
    })
  }

  function initDeeperDropdownMenu($el) {
    const $link = $el.querySelector(':scope > a');
    const $dropdown = $el.querySelector(':scope > .px-menu-sub');

    if (isTouchDevice()) {
      $link.addEventListener('click', event => {
        if ($dropdown.classList.contains('px-show')) {
          hideDropdown($dropdown);
          return;
        }

        event.stopPropagation();
        event.preventDefault();

        if (!isMobileScreen()) {
          hideOtherDeeperDropdowns($el);
        }

        showDeeperDropdown($dropdown);
      })
    } else {
      $el.addEventListener('mouseenter', () => {
        showDeeperDropdown($dropdown);
      })

      $el.addEventListener('mouseleave', () => {
        hideDropdown($dropdown);
      })
    }
  }

  function hideOtherDeeperDropdowns($item) {
    const $parent = $item.parentElement;

    for (let i = 0; i < $parent.children.length; i++) {
      const $child = $parent.children[i];

      if ($item.isSameNode($child)) {
        continue;
      }

      $child.querySelectorAll('.px-ready.px-show').forEach($sub => {
        $sub.classList.remove('px-ready', 'px-show');
      });

      $child.classList.remove('px-parent-active');
    }
  }

  function showDeeperDropdown($dropdown) {
    const htmlWidth = document.querySelector('html').clientWidth;
    const $parent = $dropdown.parentElement;

    $parent.classList.add('px-parent-active');
    $dropdown.classList.add('px-ready');

    css($dropdown, {
      top: '0',
      left: $parent.offsetWidth + 'px',
    });

    const bounding = $dropdown.getBoundingClientRect();
    const maxWindowWidth = htmlWidth - 40;

    if (bounding.right > maxWindowWidth || $dropdown.closest('.px-deeper-right')) {
      css($dropdown, {
        left: '-' + $dropdown.offsetWidth + 'px',
      });

      $dropdown.classList.add('px-deeper-right');
    }

    showTimer = setTimeout(() => {
      $dropdown.classList.add('px-show');
    }, 10);
  }

  function showDropdown($dropdown) {
    const margin = 20;
    const htmlWidth = document.querySelector('html').clientWidth;
    const $parent = $dropdown.parentElement;
    const parentBouding = $parent.getBoundingClientRect();
    const top = $parent.offsetHeight;

    $dropdown.classList.add('px-ready');

    const maxDropdownWidth = htmlWidth - margin * 2;

    if ($dropdown.offsetWidth > maxDropdownWidth) {
      css($dropdown, {
        width: maxDropdownWidth + 'px',
      });
    }

    css($dropdown, {
      top: top + 'px',
    });

    if ($dropdown.classList.contains('px-mega-fluid')) {
      css($dropdown, {
        width: htmlWidth + 'px',
        left: `-${parentBouding.x}px`
      })
    } else {
      if ($dropdown.classList.contains('px-menu-mega-wrapper')) {
        const left = $dropdown.offsetWidth / 2 - $parent.offsetWidth / 2;

        css($dropdown, {
          left: '-' + left + 'px',
        });
      } else {
        css($dropdown, {
          left: 0,
        });
      }

      const bounding = $dropdown.getBoundingClientRect();
      const maxWindowWidth = htmlWidth - margin;

      if (bounding.right > maxWindowWidth) {
        const spacer = bounding.right - maxWindowWidth;
        const targetX = bounding.x - spacer;
        const finalLeft = -(parentBouding.x - targetX);

        css($dropdown, {
          left: finalLeft + 'px',
        });
      } else if (bounding.x < margin) {
        const finalLeft = parentBouding.x > margin
          ? -(parentBouding.x - margin)
          : margin - parentBouding.x;

        css($dropdown, {
          left: finalLeft + 'px',
        });
      }
    }

    showTimer = setTimeout(() => {
      $dropdown.classList.add('px-show');
    }, 10);
  }

  function hideDropdown($dropdown) {
    clearTimeout(showTimer);
    $dropdown.classList.remove('px-ready', 'px-show');
  }

  function css($el, data) {
    for (const key in data) {
      $el.style.setProperty(key, data[key]);
    }
  }
})();

(() => {
  const body = document.querySelector('body');

  if (!body.hasAttribute('data-px-onepage')) {
    return;
  }

  const $menuItems = document.querySelectorAll('.px-menu-item.level0')
  const sections = []

  $menuItems.forEach($item => {
    const href = $item.firstChild.getAttribute('href');

    if (!/^#.+/.test(href)) {
      return;
    }

    if (sections.includes(href)) {
      return;
    }

    if (document.querySelector(href)) {
      sections.push({
        id: href,
        el: document.querySelector(href),
      })
    }
  })

  let timer = 0;

  updateLinkActive()

  window.addEventListener('scroll', updateLinkActive)

  function updateLinkActive() {
    clearTimeout(timer);

    timer = setTimeout(() => {
      let activeSection;

      for (let i = 0; i < sections.length; i++) {
        const sec = sections[i];
        const $el = sec.el;
        const offsetTop = $el.offsetTop;
        const offsetBot = offsetTop + $el.offsetHeight;

        if (window.scrollY >= offsetTop && window.scrollY < offsetBot) {
          activeSection = sec;
          break;
        }
      }

      $menuItems.forEach($item => {
        if (!activeSection) {
          $item.classList.remove('onepage-active')
          return;
        }

        const $link = $item.firstChild;
        const _href = $link.getAttribute('href');

        if (_href === activeSection.id) {
          $item.classList.add('onepage-active')
        } else {
          $item.classList.remove('onepage-active')
        }
      })
    }, 100);
  }
})();