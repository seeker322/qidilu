<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="80px" size="small">
            <el-form-item label="权限标识">
                <el-input v-model="form.name"></el-input>
            </el-form-item>
            <el-form-item label="权限名称">
                <el-input v-model="form.display_name"></el-input>
            </el-form-item>
            <el-form-item label="权限描述">
                <el-input type="textarea" v-model="form.description"></el-input>
            </el-form-item>
            <el-form-item label="权限控制">
                <el-input v-model="form.controller"></el-input>
            </el-form-item>
            <el-form-item label="所属角色">
                <el-checkbox-group v-model="form.roles" >
                    <el-checkbox v-for="role in roleList" :label="role.id" :key="role.id">{{role.name}}</el-checkbox>
                </el-checkbox-group>
            </el-form-item>
            <el-form-item size="large">
                <el-button type="primary" size="small" @click="onSubmit">立即提交</el-button>
                <el-button size="small" @click="onCancel">取消</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    import {mapState,mapActions} from 'vuex';

    export default {
        name: "permission-edit",
        props: ['info','layerid'],
        data() {
            return {
                form: {
                    name: '',
                    display_name:'',
                    description:'',
                    controller:'',
                    roles:[],
                },

            }
        },
        created(){
            // this.checkedroles=this.roles.map(v=>v.value)

        },
        computed:{
            ...mapState({
                roleList:state => state.role.roles
            }),
        },

        mounted() {
            this.getRoles();
            if(this.info){
                this.info.roles=this.info.roles.map(item=>{
                    return item.id;
                })
                this.form=this.info;
            }
        },
        methods: {
            ...mapActions('permission', ['addPermission','editPermission','getPermissions']),
            ...mapActions('role', ['getRoles']),
            onSubmit() {
                let params=this.form;
                if(this.info){ //编辑
                    this.editPermission(params).then(res=>{
                        this.getPermissions();
                        this.$layer.close(this.layerid);
                    });
                }else{ //新增
                    this.addPermission(params).then(res=>{
                        this.getPermissions();
                        this.$layer.close(this.layerid);
                    });
                }

            },
            onCancel(){
                this.$layer.close(this.layerid);
            }
        }
    }
</script>

<style scoped>

</style>