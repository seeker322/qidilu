<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="80px" size="small">

            <el-form-item label="角色名称">
                <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="角色描述">
                <el-input type="textarea" v-model="form.description"></el-input>
            </el-form-item>
            <el-form-item label="角色权限">
                <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">系统管理</el-checkbox>
                <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
                    <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox>
                </el-checkbox-group>

                <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">权限管理</el-checkbox>
                <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
                    <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox>
                </el-checkbox-group>
            </el-form-item>

            <el-form-item size="large">
                <el-button type="primary" size="small" @click="onSubmit">立即提交</el-button>
                <el-button size="small">取消</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    import {mapState,mapActions} from 'vuex';
    const cityOptions = ['上海', '北京', '广州', '深圳'];
    export default {
        name: "roles-edit",
        props: ['info','layerid'],
        data() {
            return {
                form: {
                    name: '',
                    description:'',
                },
                checkAll: false,
                checkedCities: ['上海', '北京'],
                cities: cityOptions,
                isIndeterminate: true
            }
        },
        mounted() {
            if(this.info){
                // this.getPermissions();
                this.form=this.info;
            }
        },
        methods: {
            ...mapActions('permission', ['getPermissions']),
            ...mapActions('role', ['getRoles','addRole','editRole']),
            onSubmit() {
                let params=this.form;
                if(this.info){ //编辑
                    this.editRole(params).then(res=>{
                        this.getRoles();
                        this.$layer.close(this.layerid);
                    });
                }else{ //新增
                    this.addRole(params).then(res=>{
                        this.getRoles();
                        this.$layer.close(this.layerid);
                    });
                }

            },
            onCancel(){
                this.$layer.close(this.layerid);
            },
            handleCheckAllChange(val) {
                this.checkedCities = val ? cityOptions : [];
                this.isIndeterminate = false;
            },
            handleCheckedCitiesChange(value) {
                let checkedCount = value.length;
                this.checkAll = checkedCount === this.cities.length;
                this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length;
            }
        }
    }
</script>

<style scoped>

</style>