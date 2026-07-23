<?php

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

defined('_JEXEC') or die('Restricted access');

HTMLHelper::script('plugins/system/pixel/media/vendor/vue/vue.global.min.js');

extract($displayData);

$language = [];

foreach ($baseGroups as $key => $group) {
    $language[$key] = Text::_($key);
}

foreach ($basePresets as $preset) {
    foreach ($preset['variables'] as $key => $_value) {
        $language[$key] = Text::_('PIXEL_COLOR' . strtoupper($key));
    }
}
?>
<template id="<?php echo $id ?>-app-tpl">
    <textarea style="display: none;" name="<?php echo $name ?>">{{JSON.stringify(data)}}</textarea>
    <div class="color-preset-head">
        <small>Use to force reset cookie of color preset</small>
        <button type="button" @click="resetCookieKey">Reset Cookie Key</button>
    </div>
    <div class="color-preset-wrap">
        <div class="preset-list-sidebar">
            <div 
                class="preset-item"
                v-for="preset in presetList" 
                :class="{'active-preset': preset.name === activePreset, 'default-preset': preset.name === defaultPreset}" 
                :key="preset.name"
            >
                <div class="preset-name" @click="setActivePreset(preset.name)">
                    <h3>{{preset.name}}</h3>
                    <div v-if="baseKeys.indexOf(preset.name) !== -1"><i class="fa fa-lock"></i></i></div>
                </div>
                <div class="preset-set-default">
                    <input 
                        type="radio" 
                        :id="`preset-default-${preset.name}`" 
                        :value="preset.name"
                        :checked = "preset.name === defaultPreset"
                        @change="setDefaultPreset(preset.name)"
                    >
                    <label :for="`preset-default-${preset.name}`">Default</label>
                </div>
                <div class="preset-actions">
                    <button type="button" @click="clonePreset(preset)" class="btn btn-primary"><i class="fa fa-copy"></i><?php echo Text::_('PIXEL_TPL_COPY'); ?></button>
                    <button 
                        type="button" 
                        :disabled="baseKeys.indexOf(preset.name) !== -1 || preset.name === defaultPreset"
                        @click="deletePreset(preset)" class="btn btn-danger"
                    ><i class="fa fa-trash"></i><?php echo Text::_('PIXEL_TPL_DELETE'); ?></button>
                </div>
            </div>
            <div v-if="!showNewPresetNameInput">
                <button type="button" @click="toggleNameInput(true)" class="btn btn-success"><i class="fas fa-palette"></i><?php echo Text::_('PIXEL_TPL_ADD_NEW'); ?></button>
            </div>
            <div v-if="showNewPresetNameInput" class="preset-item preset-add-new">
                <input class="new-preset-name-input" type="text" v-model="newPresetName">
                <div class="preset-actions">
                    <button type="button" @click="saveNewPreset" class="btn btn-success"><i class="fas fa-save"></i><?php echo Text::_('PIXEL_TPL_SAVE'); ?></button>
                    <button type="button" @click="toggleNameInput(false)" class="btn btn-danger"><i class="fas fa-times"></i><?php echo Text::_('PIXEL_TPL_CANCEL'); ?></button>
                </div>
            </div>
        </div>
        <div class="preset-details">
            <template v-for="preset in presetList" :key="preset.name">
                <template v-if="preset.name === activePreset">
                    <div class="preset-head">
                        <h3>
                            <span class="preset-name">
                                <span v-if="!showEditNameInput">{{preset.name}}</span>
                                <button type="button" v-if="!showEditNameInput" @click="toggleEditNameInput(true)" :disabled="baseKeys.indexOf(preset.name) !== -1" class="btn btn-secondary"><i class="fas fa-pen"></i><?php echo Text::_('PIXEL_TPL_EDIT'); ?></button>
                            </span>
                            <span class="preset-edit">
                                <input class="temp-preset-name-input" type="text" v-if="showEditNameInput" v-model="tempPresetName">
                                <button type="button" v-if="showEditNameInput" @click="saveEditPresetName(preset)"><?php echo Text::_('PIXEL_TPL_SAVE'); ?></button>
                                <button type="button" v-if="showEditNameInput" @click="toggleEditNameInput(false)"><?php echo Text::_('PIXEL_TPL_CANCEL'); ?></button>
                            </span>
                        </h3>
                        <button type="button" @click="resetPreset(preset)" class="btn btn-reset"><i class="fas fa-history"></i><?php echo Text::_('PIXEL_TPL_RESET_COLORS'); ?></button>
                    </div>
                    <div class="color-wrap">
                        <div v-for="(group, gKey) in variableGroups" :key="gKey">
                            <div class="px-spacer"><span>{{getLanguage(gKey)}}</span></div>
                            <div v-for="(varValue, varKey) in group" :key="varKey">
                                <div class="color-label">{{getLanguage(varKey)}}</div>
                                <div class="color-value">
                                    <span><input type="color" :value="varValue" @change="event => setColor(preset.name, varKey, event.target.value)"></span>
                                    <input type="text" :value="varValue" @change="event => setColor(preset.name, varKey, event.target.value)">
                                </div>
                                <pre class="color-var">{{varKey}}</pre>
                            </div>
                        </div>
                    </div>
                </template>
            </template>
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
            nextTick,
        } = Vue;

        function setup() {
            const sessionAtivePresetKey = location.pathname + location.search + '-px-color-active-preset'
            const sessionActivePreset = sessionStorage.getItem(sessionAtivePresetKey);
            const newPresetName = ref('');
            const showNewPresetNameInput = ref(false);
            const showEditNameInput = ref(false);
            const language = <?php echo json_encode($language) ?>;
            const baseGroups = <?php echo json_encode($baseGroups) ?>;
            const basePresets = <?php echo json_encode($basePresets) ?>;
            const baseKeys = basePresets.map(p => p.name);
            const firstBasePreset = basePresets[0];
            const firstBaseKey = firstBasePreset.name;
            const data = ref(<?php echo json_encode($value) ?>);

            syncBasePresets();

            if (!data.value.default) {
                setDefaultPreset(firstBaseKey);
            }

            if (!data.value.cookieKey) {
                data.value.cookieKey = getCookieKey();
            }

            const presetList = computed(() => {
                return data.value.presets;
            })

            const presetKeys = computed(() => {
                return data.value.presets.map(p => p.name);
            })

            const activePreset = ref(presetKeys.value.indexOf(sessionActivePreset) !== -1 ? sessionActivePreset : firstBaseKey);

            const defaultPreset = computed(() => {
                return data.value.default;
            })

            const variableGroups = computed(() => {
                const preset = presetList.value.find(p => p.name === activePreset.value);
                const groups = JSON.parse(JSON.stringify(baseGroups));

                for (const key in groups) {
                    const group = groups[key];

                    for (const varKey in group) {
                        group[varKey] = preset.variables[varKey];
                    }
                }

                return groups;
            })

            function getCookieKey() {
                const array = new Uint32Array(1);
                window.crypto.getRandomValues(array);

                for (const num of array) {
                    return String(num);
                }
            }

            function syncBasePresets() {
                const presets = data.value.presets;
                const list = [];

                basePresets.forEach(preset => {
                    const saved = presets.find(p => p.name === preset.name) || {};
                    const variables = {
                        ...preset.variables,
                        ...saved.variables,
                    };

                    list.push({
                        name: preset.name,
                        variables,
                    })
                })

                presets.forEach(preset => {
                    if (baseKeys.indexOf(preset.name) !== -1) {
                        return;
                    }

                    list.push({
                        name: preset.name,
                        variables: {
                            ...firstBasePreset.variables,
                            ...preset.variables,
                        },
                    })
                })

                data.value.presets = list;
            }

            function setActivePreset(key) {
                activePreset.value = key;
                showEditNameInput.value = false;

                sessionStorage.setItem(sessionAtivePresetKey, key);
            }

            function setColor(name, varKey, value) {
                if (!/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/.test(value)) {
                    return alert('wrong color format');
                }

                const matches = value.match(/^#([A-Fa-f0-9]{3})$/);

                if (matches) {
                    const shortForm = matches[1];
                    const frags = shortForm.split('');
                    const longForm = frags.map(f => f.repeat(2)).join('');

                    value = '#' + longForm;
                }

                const preset = data.value.presets.find(item => item.name === name);

                if (preset) {
                    preset.variables[varKey] = value;
                } else {
                    const newPreset = {
                        name: name,
                        variables: {
                        },
                    }

                    newPreset.variables[varKey] = value;

                    data.value.presets.push(newPreset);
                }
            }

            function getLanguage(variable) {
                return language[variable] || variable;
            }

            function clonePreset(preset) {
                const key = preset.name;
                const str = generateCloneName(key);
                const name = str.trim().replaceAll(' ', '+');

                if (!validatePresetName(name)) {
                    return;
                }

                const presets = data.value.presets;
                const newPreset = {
                    name: name,
                    variables: {
                        ...preset.variables,
                    },
                };

                presets.push(newPreset);

                setActivePreset(name);
            }

            function saveNewPreset() {
                const str = newPresetName.value;
                const name = str.trim().replaceAll(' ', '+');

                if (!validatePresetName(name)) {
                    return;
                }

                const presets = data.value.presets;
                const newPreset = {
                    name: name,
                    variables: {
                        ...firstBasePreset.variables,
                    },
                };

                presets.push(newPreset);

                setActivePreset(name);

                newPresetName.value = '';
                showNewPresetNameInput.value = false;
            }

            function generateCloneName(name) {
                let result = `${name}-1`;
                let next = 1;
                let base = name;
                const matches = name.match(/-(\d+)$/);

                if (matches) {
                    base = name.slice(0, matches.index);

                    next = +matches[1] + 1;
                    result = `${base}-${next}`;
                }

                while (presetKeys.value.indexOf(result) !== -1) {
                    next++;

                    result = `${base}-${next}`;
                }

                return result;
            }

            function validatePresetName(name) {
                if (!name) {
                    alert('error: empty name');
                    return false;
                }

                if (!/^[a-zA-Z\d\-\+]*$/.test(name)) {
                    alert('error: name should ony contain numbers and words');
                    return false
                }

                const presets = data.value.presets;

                if (presets.find(item => item.name === name)) {
                    alert('error: preset name is already existed');
                    return;
                }

                return true;
            }

            function deletePreset(preset) {
                const {name} = preset;
                const ok = confirm(`are you sure to delete preset "${name}"`);

                if (!ok) {
                    return;
                }

                const idx = data.value.presets.findIndex(item => item.name === name);

                data.value.presets.splice(idx, 1);

                if (name === activePreset.value) {
                    setActivePreset(firstBaseKey);
                }
            }

            function setDefaultPreset(name) {
                data.value.default = name;
            }

            function toggleNameInput(state) {
                showNewPresetNameInput.value = state;

                if (state) {
                    nextTick(() => {
                        document.querySelector('.new-preset-name-input').focus();
                    });
                } else {
                    newPresetName.value = '';
                }
            }

            function resetPreset(preset) {
                const basePreset = basePresets.find(p => p.name === preset.name);

                if (basePreset) {
                    preset.variables = {
                        ...basePreset.variables,
                    };
                } else {
                    preset.variables = {
                        ...firstBasePreset.variables,
                    }
                }
            }

            const tempPresetName = ref('');

            function toggleEditNameInput(state) {
                showEditNameInput.value = state;

                if (state) {
                    tempPresetName.value = activePreset.value;

                    nextTick(() => {
                        document.querySelector('.temp-preset-name-input').focus();
                    })
                } else {
                    tempPresetName.value = '';
                }
            }

            function saveEditPresetName(preset) {
                const str = tempPresetName.value;
                const name = str.trim().replaceAll(' ', '+');

                if (preset.name === name) {
                    toggleEditNameInput();
                    return;
                }

                if (!validatePresetName(name)) {
                    return;
                }

                const oldName = preset.name;

                if (oldName === defaultPreset.value) {
                    setDefaultPreset(tempPresetName.value);
                }

                preset.name = tempPresetName.value;
                setActivePreset(tempPresetName.value);
            }

            function resetCookieKey() {
                const ok = confirm('After perform this action, all users will lost their theme config. Are you sure?');

                if (!ok) {
                    return;
                }

                data.value.cookieKey = getCookieKey();

                nextTick(() => {
                    Joomla.submitform('style.apply', document.adminForm);
                })
            }

            return {
                baseKeys,
                data,
                presetList,
                activePreset,
                defaultPreset,
                setActivePreset,
                setDefaultPreset,
                setColor,
                getLanguage,
                clonePreset,
                deletePreset,
                showNewPresetNameInput,
                toggleNameInput,
                newPresetName,
                saveNewPreset,
                resetPreset,
                showEditNameInput,
                toggleEditNameInput,
                saveEditPresetName,
                tempPresetName,
                variableGroups,
                resetCookieKey,
            }
        }

        createApp({
            setup,
            template: '#<?php echo $id ?>-app-tpl',
            name: '<?php echo $fieldname ?>',
        }).mount('#<?php echo $id ?>-app');
    })()
</script>
