import api from '../../api';
export default {
    namespaced:true,
    state: {
        videoList: []
    },
    mutations:{
        setVideoList(state,data){
            state.videoList=data;
        }
    },
    actions:{
        addVideo({commit},params){
            return new Promise((resolve, reject) => {
                api.addVideo(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        editVideo({commit},params){
            return new Promise((resolve, reject) => {
                api.editVideo(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        delVideo({commit},params){
            return new Promise((resolve, reject) => {
                api.delVideo(params).then(e=>{
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        getVideoList({commit},params){
             api.getVideoList(params).then(e=>{
                commit('setVideoList',e.data);
            });
        }
    }
}