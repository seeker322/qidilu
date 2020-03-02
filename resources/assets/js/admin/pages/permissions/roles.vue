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
                    prop="role_sign"
                    label="角色标识"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="role_name"
                    label="角色名称">
            </el-table-column>
            <el-table-column
                    prop="role_des"
                    label="角色描述">
            </el-table-column>
            <el-table-column
                    prop="created"
                    label="创建时间">
            </el-table-column>
            <el-table-column
                    prop="updated"
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
    export default {
        data () {
            return {
                tableData: [{
                    id: '1',
                    role_sign: 'admin',
                    role_name: '超级管理员',
                    role_des:"拥有最高权限",
                    created:"2020-03-02 22:13:52",
                    updated:"2020-03-02 22:13:52"
                }]
            }
        },
        methods: {
            handleEdit(index, row) {
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
                console.log(index, row);
            }
        }
    }
</script>
<style lang="scss">
    /*@import "@/";*/
</style>