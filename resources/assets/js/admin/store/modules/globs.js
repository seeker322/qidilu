import api from '../../api';
export default {
    namespaced:true,
    state: {
        userInfo: ""
    },
    mutations:{
        SetUserInfo(state,data){
            state.userInfo=data;
        }
    },
    actions:{
        getUserInfo({commit},params){
            let userInfo=document.querySelector("meta[name='userinfo']").getAttribute("content");
            console.log(userInfo);
            commit('SetUserInfo',JSON.parse(userInfo));
        }
    }
}