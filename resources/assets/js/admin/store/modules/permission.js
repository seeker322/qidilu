import api from '../../api';
export default {
    namespaced:true,
    state: {
        permissions: []
    },
    mutations:{
        SetData(state,data){

        },
        SetPermissonsData(state,data){
            state.permissions=data;
        },
    },
    actions:{
        addPermission({commit},params){
            return new Promise((resolve, reject) => {
                api.addPermission(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        editPermission({commit},params){
            return new Promise((resolve, reject) => {
                api.editPermission(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        delPermission({commit},params){
            return new Promise((resolve, reject) => {
                api.delPermission(params).then(e=>{
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        getPermissions({commit}){
            api.getPermissions().then(e=>{
                commit('SetPermissonsData',e.data);
            });
        }
    }
}