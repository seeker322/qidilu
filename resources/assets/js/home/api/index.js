import axios from 'axios'
//前缀
axios.defaults.baseURL = '/';
//接口列表
const API = {
    testurl: (params) => {
        return axios.get('/test',params);
    }
}


export default API;
