<?php

use Joomla\CMS\HTML\HTMLHelper;

defined('_JEXEC') or die('Restricted access');

HTMLHelper::script('plugins/system/pixel/media/vendor/vue/vue.global.min.js');

extract($displayData);
$value = $value ? $value : '[]';
?>
<?php if ($layouts) : ?>
    <template id="<?php echo $id ?>-app-tpl">
    <textarea name="<?php echo $name ?>" style="display: none; width: 100%; height: 100px;">{{JSON.stringify(output)}}</textarea>
        <table class="table px-sublayout-config">
            <thead>
                <tr>
                    <th>Menu Item</th>
                    <th>Layout</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in data" >
                    <td>
                        <select class="form-select" :value="item.id" @change="event => updateMenuItemId(event, index)">
                            <option value="0">-- Select Menu Item --</option>
                            <optgroup v-for="(group, groupKey) in menuItemGroups" :key="groupKey" :label="groupKey">
                                <option 
                                    v-for="groupItem in group" 
                                    :key="groupItem.id" 
                                    :value="groupItem.id"
                                    :disabled="groupItem.disabled"
                                >
                                    {{ groupItem.title }}
                                </option>
                            </optgroup>
                        </select>
                    </td>
                    <td>
                        <select class="form-select" :value="item.layout" @change="event => updateSubviewLayout(event, index)">
                            <option value="">-- Select Layout --</option>
                            <option 
                                v-for="layout in layouts" 
                                :value="layout" 
                                :selected="item.layout === layout"
                                :key="layout"
                            >
                                {{layout}}
                            </option>
                        </select>
                    </td>
                    <td><button class="btn btn-danger" type="button" @click="deleteMenuItem(index)">delete</button></td>
                </tr>
            </tbody>
        </table>
        <div><button class="btn btn-success" type="button" @click="addMenuItem">add+</button></div>
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
                const menuItemGroups = <?php echo json_encode($menuItemGroups) ?>;
                const rawData = <?php echo $value ?>;
                const data = ref(Array.isArray(rawData) ? rawData : []);
                const layouts = <?php echo json_encode($layouts) ?>;

                const output = computed(() => {
                    const result = {};

                    data.value.forEach(item => {
                        const key = `menu_${item.id}`;
                        if (+item.id && !result[key]) {
                            result[key] = item;
                        }
                    })

                    return Object.values(result);
                })

                function updateSubviewLayout(event, index) {
                    const layout = event.target.value;

                    data.value[index].layout = layout;
                }

                function updateMenuItemId(event, index) {
                    const id = +event.target.value;
                    const added = data.value.some(item => item.id === id);

                    if (id && added) {
                        alert('This menu is already added');
                    }

                    data.value[index].id = id;
                }

                function addMenuItem() {
                    data.value.push({
                        id: 0,
                        layout: '',
                    })
                }

                function deleteMenuItem(index) {
                    data.value.splice(index, 1);
                }

                return {
                    data,
                    output,
                    layouts,
                    updateMenuItemId,
                    updateSubviewLayout,
                    menuItemGroups,
                    addMenuItem,
                    deleteMenuItem,
                }
            }

            createApp({
                setup,
                template: '#<?php echo $id ?>-app-tpl',
                name: '<?php echo $fieldname ?>',
            }).mount('#<?php echo $id ?>-app');
        })()
    </script>
<?php else : ?>
    <i>no sublayout as found</i>
<?php endif;
