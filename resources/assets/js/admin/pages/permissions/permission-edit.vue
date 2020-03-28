<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="100px" size="small">
            <el-form-item label="父级菜单" >
                <el-select v-model="form.pid" placeholder="父级菜单">
                    <el-option
                            :key="0"
                            :label="'无'"
                            :value="0">
                    </el-option>
                    <template v-for="item in permissionList">
                        <el-option
                                :key="item.id"
                                :label="item.name"
                                :value="item.id">
                        </el-option>
                        <template v-for="itemone in item.child">
                            <el-option
                                    :key="itemone.id"
                                    :label="itemone.name"
                                    :value="itemone.id">
                                <template >
                                    <span v-html="getName(itemone)"></span>
                                </template>
                            </el-option>
                            <template v-for="itemtwo in itemone.child">
                                <el-option
                                        :key="itemtwo.id"
                                        :label="itemtwo.name"
                                        :value="itemtwo.id">
                                    <template >
                                        <span v-html="getName(itemtwo)"></span>
                                    </template>
                                </el-option>
                            </template>
                        </template>
                    </template>

                </el-select>
            </el-form-item>
            <el-form-item label="菜单名称" >
                <el-input v-model="form.name" ></el-input>
            </el-form-item>
            <el-form-item label="规则路径">
                <el-input v-model="form.action" placeholder="xxxController@xxx"></el-input>
            </el-form-item>
            <el-form-item label="图标">
                <el-input v-model="form.icon" placeholder="fa fa-angle-double-left"></el-input>
            </el-form-item>
            <el-form-item label="是否菜单显示">
                <el-switch v-model="form.is_menu"></el-switch>
            </el-form-item>
            <el-form-item label="备注">
                <el-input type="textarea" v-model="form.description"></el-input>
            </el-form-item>
            <el-form-item label="所属角色">
                <el-checkbox-group v-model="form.roles" >
                    <el-checkbox v-for="role in roleList" :label="role.id" :key="role.id">{{role.name}}</el-checkbox>
                </el-checkbox-group>
            </el-form-item>
            <el-form-item size="large">
                <el-button type="primary" size="small" @click="onSubmit">确定</el-button>
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
                    description:'',
                    pid:null,
                    action:null,
                    is_menu:0,
                    icon:"",
                    roles:[],
                },
            }
        },
        created(){
            // this.checkedroles=this.roles.map(v=>v.value)

        },
        computed:{
            ...mapState({
                roleList:state => state.role.roles,
                permissionList:state => state.permission.permissions
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
            getName(row){
                let name="";

                switch(row.level) {
                    case 0:
                        name=row.name;
                        break;
                    case 1:
                        name="&nbsp;&nbsp;├ &nbsp;"+row.name;
                        break;
                    case 2:
                        name="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├ &nbsp;"+row.name;
                        break;
                    default:
                        name=row.name;
                }
                return name;
            },
            formatName(leavel){

            },
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

<style lang="scss" scoped>

</style>