<template>
    <div class="content-block">
        <div class="warp-block">

          <template>
            <el-table
                :data="tableData"
                border
                style="width: 100%">
              <el-table-column
                  fixed
                  prop="name"
                  label="姓名"
                  width="150">
              </el-table-column>
              <el-table-column
                  prop="phone"
                  label="电话"
                  width="120">
              </el-table-column>
              <el-table-column
                  prop="wechat"
                  label="微信"
                  width="120">
              </el-table-column>
              <el-table-column
                  prop="content"
                  label="留言内容"
                  width="500">
              </el-table-column>

              <el-table-column
                  prop="created_at"
                  label="创建时间"
                  width="180">
              </el-table-column>

              <el-table-column
                  fixed="right"
                  label="操作"
                  width="100">
                <template slot-scope="scope">
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
    export default {
        data () {
            return {
              pid:"",

            }
        },
        created(){
          this.pid=this.$route.params.id
          this.getCommentList();
        },
        computed:{
            ...mapState({
                tableData:state => state.comment.commentList
            })

        },

        watch: {
          $route(){
            this.pid=this.$route.params.id
            this.getCommentList();
          }
        },
        mounted() {
          console.log(this.$route.params.id);
        },
        methods: {
            ...mapActions("comment",["getCommentList","delComment"]),
            handleDelete(row) {
                this.$layer.confirm("删除后不可恢复，确定删除吗？",(layerid)=>{
                    this.delComment(row).then(res=>{
                        this.getCommentList();
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