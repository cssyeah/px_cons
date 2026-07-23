/**
 * @package     Pixel Framework
 *
 * @copyright   (C) 2023 Pixel Framework. <https://www.pixel.com>
 * @license     GNU General Public License version 2 or later;
 */

import Cookie from '../vendor/js-cookie/js-cookie-esm.js';

(() => {
    const cookieKey = Joomla.getOptions('pixel_preset_cookie_key') || '';
    const gkCookieKey = 'pixel_active_preset_' + cookieKey;

    function updateUI(preset) {
        const $body = document.querySelector('body');

        $body.setAttribute('data-px-theme', preset);

        updatePresetToggleUI(preset);
        updatePresetDropdownUI(preset);
    }

    document.querySelectorAll('.px-preset-toggle').forEach($el => {
        initPresetToggle($el);
    })

    function initPresetToggle($el) {
        const list = $el.getAttribute('data-list');
        const [a, b] = list.split(',');
        const $toggleBtn = $el.querySelector('.preset-toggle-btn');

        $toggleBtn.addEventListener('click', () => {
            const active = $el.getAttribute('data-active-preset');
            const newActive = active === a ? b : a;

            updateUI(newActive);

            const options = {
                expires: 30,
                path: Joomla.getOptions('system.paths').root + '/',
            };
            Cookie.set(gkCookieKey, newActive, options);
        })
    }

    function updatePresetToggleUI(preset) {
        document.querySelectorAll('.px-preset-toggle').forEach($el => {
            $el.setAttribute('data-active-preset', preset);

            $el.querySelectorAll('.preset-item').forEach($i => {
                $i.classList.remove('active-preset');
            })

            const $activeItem = $el.querySelector(`.preset-item[data-preset="${preset}"]`);

            $activeItem && $activeItem.classList.add('active-preset')
        })
    }

    document.querySelectorAll('.px-preset-dropdown').forEach($el => {
        initPresetDropdown($el)
    })

    function initPresetDropdown($el) {
        $el.querySelectorAll('.preset-item').forEach($item => {
            $item.addEventListener('click', () => {
                const newActive = $item.getAttribute('data-preset');

                updateUI(newActive);

                const options = {
                    expires: 30,
                    path: Joomla.getOptions('system.paths').root + '/',
                };
                Cookie.set(gkCookieKey, newActive, options);
            })
        })
    }

    function updatePresetDropdownUI(preset) {
        document.querySelectorAll('.px-preset-dropdown').forEach($el => {
            $el.setAttribute('data-active-preset', preset);

            $el.querySelectorAll('.preset-item').forEach($item => {
                $item.classList.remove('active-preset')
            })

            const $btnText = $el.querySelector('.dropdown-toggle > .preset-item-text');
            $btnText.innerText = Joomla.JText._('PIXEL_PRESET_TEXT_' + preset.toUpperCase());

            const $btnIcon = $el.querySelector('.dropdown-toggle > .preset-item-icon');
            $btnIcon.setAttribute('data-preset', preset);


            const $activeItem = $el.querySelector(`.preset-item[data-preset="${preset}"]`)

            $activeItem && $activeItem.classList.add('active-preset');
        })
    }

})()