<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="80px" size="small">
            <el-form-item label="用户名">
                <el-input v-model="form.name"></el-input>
            </el-form-item>

            <el-form-item label="所属角色">
                <el-select v-model="form.role" placeholder="请选择">
                    <el-option
                            v-for="item in roles"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>

            <el-form-item label="邮箱">
                <el-input v-model="form.email"></el-input>
            </el-form-item>
            <el-form-item label="密码">
                <el-input v-model="form.password"></el-input>
            </el-form-item>
            <el-form-item label="确认密码">
                <el-input v-model="form.confPassword"></el-input>
            </el-form-item>
            <el-form-item size="large">
                <el-button type="primary" size="small" @click="onSubmit">立即提交</el-button>
                <el-button size="small">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    import {mapState,mapActions} from 'vuex';
    export default {
        name: "users-edit",
        props: ['data'],
        data() {
            return {
                form: {
                    name: '',
                    email:'',
                    password:'',
                    confPassword:'',
                    role:"1"

                },
                roles: [{
                    value: '1',
                    label: '超级管理员'
                }, {
                    value: '2',
                    label: '普通管理员'
                }],
            }
        },
        methods: {
            ...mapActions('user', ['addUser']),
            onSubmit() {
                let params=this.form;

                console.log(params);
                this.addUser(params);
            }
        }
    }
</script>

<style scoped>

</style>