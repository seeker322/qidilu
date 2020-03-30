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
                <el-tree
                        :data="tableData"
                        show-checkbox
                        :props="defaultProps"
                        node-key="id"
                        ref="tree"
                        :default-expand-all="true"
                        highlight-current
                        :default-checked-keys="defaultCheckedKeys"
                        :default-expanded-keys="defaultExpandedKeys"
                        >
                </el-tree>
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
    export default {
        name: "roles-edit",
        props: ['info','layerid'],
        data() {
            return {
                form: {
                    name: '',
                    description:'',
                    permissions:[]
                },
                defaultProps: {
                    children: 'child',
                    label: 'name'
                },
                defaultExpandedKeys:[],
                defaultCheckedKeys:[]
            }
        },
        computed:{
            ...mapState({
                tableData:state => state.permission.permissions
            })
        },
        mounted() {
            if(this.info){
                this.getPermissions();
                this.form=this.info;
            }
            this.$nextTick(() => {
                this.defaultCheckedKeys=this.info.permissions.map(item=>{
                    return item.id;
                });
                //default-checked-keys会把节点下的所有子节点都选中的bug处理
                let newArr = [];
                let item = "";
                if (this.defaultCheckedKeys && this.defaultCheckedKeys.length !== 0) {
                    this.defaultCheckedKeys.forEach(item => {
                        this.checked(item, this.tableData, newArr);
                    });
                    this.defaultCheckedKeys = newArr;
                }
            });
        },
        methods: {
            ...mapActions('permission', ['getPermissions']),
            ...mapActions('role', ['getRoles','addRole','editRole']),
            onSubmit() {

                let parentArr = this.$refs.tree.getHalfCheckedKeys();
                let childeArr = this.$refs.tree.getCheckedKeys();
                let arr = childeArr.concat(parentArr);
                this.form.permissions= arr;
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

            checked(id, data, newArr) {
                data.forEach(item => {
                    if (item.id == id) {
                        if (item.child && item.child.length == 0) {
                            newArr.push(item.id);
                        }
                    } else {
                        if (item.child != null && item.child.length != 0) {
                            this.checked(id, item.child, newArr);
                        }
                    }
                });
            },
            onCancel(){
                this.$layer.close(this.layerid);
            },
            resetChecked() {
                // this.$refs.tree.setCheckedKeys([]);
            }


        }
    }
</script>

<style lang="scss" >

    .el-tree-node.is-expanded>.el-tree-node__children{
        .el-tree-node__children{
            display: flex;
        }


    }
</style>