<template>
    <div class="iframe-block">
        <el-form  :model="form" label-width="80px" size="small">
            <el-form-item label="用户名">
                <el-input v-model="form.name"></el-input>
            </el-form-item>

            <el-form-item label="所属角色">
                <el-select v-model="form.roles" multiple collapse-tags placeholder="请选择" style="width: 100%;">
                    <el-option
                            v-for="item in roleList"
                            :key="item.id"
                            :label="item.name"
                            :value="item.id">
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
        props: ['info'],
        data() {
            return {
                form: {
                    name: '',
                    email:'',
                    password:'',
                    confPassword:'',
                    roles:[]
                }
            }
        },
        created(){

        },

        mounted() {
            if(this.info){
                this.form=this.info;
            }else{
                this.getRoles();
            }
        },
        computed:{
            ...mapState({
                roleList:state => state.role.roles
            }),
        },
        methods: {
            ...mapActions('user', ['addUser']),
            ...mapActions('role', ['getRoles']),
            onSubmit() {
                let params=this.form;
                this.addUser(params);
            }
        }
    }
</script>

<style scoped>

</style>