<template>
    <div class="control-board">
      <div class="block-title" ><span>首页SEO设置</span></div>
      <el-form >
        <el-form-item label="">
          <el-input type="input" v-model="title" placeholder="请设置标题"></el-input>
          <el-input type="textarea" style="margin-top:10px;" v-model="description" placeholder="请设置描述"></el-input>
          <el-button type="primary" style="margin-top:15px;margin-bottom:20px;" @click="setSeo">保存</el-button>
        </el-form-item>
      </el-form>
      <div class="block-title" ><span>搜索热词设置(逗号分隔)</span></div>
      <el-form >
        <el-form-item label="">
          <el-input type="textarea" v-model="search_key"></el-input>
          <el-button type="primary" style="margin-top:15px;margin-bottom:20px;" @click="saveKey">保存</el-button>
        </el-form-item>
      </el-form>
      <div class="block-title"><span>首页视频设置</span></div>
      <el-form label-position="top">
        <el-form-item label="">
          <el-row :gutter="10">
            <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
              <el-input v-model="video" placeholder="视频地址"></el-input>
            </el-col>
          </el-row>
          <el-row :gutter="10" style="margin-top:20px;">
            <el-col :xs="8" :sm="8" :md="8" :lg="8" :xl="8">
              <el-upload
                  class="avatar-uploader"
                  action="/admin/uploadImg"
                  :headers="headers"
                  :show-file-list="false"
                  :on-success="handleCoverSuccess"
              >
                <img v-if="cover_img" :src="$config.img_url+cover_img" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-col>
          </el-row>
          <el-row :gutter="10">
            <el-col :xs="8" :sm="8" :md="8" :lg="8" :xl="8"><el-button type="primary" @click="saveWebVideo">保存</el-button></el-col>
          </el-row>
        </el-form-item>
        <div class="block-title" style="margin-top:22px;"><span>首页图片新闻推荐</span></div>
        <el-form-item label="">
          <el-table
              :data="recommendList"
              border
              style="width: 100%">
            <el-table-column
                fixed
                label="标题"
                width="300">
              <template slot-scope="scope">
                <div style="width: 100%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">{{scope.row.title}}</div>
              </template>
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
                   <el-button type="text" size="small" @click="handleCancel(scope.row)">取消推荐</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
        <div class="block-title"><span>首页证书管理</span><el-button type="primary" style="margin-left:10px;" @click="addCertificate">新增</el-button></div>
        <el-table
            :data="certificates"
            border
            style="width: 100%">
          <el-table-column
              fixed
              prop="title"
              label="标题"
              width="300">
          </el-table-column>
          <el-table-column
              prop="sort"
              label="排序"
              width="120">
          </el-table-column>
          <el-table-column
              label="图片"
             >
            <template slot-scope="scope">
              <img :src="scope.row.cover_img" style="height:50px;" alt="">
            </template>
          </el-table-column>
          <el-table-column
              prop="created_at"
              label="创建时间"
              >
          </el-table-column>
          <el-table-column
              prop="updated_at"
              label="修改时间"
              >
          </el-table-column>
          <el-table-column
              fixed="right"
              label="操作"
              width="100">
            <template slot-scope="scope">
                <el-button @click="editCertificate(scope.row)" type="text" size="small">编辑</el-button>
                <el-button type="text" size="small" @click="delCertificateHandle(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="block-title"><span>首页合作伙伴管理</span><el-button type="primary" style="margin-left:10px;" @click="addPartner">新增</el-button></div>
        <el-table
            :data="partners"
            border
            style="width: 100%">
          <el-table-column
              fixed
              prop="title"
              label="标题"
              width="300">
          </el-table-column>
          <el-table-column
              prop="sort"
              label="排序"
              width="120">
          </el-table-column>
          <el-table-column
              label="图片"
             >
              <template slot-scope="scope">
                <img :src="scope.row.cover_img" style="height:50px;" alt="">
              </template>
          </el-table-column>
          <el-table-column
              prop="created_at"
              label="创建时间"
              >
          </el-table-column>
          <el-table-column
              prop="updated_at"
              label="修改时间"
              >
          </el-table-column>
          <el-table-column
              fixed="right"
              label="操作"
              width="100">
            <template slot-scope="scope">
              <el-button @click="editPartner(scope.row)" type="text" size="small">编辑</el-button>
              <el-button type="text" size="small" @click="delPartnerHandle(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-form>


    </div>
