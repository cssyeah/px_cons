<?php

use Joomla\CMS\HTML\HTMLHelper;

defined('_JEXEC') or die('Restricted access');

HTMLHelper::script('plugins/system/pixel/media/vendor/vue/vue.global.min.js');

extract($displayData);
$value = $value ? $value : '{}';
?>
<template id="<?php echo $id ?>-app-tpl">
    <textarea name="<?php echo $name ?>" style="display: none;">{{JSON.stringify(fontData)}}</textarea>
    <div class="filter-board-container board-<?php echo $id ?>" >
        <div class="filter-input-wrapper">
            <div class="font-selector-hint">Type font name in over 1000+ Google fonts:</div>
            <input 
                type="text" 
                placeholder="Search font" 
                v-model="keyword" 
                @focus="filterBoardShow = true"
            />
        </div>
        <ul class="filter-board" style="max-height: 300px; overflow: auto;" v-if="filterBoardShow">
            <li v-for="font in listFonts" :key="font.id">
                <div>
                    <span @click="pickFont(font)">{{font.family}}</span>
                </div>
            </li>
        </ul>
    </div>
    <pre class="text-hint">{{fontVariable}}</pre>
    <div class="picked-font" v-if="fontData.id">
        <div class="active-font">
            <div class="font-name">
                <i class="fas fa-check-circle text-success"></i>
                <span>{{pickedFont.family}}</span>
                <span><button type="button" @click="removeFont" class="btn-remove-font"><i class="fa fa-times"></i> Remove</button></span>
            </div>
            <div class="font-variants" style="display: flex;" :class="`font-variants-${pickedFont.id}`">
                <div v-for="variant in pickedFont.variants" :key="variant">
                    <input 
                        class="cb-variant"
                        type="checkbox" 
                        :id="`${fieldId}-${pickedFont.id}-${variant}`" 
                        :data-id="fieldId"
                        :value="variant" 
                        :checked="pickedFont.selected.indexOf(variant) !== -1"
                        @change="setFontVariant(pickedFont)"
                    >
                    <label :for="`${fieldId}-${pickedFont.id}-${variant}`">{{variant}}</label>
                </div>
            </div>
        </div>
        <div class="font-selector">
            <div class="font-selector-hint">Selectors that use this font. Separated by comma(,):</div>
            <div class="font-input-wrap"><input type="text" v-model="fontData.selectors" /></div>
        </div>
    </div>
</template>
<div id="<?php echo $id ?>-app"></div>
<script>
    (() => {
        const {
            createApp,
            ref,
            watch,
            computed,
        } = Vue;

        function setup() {
            const fontVariable = '<?php echo $variable ?>';
            const fieldId = '<?php echo $id ?>';
            const boardContainerSelector = '<?php echo ".board-$id" ?>';
            const fonts = Joomla.getOptions('googlefonts');
            const keyword = ref('');
            const fontData = ref(<?php echo $value ?>);
            const filterBoardShow = ref(false);

            fontData.value.variable = fontVariable;

            const listFonts = computed(() => {
                const items = fonts.filter(font => {
                    const family = font.family.toLowerCase();
                    const frags = keyword.value.trim().toLowerCase().split(' ').filter(str => str);
                    const matched = frags.every(frag => family.indexOf(frag) !== -1);

                    return !keyword.value || matched;
                });

                return items.splice(0, 20);
            })

            const pickedFont = computed(() => {
                const font = fonts.find(f => f.id === fontData.value.id);

                if (!font) {
                    return {};
                }

                const copy = JSON.parse(JSON.stringify(font));

                copy.selected = fontData.value.selected;

                return copy;
            })

            function pickFont(font) {
                fontData.value = {
                    id: font.id,
                    selected: [],
                    selectors: '',
                    variable: fontVariable,
                }

                keyword.value = '';
                filterBoardShow.value = false;
            }

            function removeFont() {
                fontData.value = {};
            }

            function setFontVariant(data) {
                const selected = [];
                const checkboxSelectors = `.font-variants-${data.id} .cb-variant[data-id="${fieldId}"]`;
                const $checkboxes = document.querySelectorAll(checkboxSelectors);

                for (let i = 0; i < $checkboxes.length; i++) {
                    const $input = $checkboxes[i];

                    if ($input.checked) {
                        selected.push($input.value);
                    }
                }

                fontData.value.selected = selected;
            }

            document.addEventListener('click', event => {
                if (!event.target.closest(boardContainerSelector)) {
                    filterBoardShow.value = false;
                }
            })

            return {
                fontVariable,
                fieldId,
                fonts,
                keyword,
                listFonts,
                filterBoardShow,
                pickedFont,
                pickFont,
                removeFont,
                setFontVariant,
                fontData,
            }
        }

        createApp({
            setup,
            template: '#<?php echo $id ?>-app-tpl',
            name: '<?php echo $fieldname ?>',
        }).mount('#<?php echo $id ?>-app');
    })()
</script>
