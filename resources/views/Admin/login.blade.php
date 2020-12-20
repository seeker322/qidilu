<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/common/css/zui.css" media="all">
    <link rel="stylesheet" type="text/css" href="/common/css/login.css" media="all">
    <link href="/common/css/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="/common/js/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="/common/js/axios.min.js"></script>

    <style>
        /*body { background-image: url("/common/img/loginbg.jpg");}*/
        #app{width: 100%;height:100%;}
    </style>
</head>
<body>
<div id="app">
    <div id="main-box"></div>
    <div id="main-content">
        <div class="login-body">
            <div class="animated-block animated pulse">
                <div class="login-main pr ">
                    <form action="javascript:;" method="post" class="login-form">
                        <h3> 后台管理中心 </h3>
                        <h5 style="padding-bottom: 10px"> 请登录 </h5>
                        <!-- 账号登陆 -->
                        <div id="MobileBox" class="item-box"  >

                            {{--<el-button @click="visible = true">按钮</el-button>--}}
                            <div class="input-group user-name">
                                <el-input
                                        placeholder="账号"
                                        prefix-icon="el-icon-user"
                                        v-model="username">
                                </el-input>
                            </div>
                            <div class="input-group password">
                                <el-input
                                        placeholder="密码"
                                        prefix-icon="el-icon-lock"
                                        v-model="password">
                                </el-input>
                            </div>

                            <div>
                                <el-row type="flex" justify="space-between">
                                    <el-col :span="14">
                                        <el-input
                                                placeholder="验证码"
                                                prefix-icon="el-icon-key"
                                                v-model="captcha">
                                        </el-input>
                                    </el-col>
                                    <el-col :span="8" >
                                            <img style="width: 100%; height:100%;" :src="captchaSrc" @click="getCaptcha" style="cursor: pointer">
                                    </el-col>
                                </el-row>
                            </div>
                            <div class="login_btn_panel">
                                <div class=" btn btn-primary btn-block btn-lg" @click="submit">登录</div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    new Vue({
        el: '#app',
        data: function() {
            return {
                visible: false,
                username: '',
                password:"",
                captcha:"",
                captchaSrc:'{{captcha_src()}}'+Math.random()
            }
        },
        created() {
            axios.interceptors.response.use((response) => {

                    return response;
                },
                (error) => {

                    let message = error.response.data.message ? error.response.data.message : error.response.statusText
                    let dangerouslyUseHTMLString = false
                    // 错误代码 422，laravel validate返回

                    if (error.response.status === 422 && error.response.data.hasOwnProperty('errors')) {
                        for (let key in error.response.data.errors) {
                            let items = error.response.data.errors[key]
                            if (typeof items === 'string') {
                                message = `${items} `
                                break;
                            } else {
                                this.getCaptcha();
                                try {
                                    error.response.data.errors[key].forEach(item => {
                                        message=`${item}`;
                                        throw new Error(message);
                                    })
                                } catch (e) {
                                    this.$message.error(message);
                                    throw e;
                                    console.log(e);
                                }
                            }
                        }
                        this.$message.error(message);
                        dangerouslyUseHTMLString = true
                    }else{
                        const ERR_CODE_LIST = { //常见错误码列表
                            [400]: "请求错误",
                            [401]: "登录失效",
                            [403]: "拒绝访问",
                            [404]: "请求地址出错",
                            [408]: "请求超时",
                            [500]: "服务器内部错误",
                            [501]: "服务未实现",
                            [502]: "网关错误",
                            [503]: "服务不可用",
                            [504]: "网关超时",
                            [505]: "HTTP版本不受支持"

                        };
                        this.$message.error(ERR_CODE_LIST[error.response.status]);
                    }
                    return Promise.reject(error);
                }
            );
        },
        methods:{
           getCaptcha(){
               this.captchaSrc='{{captcha_src()}}'+Math.random()
           },

           submit() {
               var that=this;
               let data={
                   name: this.username,
                   password: this.password,
                   captcha:this.captcha,
               }
               // const params = new URLSearchParams();
               // params.append('name', this.username);
               // params.append('password', this.password);
               // params.append('captcha', this.captcha);
               axios({
                   method: 'post',
                   url: '/login',
                   data: data,
                   headers: {
                       'X-CSRF-TOKEN': '{{ csrf_token() }}',
                       // 'content-type': 'application/x-www-form-urlencoded'
                   }
               }).then(
                   function (e) {
                       if (e.status == 200 && e.data.code == 200) {
                           that.$message({
                               message: '登录成功',
                               type: 'success'
                           });
                           window.location.href = e.data.url;
                       }else{
                           that.$message({
                               message: '登录失败',
                               type: 'error'
                           });
                       }
                   }
               )


           }
        }
    })
</script>
</body>
</html>