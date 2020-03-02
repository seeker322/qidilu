<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="80px" size="small">
            <el-form-item label="权限标识">
                <el-input v-model="form.sign"></el-input>
            </el-form-item>
            <el-form-item label="权限名称">
                <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="权限描述">
                <el-input type="textarea" v-model="form.desc"></el-input>
            </el-form-item>
            <el-form-item label="权限控制">
                <el-input v-model="form.control"></el-input>
            </el-form-item>
            <el-form-item label="所属角色">
                <el-checkbox-group v-model="checkedroles" @change="handleCheckedCitiesChange">
                    <el-checkbox v-for="role in roles" :label="role.value" :key="role.value">{{role.label}}</el-checkbox>
                </el-checkbox-group>
            </el-form-item>
            <el-form-item size="large">
                <el-button type="primary" size="small" @click="onSubmit">立即提交</el-button>
                <el-button size="small">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    export default {
        name: "users-edit",
        props: ['data'],
        data() {
            return {
                form: {
                    sign:'',
                    name: '',
                    desc:'',
                    control:'',
                },
                roles: [{
                    value: '1',
                    label: '超级管理员'
                }, {
                    value: '2',
                    label: '普通管理员'
                }],
                checkedroles: ["1","2"],

            }
        },
        created(){
            this.checkedroles=this.roles.map(v=>v.value)

        },
        methods: {
            onSubmit() {
                console.log('submit!');
            },

            handleCheckedCitiesChange(value) {
                console.log(value);
                // let checkedCount = value.length;

            }
        }
    }
</script>

<style scoped>

</style>