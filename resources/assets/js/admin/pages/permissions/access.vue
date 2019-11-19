<template>
    <div>
        <el-button type="primary" @click="addMoudle">添加应用</el-button>

    </div>

</template>
<script>
    import accessAdd from './access-add';
    const cityOptions = ['上海', '北京', '广州', '深圳'];
    export default {
        data() {
            return {
                checkAll: false,
                checkedCities: ['上海', '北京'],
                cities: cityOptions,
                isIndeterminate: true
            };
        },
        methods: {
            handleCheckAllChange(val) {
                this.checkedCities = val ? cityOptions : [];
                this.isIndeterminate = false;
            },
            handleCheckedCitiesChange(value) {
                let checkedCount = value.length;
                this.checkAll = checkedCount === this.cities.length;
                this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length;
            },
            addMoudle(){

                this.$layer.iframe({
                    content: {
                        content: accessAdd, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '添加应用',
                    shadeClose: false
                });
            }
        }
    };
</script>