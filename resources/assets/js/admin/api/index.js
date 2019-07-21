import axios from 'axios'
//前缀
axios.defaults.baseURL = '/admin';
//接口列表
const API = {
    testurl: (params) => {
        return axios.get('/test',params);
    }
}

// //异步请求返回统一处理
// axios.interceptors.response.use(
//     (response) => {
//       return response;
//     },
//     (err) => {
//
//         return Promise.reject(err);
//     }
// );
export default API;
