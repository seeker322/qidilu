<template>
    <div class="iframe-block">
        <el-form ref="form" :model="form" label-width="100px">

            <el-form-item label="标题" >
                <el-input v-model="form.title" placeholder="请输入标题"></el-input>
            </el-form-item>
            <el-form-item label="描述">
              <el-input type="textarea" v-model="form.description" placeholder="请输入描述"></el-input>
            </el-form-item>
            <el-form-item label="作者">
              <el-input v-model="form.author" placeholder="请输入作者"></el-input>
            </el-form-item>
            <el-form-item label="来源">
              <el-input v-model="form.origin" placeholder="请输入来源"></el-input>
            </el-form-item>
            <el-form-item label="封面图">
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
            <el-form-item label="排序" >
                <el-input v-model="form.sort" type="number"></el-input>
            </el-form-item>
            <el-form-item label="内容" >
              <ckeditor v-model="form.content"></ckeditor>
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
        props: ['info','pid','layerid'],

        data() {
            return {
                headers: {
                  "X-CSRF-TOKEN":document.querySelector("meta[name='csrf-token']").getAttribute("content")
                },
                form: {
                    id:"",
                    title:"",
                    description:'',
                    content:"",
                    author:"",
                    origin:"",
                    sort:"",
                    cover_img:"",
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
            ...mapActions('artical', ['addArtical','editArtical','getArticalList']),

            handleCoverSuccess(res, file) {
              this.form.cover_img =res.data;
            },
            handleIconSuccess(res, file) {
              this.form.icon =res.data;
            },

            onSubmit() {
                this.form.pid=this.pid;
                let params=this.form;
                if(this.info){ //编辑
                    this.editArtical(params).then(res=>{
                        this.getArticalList({pid:this.pid});
                        this.$layer.close(this.layerid);
                    });
                }else{ //新增
                    this.addArtical(params).then(res=>{
                      this.getArticalList({pid:this.pid});
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