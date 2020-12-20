import api from '../../api';
export default {
    namespaced:true,
    state: {

    },
    mutations:{

    },
    actions:{
        editSingle({commit},params){
            return new Promise((resolve, reject) => {
                api.editSingle(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        getSingleInfo({commit},params){
            return new Promise((resolve, reject) => {
                api.getSingleInfo(params).then(e => {
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