import api from '../../api';
export default {
    namespaced:true,
    state: {
        roles: []
    },
    mutations:{
        SetData(state,data){
        },
        SetRolesData(state,data){
            state.roles=data;
        },
    },
    actions:{

        getRoles({commit}){
             api.getRoles().then(e=>{
                commit('SetRolesData',e.data);
            });
        },
        addRole({commit},params){
            return new Promise((resolve, reject) => {
                api.addRole(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        editRole({commit},params){
            return new Promise((resolve, reject) => {
                api.editRole(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        delRole({commit},params){
            return new Promise((resolve, reject) => {
                api.delRole(params).then(e=>{
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