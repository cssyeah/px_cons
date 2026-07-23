<?php

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\Component\Templates\Administrator\Helper\TemplatesHelper;
use Joomla\Plugin\System\Pixel\Helper\PixelMenuHelper;

defined('_JEXEC') or die('Restricted access');

HTMLHelper::script('plugins/system/pixel/media/vendor/vue/vue.global.min.js');

extract($displayData);

$app = Factory::getApplication();
$input = $app->input;
$db = Factory::getDbo();
$query = "SELECT `id`, `title`, `language` 
    FROM `#__modules` 
    WHERE position = 'mainmenu' 
    AND module = 'mod_menu'
    AND published = 1";
$modules = $db->setQuery($query)->loadObjectList();

$modules = array_map(function ($module) {
    $module->menu = PixelMenuHelper::getMenu($module->id);

    return $module;
}, $modules);

$id = $input->getInt('id');
$clientSite = 0;
$query = "SELECT `template` FROM `#__template_styles` WHERE id = " . $db->q($id);
$template = $db->setQuery($query)->loadResult();
$templatePositions = TemplatesHelper::getPositions($clientSite, $template);
$templatePositions = array_filter($templatePositions, function ($position) {
    return $position !== 'mainmenu';
});

$query = "SELECT id, title, position
    FROM `#__modules` 
    WHERE client_id = 0 
    AND published = 1
    AND position != 'mainmenu'
    ORDER BY position ASC, title ASC";
$rows = $db->setQuery($query)->loadObjectList();

