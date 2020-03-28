<template>
    <div class="content-block">

        <div class="warp-block">
            <div class="operate">
                <el-button size="small" @click="addPermisson()" type="primary">添加菜单</el-button>
            </div>
            <el-table
                    :data="tableData"
                    height="400"
                    border
                    size="mini"
                    style="width: 100%"
                    :default-expand-all="true"
                    row-key="id"
                    :tree-props="{children: 'child', hasChildren: 'hasChildren'}">

                <el-table-column
                        prop="name"
                        label="权限名称">
                    <template slot-scope="scope">
                        <span v-html="getName(scope.row)"></span>
                    </template>
                </el-table-column>
<!--                <el-table-column-->
<!--                        prop="id"-->
<!--                        label="id">-->
<!--                </el-table-column>-->
<!--                <el-table-column-->
<!--                        prop="pid"-->
<!--                        label="pid"-->
<!--                        width="180">-->
<!--                </el-table-column>-->
                <el-table-column
                        prop="icon"
                        label="图标"
                        width="180">
                </el-table-column>
                <el-table-column
                        prop="action"
                        label="菜单规则">
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
                                @click="handleEdit(scope.row)">编辑</el-button>
                        <el-button
                                size="mini"
                                type="danger"
                                @click="handleDelete(scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </el-table>

        </div>
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
            getName(row){
                let name="";
                console.log(row.level);
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
            handleEdit(row) {
                this.$layer.iframe({
                    content: {
                        content: permissionEdit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {info:row}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '编辑',
                    shadeClose: false
                });
            },
            addPermisson(){
                this.$layer.iframe({
                    content: {
                        content: permissionEdit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {info:null}//props
                    },
                    area:['800px','500px'],
                    shade: true,//是否显示遮罩
                    title: '添加',
                    shadeClose: false
                });
            },
            handleDelete(row) {
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
    .el-table{
        .el-table_1_column_1{
            .cell{
                display: flex;
                flex-direction: row-reverse;
                justify-content:flex-end;
            }
        }
    }

    .warp-block{
        tag-group{
            margin-bottom:10px;
        }
        .box-card{
            margin-bottom:10px;
            .el-card__body{
                padding:5px 10px;
            }
            .el-card__header{
                background:#F2F6FC;
                padding:0px 10px;
                span{
                    &.title{
                        font-size:16px;
                        margin-right:10px;
                    }

                }
            }
            .item{
                display: flex;
                flex-direction: row;
                .item-list{
                    span{
                        &.title{
                            font-size:14px;
                            margin-right:10px;
                        }
                    }
                    margin-left:15px;
                }
            }
        }
        .tag-group__title{
            padding-left:10px;
            padding-right:10px;
            font-size:20px;
        }
    }
</style>