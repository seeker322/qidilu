<template>
    <div class="content-block">
        <div class="warp-block">
            <div class="operate">
                <el-button size="small" @click="handleAdd()" type="primary">新增</el-button>
            </div>
          <template>
            <el-table
                :data="tableData"
                border
                style="width: 100%">
              <el-table-column
                  fixed
                  prop="title"
                  label="标题"
                  width="150">
              </el-table-column>
              <el-table-column
                  prop="author"
                  label="作者"
                  width="120">
              </el-table-column>
              <el-table-column
                  prop="origin"
                  label="来源"
                  width="120">
              </el-table-column>
              <el-table-column
                  prop="description"
                  label="描述"
                  width="200">
              </el-table-column>
              <el-table-column
                  prop="sort"
                  label="排序"
                  width="120">
              </el-table-column>
              <el-table-column
                  prop="created_at"
                  label="创建时间"
                  width="180">
              </el-table-column>
              <el-table-column
                  prop="updated_at"
                  label="修改时间"
                  width="180">
              </el-table-column>
              <el-table-column
                  fixed="right"
                  label="操作"
                  width="100">
                <template slot-scope="scope">
                  <el-button @click="handleEdit(scope.row)" type="text" size="small">编辑</el-button>
                  <el-button type="text" size="small" @click="handleDelete(scope.row)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
          </template>

        </div>

    </div>

</template>
<script>
    import {mapState,mapActions} from 'vuex';
    import edit from './edit';
    export default {
        data () {
            return {
              pid:"",

            }
        },
        created(){
          this.pid=this.$route.params.id
          this.getArticalList({pid:this.pid});
        },
        computed:{
            ...mapState({
                tableData:state => state.artical.articalList
            })

        },

        watch: {
          $route(){
            this.pid=this.$route.params.id
            this.getArticalList({pid:this.pid});
          }
        },
        mounted() {
          console.log(this.$route.params.id);
        },
        methods: {
            ...mapActions("artical",["getArticalList","delArtical"]),
            handleEdit(row) {
                this.$layer.iframe({
                    content: {
                        content: edit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {info:row,pid:this.pid}//props
                    },
                    area:['800px','600px'],
                    shade: true,//是否显示遮罩
                    title: '编辑',
                    shadeClose: false
                });
            },
            handleAdd(){
                this.$layer.iframe({
                    content: {
                        content: edit, //传递的组件对象
                        parent: this,//当前的vue对象
                        data: {info:null,pid:this.pid}//props
                    },
                    maxmin: true,
                    area:['800px',"600px"],
                    shade: true,//是否显示遮罩
                    title: '添加',
                    shadeClose: false
                });
            },
            handleDelete(row) {
                this.$layer.confirm("删除后不可恢复，确定删除吗？",(layerid)=>{
                    this.delArtical(row).then(res=>{
                        this.getArticalList({pid:this.pid});
                        this.$layer.close(layerid);
                    });
                })

            }
        }
    }
</script>
<style lang="scss" >
    .warp-block{
        margin-bottom:20px;
        .el-table{
            tr td:first-child{
                .cell{
                    display: flex;
                    flex-direction: row-reverse;
                    justify-content:flex-end;
                }
            }
        }

    }
</style>