$createdModules = array_map(function ($row) {
    return [
        'id' => $row->id,
        'title' => ($row->position ? '[' . $row->position . '] ' : '' ) . $row->title,
    ];
}, $rows);
?>
<template id="pixelmegamenu-app-tpl">
    <textarea style="display: none;" name="<?php echo $name ?>">{{JSON.stringify(outputConfig)}}</textarea>
    <div class="module-select" v-if="modules.length">
        <ul class="module-list">
            <li 
                v-for="module in modules" 
                :class="{active: activeModule === module.id}"
                @click="showMenuConfig(module.id)"
            >
                {{module.title}}
            </li>
        </ul>
    </div>
    <div v-else>no module assign on `mainmenu` position</div>

    <div class="list-menu-items">
        <button 
            class="btn menu-item" 
            type="button" 
            v-for="item in menuItems"
            :class="{'btn-primary': activeMenuItemId === item.id, 'is-mega': item.mega}"
            :key="item.id"
            @click="setActiveMenuItem(item.id)"
        >{{ item.title }}</button>
    </div>

    <template v-for="item in menuItems" :key="item.id">
        <div class="menu-config" v-if="item.id === activeMenuItemId">
            <div class="menu-options">
                <div class="megamenu-toggle">
                    <div class="col">
                        <label for="cb-mega-menu">Mega menu</label>
                        <label class="switch">
                            <input id="cb-mega-menu" type="checkbox" :checked="activeMenuConfig.megamenu === 'on'" @change="toggleMegaMenu">
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>
                <div class="megamenu-fluid" :class="{'switch-disabled': activeMenuConfig.megamenu !== 'on'}">
                    <div class="col">
                        <label for="cb-fluid-menu">Fluid Menu</label>
                        <label class="switch">
                            <input 
                                id="cb-fluid-menu" 
                                type="checkbox" 
                                :disabled="activeMenuConfig.megamenu !== 'on'"
                                :checked="activeMenuConfig.fluid === 'on'" 
                                @change="toggleFluidMenu"
                            >
                            <span class="slider round"></span>
                        </label>
                    </div>
                </div>
                <div class="megamenu-width">
                    <div class="col">
                        <label for="input-menu-width">Menu Width</label>
                        <label>
                            <input 
                                id="input-menu-width"
                                type="number" 
                                :value="activeMenuConfig.width" 
                                :disabled="activeMenuConfig.megamenu !== 'on' || activeMenuConfig.fluid === 'on'" 
                                @change="updateActiveMenuWidth" 
                                placeholder="640"
                            >&nbsp;<span class="text-hint">px</span>
                        </label>
                    </div>
                </div>

                <div class="megamenu-extra-class">
                    <div class="col">
                        <label for="input-extra-class">Extra Class</label>
                        <label>
                            <input id="input-extra-class" type="text" :value="activeMenuConfig.extra_class" @change="updateActiveMenuExtraClass">
                        </label>
                    </div>
                </div>
            </div>
            <div 
                class="megamenu-config" 
                v-if="activeMenuConfig.megamenu === 'on'"
            >
                <transition-group name="row">
                    <div v-for="(row, iRow) in activeMenuConfig.data" :key="row">
                        <div class="megamenu-row">
                            <transition-group name="col">
                                <div 
                                    class="megamenu-col" 
                                    v-for="(col, iCol) in row"
                                    :key="col"
                                >
                                <div class="megamenu-col-inner">
                                    <div class="col-action">
                                        <button class="btn-add-col" type="button" @click="addColumn(iRow, iCol)">
                                            <i class="fas fa-plus"></i>
                                            <span class="px-tooltips">Add col</span>
                                        </button>
                                        <button class="btn-delete-col" type="button" :disabled="row.length < 2" @click="deleteColumn(iRow, iCol)">
                                            <i class="fas fa-minus"></i>
                                            <span class="px-tooltips">Remove col</span>
                                        </button>
                                    </div>
                                    <div class="col-settings">
                                        <span class="fas fa-cog" @click="toggleColExtraConfig(iRow, iCol)"></span>
                                        <div class="col-settings-wrap" v-if="extraConfigShow === `${iRow}-${iCol}`">
                                            <label>Extra Class</label>
                                            <input 
                                                type="text" 
                                                :value="col.extra_class"
                                                @change="event => setGridItemValue(iRow, iCol, 'extra_class', event.target.value)"
                                            />
                                        </div>
                                    </div>
                                    <div class="config-content-type">
                                        <label>Type</label>
                                        <select 
                                            :value="col.content_type"
                                            @change="event => setGridItemValue(iRow, iCol, 'content_type', event.target.value)"
                                        >
                                            <option value="">Select Type</option>
                                            <option value="position">Position</option>
                                            <option value="module">Module</option>
                                            <option value="menuitem">Menu Item</option>
                                        </select>
                                    </div>
                                    <div class="config-msg" v-if="col.content_type === ''">
                                        <p>Choose content type</p>
                                    </div>
                                    <div class="config-position" v-if="col.content_type === 'position'">
                                        <label>Template Positions</label>
                                        <select
                                            @change="event => setGridItemValue(iRow, iCol, 'position', event.target.value)"
                                        >
                                            <option value="">Select Postion</option>
                                            <option 
                                                v-for="tempPosition in templatePositions" 
                                                :value="tempPosition"
                                                :selected="tempPosition === col.position"
                                            >
                                                {{tempPosition}}
                                            </option>
                                        </select>
                                    </div>
                                    <div class="config-module" v-if="col.content_type === 'module'">
                                        <label>Created Modules</label>
                                        <select
                                            @change="event => setGridItemValue(iRow, iCol, 'module_id', event.target.value)"
                                            >
                                            <option value="">Select Module</option>
                                            <option 
                                                v-for="cModule in createdModules" 
                                                :value="cModule.id"
                                                :selected="cModule.id == col.module_id"
                                            >
                                                {{cModule.title}}
                                            </option>
                                        </select>
                                    </div>
                                    <div class="config-menuitem" v-if="col.content_type === 'menuitem'">
                                        <label>Menu Items</label>
                                        <div v-for="menu in childMenuTree" :key="menu.id">
                                            <input 
                                                class="cb-menuitem"
                                                type="checkbox" 
                                                :data-cb="`cb-r${iRow}-c${iCol}`"
                                                :id="`cb-r${iRow}-c${iCol}-v${menu.id}`"
                                                :checked="col.menu_ids.indexOf(menu.id) !== -1"
                                                :value="menu.id"
                                                @change="event => updateMenuIds(iRow, iCol, event)"
                                            />
                                            <label :for="`cb-r${iRow}-c${iCol}-v${menu.id}`">
                                                {{menu.title}}
                                            </label>
                                        </div>
                                        <div class="no-child-msg" v-if="childMenuTree.length === 0">
                                            <p>No menu item</p>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </transition-group>
                            <div class="row-action">
                                <button class="btn-add-row" type="button" @click="addRow(iRow)"><i class="fas fa-plus"></i><span class="px-tooltips">Add row</span></button>
                                <button class="btn-delete-row" type="button" :disabled="activeMenuConfig.data.length < 2" @click="deleteRow(iRow)"><i class="fas fa-minus"></i><span class="px-tooltips">Remove row</span></button>
                            </div>
                        </div>
                    </div>
                </transition-group>
            </div>
        </div>
    </template>
</template>

