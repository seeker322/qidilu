<template>
    <div class="content-block">
        <div class="operate">
            <el-button size="small" @click="addAccess" type="primary">添加权限</el-button>
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
                    prop="access_sign"
                    label="权限标识"
                    width="180">
            </el-table-column>
            <el-table-column
                    prop="access_name"
                    label="权限名称">
            </el-table-column>
            <el-table-column
                    prop="access_des"
                    label="权限描述">
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
    import accessEdit from './access-edit';
    export default {
        data () {
            return {
                tableData: [{
                    id: '1',
                    access_sign: 'admin',
                    access_name: '超级管理员',
                    access_des:"拥有最高权限",
                    created:"2020-03-02 22:13:52",
                    updated:"2020-03-02 22:13:52"
                }]
            }
        },
        methods: {
            handleEdit(index, row) {
                this.$layer.iframe({
                    content: {
                        content: accessEdit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '添加应用',
                    shadeClose: false
                });
            },
            addAccess(){
                this.$layer.iframe({
                    content: {
                        content: accessEdit, //传递的组件对象
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