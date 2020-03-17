<template>
    <div class="content-block">
        <div class="operate">
            <el-button size="small" @click="addRole" type="primary">添加角色</el-button>
        </div>
        <el-table
                :data="tableData"
                height="400"
                border
                size="small"
                style="width: 100%">
            <el-table-column
                    prop="id"
                    label="id"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="角色名称">
            </el-table-column>
            <el-table-column
                    prop="description"
                    label="角色描述">
            </el-table-column>
            <el-table-column
                    prop="created_at"
                    label="创建时间">
            </el-table-column>
            <el-table-column
                    prop="updated_at"
                    label="修改时间">
            </el-table-column>
            <el-table-column label="操作" width="200px">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
                            @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                    <el-button
                            size="mini"
                            type="danger"
                            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>

</template>
<script>
    import rolesEdit from './roles-edit';
    import {mapState,mapActions} from 'vuex';
    export default {
        data () {
            return {

            }
        },
        created(){
            this.getRoles();
        },
        computed:{
            ...mapState({
                tableData:state => state.role.roles
            })
        },

        methods: {
            ...mapActions('role', ['getRoles','delRole']),
            handleEdit(index, row) {
                this.$layer.iframe({
                    content: {
                        content: rolesEdit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {info:row}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '添加应用',
                    shadeClose: false
                });
            },
            addRole(){
                this.$layer.iframe({
                    content: {
                        content: rolesEdit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '添加应用',
                    shadeClose: false
                });
            },
            handleDelete(index, row) {
                this.$layer.confirm("删除后不可恢复，确定删除吗？",(layerid)=>{
                    this.delRole(row).then(res=>{
                        this.getRoles();
                        this.$layer.close(layerid);
                    });

                })

            }
        }
    }
</script>
<style lang="scss">
    /*@import "@/";*/
</style>