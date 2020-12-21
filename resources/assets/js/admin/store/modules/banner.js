import api from '../../api';
export default {
    namespaced:true,
    state: {
        bannerList: []
    },
    mutations:{
        setBannerList(state,data){
            state.bannerList=data;
        }
    },
    actions:{
        addBanner({commit},params){
            return new Promise((resolve, reject) => {
                api.addBanner(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        editBanner({commit},params){
            return new Promise((resolve, reject) => {
                api.editBanner(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        delBanner({commit},params){
            return new Promise((resolve, reject) => {
                api.delBanner(params).then(e=>{
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        getBannerList({commit},params){
             api.getBannerList(params).then(e=>{
                commit('setBannerList',e.data);
            });
        }
    }
}