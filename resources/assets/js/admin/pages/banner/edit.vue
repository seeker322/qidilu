<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="100px">
            <el-form-item label="标题" >
                <el-input v-model="form.title" placeholder="请输入标题"></el-input>
            </el-form-item>
            <el-form-item label="PC端图片">
              <el-upload
                  class="avatar-uploader"
                  action="/admin/uploadImg"
                  :headers="headers"
                  :show-file-list="false"
                  :on-success="handleCoverSuccess"
                  >
                <img v-if="form.img" :src="$config.img_url+form.img" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
            <el-form-item label="移动端图片">
              <el-upload
                  class="avatar-uploader"
                  action="/admin/uploadImg"
                  :headers="headers"
                  :show-file-list="false"
                  :on-success="handleMobileSuccess"
              >
                <img v-if="form.mobile_img" :src="$config.img_url+form.mobile_img" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>
            </el-form-item>
            <el-form-item label="超链接" >
              <el-input v-model="form.url" placeholder="请输入标题"></el-input>
            </el-form-item>
            <el-form-item label="排序" >
                <el-input v-model="form.sort" type="number"></el-input>
            </el-form-item>

            <el-form-item size="large">
                <el-button type="primary" size="small" @click="onSubmit">确定</el-button>
                <el-button size="small" @click="onCancel">取消</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    import {mapState,mapActions} from 'vuex';
    export default {
        name: "edit",
        props: ['info','layerid'],

        data() {
            return {
                headers: {
                  "X-CSRF-TOKEN":document.querySelector("meta[name='csrf-token']").getAttribute("content")
                },
                form: {
                    id:"",
                    title:"",
                    url:'',
                    img:"",
                    mobile_img:"",
                    sort:""
                },
            }
        },
        created(){

          console.log(process.env.MIX_IMG_URL);
        },
        computed:{

        },
        mounted() {
            // this.$layer.full(this.layerid);
          if(this.info){
            this.form=this.info;
          }


        },
        methods: {
            ...mapActions('banner', ['addBanner','editBanner','getBannerList']),

            handleCoverSuccess(res, file) {
              this.form.img =res.data;
            },
            handleMobileSuccess(res, file) {
              this.form.mobile_img =res.data;
            },
            onSubmit() {

                let params=this.form;
                if(this.info){ //编辑
                    this.editBanner(params).then(res=>{
                        this.getBannerList();
                        this.$layer.close(this.layerid);
                    });
                }else{ //新增
                    this.addBanner(params).then(res=>{
                      this.getBannerList();
                        this.$layer.close(this.layerid);
                    });
                }

            },
            onCancel(){
                this.$layer.close(this.layerid);
            }
        }
    }
</script>

<style lang="scss" >


</style>