</template>

<script>
    import {mapState,mapActions} from 'vuex';
    import editCertificate from "./editCertificate";
    import editPartner from "./editPartner";

    export default {
        name: "control-board",
        data() {
          return {
            headers: {
              "X-CSRF-TOKEN":document.querySelector("meta[name='csrf-token']").getAttribute("content")
            },
            recommendList:[],
            video:"",
            cover_img:"",//视频封面图
            search_key:"",
            tableData:[],
            certificates:[],
            partners:[],
            title:"",
            description:""
          }
        },
        created() {
          this.initWebInfo();
        },
        methods: {
          ...mapActions('webinfo', ['editArtical','getWebInfo','saveVideo','delCertificate','delPartner','saveSearchKey','saveSeo']),
          handleCoverSuccess(res, file) {
            this.cover_img =res.data;
          },
          initWebInfo(){
            this.getWebInfo().then(res=>{

              this.recommendList=res.data.recommendList;
              this.video=res.data.video.video;
              this.cover_img=res.data.video.cover_img;
              this.certificates=res.data.certificates;
              this.partners=res.data.partners;
              this.search_key=res.data.video.search_key;
              this.title=res.data.video.title;
              this.description=res.data.video.description;
            });
          },

          setSeo(){
            let data={
              title:this.title,
              description:this.description
            }
            this.saveSeo(data).then(res=>{
              if(res.code==200){
                this.$message(res.msg)
              }
            })
          },
          saveKey(){
            let data={
              search_key:this.search_key
            }
            this.saveSearchKey(data).then(res=>{
              if(res.code==200){
                this.$message(res.msg)
              }
            })
          },
          saveWebVideo(){
            let data={
              video:this.video,
              cover_img:this.cover_img
            }
            this.saveVideo(data).then(res=>{
              if(res.code==200){
                this.$message(res.msg)
              }
            })
          },
          handleCancel(e){
            e.recommend=0;
            this.editArtical(e).then(res=>{
              if(res.code==200){
                this.$message("取消成功")
                this.initWebInfo();
              }
            });
          },
          editCertificate(row) {
            let layer=this.$layer.iframe({
              content: {
                content: editCertificate, //传递的组件对象
                parent: this,//当前的vue对象
                data: {info:row,pid:this.pid}//props
              },
              area:['800px','600px'],
              shade: true,//是否显示遮罩
              title: '编辑',
              maxmin: true,
              shadeClose: false
            });
          },
          addCertificate(){
            let layer=this.$layer.iframe({
              content: {
                content: editCertificate, //传递的组件对象
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
          delCertificateHandle(row) {
            this.$layer.confirm("删除后不可恢复，确定删除吗？",(layerid)=>{
              this.delCertificate(row).then(res=>{
                this.initWebInfo();
                this.$layer.close(layerid);
              });
            })
          },
          editPartner(row) {
            let layer=this.$layer.iframe({
              content: {
                content: editPartner, //传递的组件对象
                parent: this,//当前的vue对象
                data: {info:row,pid:this.pid}//props
              },
              area:['800px','600px'],
              shade: true,//是否显示遮罩
              title: '编辑',
              maxmin: true,
              shadeClose: false
            });
          },

          addPartner(){
            let layer=this.$layer.iframe({
              content: {
                content: editPartner, //传递的组件对象
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
          delPartnerHandle(row) {
            this.$layer.confirm("删除后不可恢复，确定删除吗？",(layerid)=>{
              this.delPartner(row).then(res=>{
                this.initWebInfo();
                this.$layer.close(layerid);
              });
            })

          },
        }

    }
</script>

<style lang="scss" scoped>
.control-board{
  .el-form-item{
    margin-bottom:0px;
  }
  .el-table{
    margin-bottom:22px;
  }
  .block-title{
    display: flex;
    padding:10px 0px 10px 0px;
    margin-bottom:20px;
    width: 100%;
    font-size:18px;
    justify-content: space-between;
    align-content: center;
    align-items: center;
    border-bottom:1px solid #ddd;
  }

}
</style>