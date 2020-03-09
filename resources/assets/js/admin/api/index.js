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
    getUsers:()=>{
        return axios.get('/user');
    },
    getRoles:()=>{
        return axios.get('/role');
    },
    editUser:(params)=>{
        return axios.patch(`/user/${params.id}`,params);
    },
    delUser:(params)=>{
        return axios.delete(`/user/${params.id}`,params);
    }
}

// //异步请求返回统一处理
axios.interceptors.response.use((response) => {

      return response.data;
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
                [401]: "登录失效或在其他地方已登录",
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
