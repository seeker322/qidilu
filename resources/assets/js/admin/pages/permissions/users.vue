<template>
    <div class="content-block">
        <div class="operate">
            <el-button size="small" @click="addUser" type="primary">添加用户</el-button>
        </div>
        <el-table
                :data="userList"
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
                    label="用户角色"
                    width="180">
                <template slot-scope="scope">
                    <span v-for="(item,i) in scope.row.roles">
                        <template v-if="i< scope.row.roles.length-1">
                            {{item.name}} |
                        </template>
                        <template v-else>
                            {{item.name}}
                        </template>
                    </span>

                </template>
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="用户名">
            </el-table-column>
            <el-table-column
                    prop="email"
                    label="邮箱">
            </el-table-column>
            <el-table-column
                    prop="created"
                    label="创建时间">
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
    import usersEdit from './users-edit';
    import {mapState,mapActions} from 'vuex';
    export default {
        data () {
            return {

            }
        },
        created(){
            this.getUsers();
        },
        computed:{
            ...mapState({
                    userList:state => state.user.users
                }),
        },
        methods: {
            ...mapActions("user",['getUsers','delUser']),
            handleEdit(index, row) {

                this.$layer.iframe({
                    content: {
                        content: usersEdit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {info:row}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '添加应用',
                    shadeClose: false
                });
            },
            addUser(){
                this.$layer.iframe({
                    content: {
                        content: usersEdit, //传递的组件对象
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
                    this.delUser(row).then(res=>{
                        this.getUsers();
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