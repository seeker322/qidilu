import axios from 'axios'
import {Message,Loading} from 'element-ui'
//前缀
axios.defaults.baseURL = '/admin';
//接口列表
const API = {
    testurl: (params) => {
        return axios.get('/test',params);
    },
    userAdd:(params) => {
        return axios.post('/user',params);
    },
    editUser:(params)=>{
        return axios.patch(`/user/${params.id}`,params);
    },
    delUser:(params)=>{
        return axios.delete(`/user/${params.id}`,params);
    },
    getUsers:()=>{
        return axios.get('/user');
    },
    addPermission:(params) => {
        return axios.post('/permission',params);
    },
    editPermission:(params)=>{
        return axios.patch(`/permission/${params.id}`,params);
    },
    delPermission:(params)=>{
        return axios.delete(`/permission/${params.id}`,params);
    },
    getPermissions:()=>{
        return axios.get('/permission');
    },

    addRole:(params) => {
        return axios.post('/role',params);
    },
    editRole:(params)=>{
        return axios.patch(`/role/${params.id}`,params);
    },
    delRole:(params)=>{
        return axios.delete(`/role/${params.id}`,params);
    },
    getRoles:()=>{
        return axios.get('/role');
    },

    addArtical:(params) => {
        return axios.post('/artical',params);
    },
    editArtical:(params)=>{
        return axios.patch(`/artical/${params.id}`,params);
    },
    delArtical:(params)=>{
        return axios.delete(`/artical/${params.id}`,params);
    },
    getArticalList:(params)=>{
        return axios.get(`/artical/${params.pid}`);
    },

    uploadArticalBanner:(params) => {
        return axios.post('/articalBanner',params);
    },

    addBanner:(params) => {
        return axios.post('/banner',params);
    },
    editBanner:(params)=>{
        return axios.patch(`/banner/${params.id}`,params);
    },
    delBanner:(params)=>{
        return axios.delete(`/banner/${params.id}`,params);
    },
    getBannerList:(params)=>{
        return axios.get(`/banner`);
    },

    editSingle:(params)=>{
        return axios.patch(`/single/${params.pid}`,params);
    },

    getSingleInfo:(params)=>{
        return axios.get(`/single/${params.pid}`);
    },

    editApp:(params)=>{
        return axios.patch(`/download/${params.pid}`,params);
    },

    getAppInfo:(params)=>{
        return axios.get(`/download/${params.pid}`);
    },

    addComment:(params) => {
        return axios.post('/comment',params);
    },
    delComment:(params)=>{
        return axios.delete(`/comment/${params.id}`,params);
    },

    getCommentList:(params)=>{
        return axios.get(`/comment`);
    },

    //视频
    addVideo:(params) => {
        return axios.post('/video',params);
    },
    editVideo:(params)=>{
        return axios.patch(`/video/${params.id}`,params);
    },
    delVideo:(params)=>{
        return axios.delete(`/video/${params.id}`,params);
    },
    getVideoList:(params)=>{
        return axios.get(`/video/${params.pid}`);
    },


}

// //异步请求返回统一处理
axios.interceptors.response.use((response) => {

      return response.data;
    },
    (error) => {
        console.log(1111);
        let message = error.response.data.message ? error.response.data.message : error.response.statusText
        let dangerouslyUseHTMLString = false
        // 错误代码 422，laravel validate返回
        console.log(error);
        if (error.response.status === 422 && error.response.data.hasOwnProperty('errors')) {
            for (let key in error.response.data.errors) {
                let items = error.response.data.errors[key]
                if (typeof items === 'string') {
                    message = `${items} `
                    break;
                } else {
                    try {
                        error.response.data.errors[key].forEach(item => {
                            message=`${item}`;
                            throw new Error(message);
                        })
                    } catch (e) {
                        Message.error(message);
                        throw e;
                        console.log(e);
                    }
                }
            }
            Message.error(message);
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
            Message.error(ERR_CODE_LIST[error.response.status]);
        }
        return Promise.reject(error);
    }
);
export default API;
