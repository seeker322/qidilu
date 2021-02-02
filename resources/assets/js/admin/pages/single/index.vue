<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form"  label-width="100px">

            <el-form-item label="标题" >
                <el-input v-model="form.title" placeholder="请输入标题"></el-input>
            </el-form-item>
            <el-form-item label="描述">
              <el-input type="textarea" v-model="form.description" placeholder="请输入描述"></el-input>
            </el-form-item>
            <div style="display: flex">
              <el-form-item label="banner图">
                <el-upload
                    class="avatar-uploader"
                    action="/admin/uploadImg"
                    :headers="headers"
                    :show-file-list="false"
                    :on-success="handleCoverSuccess"
                >
                  <img v-if="form.cover_img" :src="$config.img_url+form.cover_img" class="avatar">
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
              </el-form-item>
              <el-form-item label="icon图" style="margin-left:20px;">
                <el-upload
                    class="avatar-uploader"
                    action="/admin/uploadImg"
                    :headers="headers"
                    :show-file-list="false"
                    :on-success="handleIconSuccess"
                >
                  <img v-if="form.menu_icon" :src="$config.img_url+form.menu_icon" class="avatar">
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
              </el-form-item>
              <el-form-item label="鼠标经过icon" style="margin-left:20px;">
                <el-upload
                    class="avatar-uploader"
                    action="/admin/uploadImg"
                    :headers="headers"
                    :show-file-list="false"
                    :on-success="handleHoverIconSuccess"
                >
                  <img v-if="form.menu_hover_icon" :src="$config.img_url+form.menu_hover_icon" class="avatar">
                  <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
              </el-form-item>

            </div>
            <el-form-item label="排序" >
              <el-input v-model="form.sort" type="Number" placeholder="请输入排序"></el-input>
            </el-form-item>
            <el-form-item label="内容" >
              <ckeditor v-model="form.content"></ckeditor>
            </el-form-item>
            <el-form-item size="large">
                <el-button type="primary" size="small" @click="onSubmit">确定</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    import {mapState,mapActions} from 'vuex';
    export default {
        name: "edit",
        data() {
            return {
                headers: {
                  "X-CSRF-TOKEN":document.querySelector("meta[name='csrf-token']").getAttribute("content")
                },
                form: {
                    pid:"",
                    title:"",
                    description:'',
                    content:"",
                    cover_img:"",
                    sort:"",
                    menu_icon:"",
                    menu_hover_icon:""
                },
            }
        },
        created(){

          this.form.pid=this.$route.params.id

          this.getSingleInfo({pid:this.form.pid}).then(res=>{

            if(res.data){
              this.form=res.data
            }else{
              this.form={
                pid:"",
                    title:"",
                  description:'',
                  content:"",
                  cover_img:"",
                  menu_icon:"",
                  menu_hover_icon:""
              }
            }


          })
        },
        computed:{

        },
        watch: {
          $route(){
            this.form.pid=this.$route.params.id
            this.getSingleInfo({pid:this.form.pid}).then(res=>{
              if(res.data){
                this.form=res.data
              }else{
                this.form={
                  pid:"",
                  title:"",
                  description:'',
                  content:"",
                  cover_img:"",
                  menu_icon:"",
                  menu_hover_icon:""
                }
              }


            })
          }
        },
        mounted() {
            // this.$layer.full(this.layerid);
        },
        methods: {
            ...mapActions('single', ['getSingleInfo','editSingle']),

            handleCoverSuccess(res, file) {
              console.log(res);
              this.form.cover_img =res.data;
            },
            handleHoverIconSuccess(res, file) {
              this.form.menu_hover_icon =res.data;
            },
            handleIconSuccess(res, file) {
              this.form.menu_icon =res.data;
            },

            onSubmit() {
              this.form.pid=this.$route.params.id
              this.editSingle(this.form).then(res=>{
                this.$message(res.msg)

              });
            }

        }
    }
</script>

<style lang="scss" >


</style>