<template>
    <div class="content-block">
        <div class="operate">
            <el-button size="small" @click="addPermisson" type="primary">添加权限</el-button>
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
                    label="权限标识"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="display_name"
                    label="权限名称">
            </el-table-column>
            <el-table-column
                    prop="controller"
                    label="控制器操作">
            </el-table-column>
            <el-table-column
                    prop="description"
                    label="权限描述">
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
    import {mapState,mapActions} from 'vuex';
    import permissionEdit from './permission-edit';
    export default {
        data () {
            return {
            }
        },
        created(){
            this.getPermissions();
        },
        computed:{
            ...mapState({
                tableData:state => state.permission.permissions
            })
        },
        methods: {
            ...mapActions("permission",["getPermissions","delPermission"]),
            handleEdit(index, row) {
                this.$layer.iframe({
                    content: {
                        content: permissionEdit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {info:row}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '添加应用',
                    shadeClose: false
                });
            },
            addPermisson(){
                this.$layer.iframe({
                    content: {
                        content: permissionEdit, //传递的组件对象
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
                    this.delPermission(row).then(res=>{
                        this.getPermissions();
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