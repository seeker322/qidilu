<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="100px">

            <el-form-item label="标题" >
                <el-input v-model="form.title" placeholder="请输入标题"></el-input>
            </el-form-item>
            <el-form-item label="图片">
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
            <el-form-item label="链接地址">
              <el-input v-model="form.url" placeholder="请输入链接地址"></el-input>
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
        name: "editCertificate",
        props: ['info','layerid'],

        data() {
            return {
                headers: {
                  "X-CSRF-TOKEN":document.querySelector("meta[name='csrf-token']").getAttribute("content")
                },
                form: {
                    id:"",
                    title:"",
                    sort:"",
                    url:"",
                    cover_img:""
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
            ...mapActions('webinfo', ['addCertificate','editCertificate']),
            handleCoverSuccess(res, file) {
              this.form.cover_img =res.data;
            },

            onSubmit() {
                let params=JSON.parse(JSON.stringify(this.form));
                if(this.info){ //编辑
                    this.editCertificate(params).then(res=>{

                        this.$parent.initWebInfo();
                        this.$layer.close(this.layerid);
                    });
                }else{ //新增
                    this.addCertificate(params).then(res=>{
                        this.$parent.initWebInfo();
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