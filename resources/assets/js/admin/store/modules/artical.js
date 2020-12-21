import api from '../../api';
export default {
    namespaced:true,
    state: {
        articalList: [],
        banner:"",
    },
    mutations:{
        setArticalList(state,data){
            state.articalList=data;

        },
        setBanner(state,data){
            state.banner=data;
        }
    },
    actions:{
        uploadArticalBanner({commit},params){
            return new Promise((resolve, reject) => {
                api.uploadArticalBanner(params).then(e => {
                    if(e.code=='200'){
                        commit('setBanner',params.banner);
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        addArtical({commit},params){
            return new Promise((resolve, reject) => {
                api.addArtical(params).then(e => {
                    if(e.code=='200'){

                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        editArtical({commit},params){
            return new Promise((resolve, reject) => {
                api.editArtical(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        delArtical({commit},params){
            return new Promise((resolve, reject) => {
                api.delArtical(params).then(e=>{
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        getArticalList({commit},params){
             api.getArticalList(params).then(e=>{

                commit('setArticalList',e.data.list);
                commit('setBanner',e.data.banner);
            });
        }
    }
}