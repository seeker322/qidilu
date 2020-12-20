import api from '../../api';
export default {
    namespaced:true,
    state: {

    },
    mutations:{

    },
    actions:{
        editApp({commit},params){
            return new Promise((resolve, reject) => {
                api.editApp(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        getAppInfo({commit},params){
            return new Promise((resolve, reject) => {
                api.getAppInfo(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
    }
}