<div id="pixelmegamenu-app"></div>
<script>
    (() => {
        const {
            createApp,
            ref,
            watch,
            computed,
        } = Vue;

        const rootUri = Joomla.getOptions('system.paths').root;

        function setup() {
            const sessionMenuModuleActiveKey = location.pathname + location.search + '-px-menu-module-active';
            const sessionMenuItemActiveKey = location.pathname + location.search + '-px-menu-item-active';
            const templatePositions = <?php echo json_encode($templatePositions) ?>;
            const createdModules = <?php echo json_encode($createdModules) ?>;
            const createdModuleIds = createdModules.map(m => m.id);
            const activeModule = ref('');
            const modules = <?php echo json_encode($modules) ?>;
            const rawMenuConfigs = <?php echo $value ? $value : '{}' ?>;
            const menuConfigs = ref(initMenuData(rawMenuConfigs));
            const activeMenuItemId = ref(0);
            const childMenuTree = ref([]);

            const activeMenu = computed(() => {
                const defaultMenuData = {base: 0, items: []};
                const activeModuleData = modules.find(module => module.id === activeModule.value) || {};

                return activeModuleData.menu || defaultMenuData;
            })

            watch(activeMenuItemId, () => {
                const items = JSON.parse(JSON.stringify(activeMenu.value.items));
                const tree = buildChildMenuTree(activeMenuItemId.value, items, []);

                childMenuTree.value = tree.map(treeItem => {
                    treeItem.title = '-- '.repeat(treeItem.level - 2) + treeItem.title;

                    return treeItem;
                })
            })

            if (modules.length) {
                const sessionModId = +sessionStorage.getItem(sessionMenuModuleActiveKey);

                if (sessionModId) {
                    showMenuConfig(sessionModId);
                } else {
                    showMenuConfig(modules[0].id);
                }
            }

            const menuItems = computed(() => {
                if (!activeMenu.value.base || !activeMenu.value.items || !activeMenu.value.items.length) {
                    return [];
                }

                const mod_id = activeModule.value;
                const configs = menuConfigs.value['mod_' + mod_id];
                const items = getChildrend(activeMenu.value.base, activeMenu.value.items);

                items.map(item => {
                    if (
                        configs[`item_${item.id}`] 
                        && configs[`item_${item.id}`].megamenu 
                        && configs[`item_${item.id}`].megamenu === 'on'
                    ) {
                        item.mega = true;
                    } else {
                        item.mega = false;
                    }

                    return item;
                })

                return items;
            })

            const activeMenuConfig = computed(() => {
                const id = activeMenuItemId.value;
                const mod_id = activeModule.value;

                return menuConfigs.value['mod_' + mod_id]['item_' + id] || {};
            })

            const outputConfig = computed(() => {
                const config = menuConfigs.value;
                const output = {};

                modules.forEach(module => {
                    if (!config[`mod_${module.id}`]) {
                        return;
                    }

                    const moduleConfig = {};

                    for (const key in config[`mod_${module.id}`]) {
                        if (!Object.hasOwnProperty.call(config[`mod_${module.id}`], key)) {
                            continue;
                        }

                        const item = config[`mod_${module.id}`][key];

                        if (item.megamenu === 'on') {
                            moduleConfig[key] = {
                                ...item,
                            };
                        } else {
                            moduleConfig[key] = {
                                extra_class: item.extra_class,
                            };
                        }

                    }

                    output[`mod_${module.id}`] = moduleConfig;
                })

                return output;
            })

            function buildChildMenuTree(base, items, output) {
                output = output || [];

                for (let i = 0; i < items.length; i++) {
                    const item = items[i];

                    if (item.parent_id === base) {
                        output.push(item);
                        output = buildChildMenuTree(item.id, items, output);
                    }
                }

                return output;
            }

            function initMenuData(rawData) {
                const data = {};

                for (let i = 0; i < modules.length; i++) {
                    const module = modules[i];
                    const moduleData = {};
                    const rawModuleData = rawData['mod_' + module.id] || {};
                    const mainMenuItems = getChildrend(module.menu.base, module.menu.items);

                    mainMenuItems.forEach(item => {
                        const cloneData = rawModuleData['item_' + item.id] || {};

                        moduleData['item_' + item.id] = {
                            ...getDefaultConfig(),
                            ...cloneData,
                        };
                    })

                    data['mod_' + module.id] = moduleData;
                }

                return data;
            }

            function getDefaultConfig() {
                return {
                    megamenu: 'off',
                    fluild: 'off',
                    width: '640',
                    extra_class: '',
                    data: [
                        [
                            getDefaultMegaConfig(),
                        ]
                    ],
                }
            }

            function getDefaultMegaConfig() {
                return {
                    content_type: '',
                    menu_ids: [],
                    position: '',
                    module_id: '',
                    extra_class : '',
                }
            }

            function showMenuConfig(moduleid) {
                if (activeModule.value === moduleid) {
                    return;
                }

                sessionStorage.setItem(sessionMenuModuleActiveKey, moduleid);
                activeModule.value = moduleid;

                if (!menuConfigs.value['mod_' + moduleid]) {
                    menuConfigs.value['mod_' + moduleid] = {};
                }

                const itemIds = [];

                activeMenu.value.items.forEach((item, index) => {
                    itemIds.push(item.id);
                });

                const savedItemId = +sessionStorage.getItem(sessionMenuItemActiveKey);

                if (savedItemId && itemIds.indexOf(savedItemId) !== -1) {
                    activeMenuItemId.value = savedItemId;
                } else {
                    activeMenuItemId.value = activeMenu.value.items[0]?.id;
                }
            }

            function getChildrend(base, items) {
                const children = items.filter(item => base === item.parent_id);

                return children;
            }

            function setActiveMenuItem(id) {
                activeMenuItemId.value = id;
                sessionStorage.setItem(sessionMenuItemActiveKey, id);
            }

            function getActiveModuleConfig() {
                const id = activeMenuItemId.value;
                const mod_id = activeModule.value;
                const config = menuConfigs.value['mod_' + mod_id]['item_' + id];

                return config;
            }

            function toggleMegaMenu(event) {
                const config = getActiveModuleConfig();

                config.megamenu = event.target.checked ? 'on' : 'off';
            }

            function toggleFluidMenu(event) {
                const config = getActiveModuleConfig();

                config.fluid = event.target.checked ? 'on' : 'off';
            }

            function updateActiveMenuWidth(event) {
                const config = getActiveModuleConfig();

                config.width = event.target.value;
            }

            function updateActiveMenuExtraClass(event) {
                const config = getActiveModuleConfig();

                config.extra_class = event.target.value;
            }

            function addRow(iRow) {
                const config = getActiveModuleConfig();
                const data = config.data;

                data.splice(iRow + 1, 0, [getDefaultMegaConfig()]);
            }

            function deleteRow(iRow) {
                const config = getActiveModuleConfig();
                const data = config.data;

                if (data.length === 1) {
                    return alert('should have a least one row');
                }
                data.splice(iRow, 1);
            }

            function addColumn(iRow, iCol) {
                const config = getActiveModuleConfig();
                const data = config.data;

                if (data[iRow].length === 6) {
                    return alert('each row should have max 6 columns');
                }

                data[iRow].splice(iCol + 1, 0, getDefaultMegaConfig());
            }

            function deleteColumn(iRow, iCol) {
                const config = getActiveModuleConfig();
                const data = config.data;

                if (data[iRow].length === 1) {
                    return alert('each row should have a least one column');
                }
                data[iRow].splice(iCol, 1);
            }

            function setGridItemValue(iRow, iCol, key, value) {
                const config = getActiveModuleConfig();
                const data = config.data;

                data[iRow][iCol][key] = value;
            }

            const extraConfigShow = ref('');

            function toggleColExtraConfig(iRow, iCol)
            {
                if (extraConfigShow.value === `${iRow}-${iCol}`) {
                    extraConfigShow.value = '';
                } else {
                    extraConfigShow.value = `${iRow}-${iCol}`;
                }
            }

            document.addEventListener('click', event => {
                const $target = event.target;

                if (!$target.closest('.col-settings')) {
                    extraConfigShow.value = '';
                }
            })

            function updateMenuIds(iRow, iCol, event) {
                const config = getActiveModuleConfig();
                const data = config.data;
                const checkboxData = event.target.dataset.cb;
                const ids = [];

                document.querySelectorAll(`input[data-cb=${checkboxData}]`).forEach(el => {
                    if (el.checked) {
                        ids.push(+el.value);
                    }
                })

                data[iRow][iCol].menu_ids = ids;
            }

            return {
                activeModule,
                modules,
                showMenuConfig,
                menuItems,
                setActiveMenuItem,
                activeMenuItemId,
                activeMenuConfig,
                outputConfig,
                toggleFluidMenu,
                toggleMegaMenu,
                templatePositions,
                createdModules,
                childMenuTree,
                addRow,
                deleteRow,
                addColumn,
                deleteColumn,
                setGridItemValue,
                updateMenuIds,
                updateActiveMenuWidth,
                updateActiveMenuExtraClass,
                toggleColExtraConfig,
                extraConfigShow,
            }
        }

        createApp({
            setup,
            template: '#pixelmegamenu-app-tpl',
            name: '<?php echo $fieldname ?>',
        }).mount('#pixelmegamenu-app');
    })()
</script>