import api from '../../api';
export default {
    namespaced:true,
    state: {
        users: []
    },
    mutations:{
        SetData(state,data){

        },
        SetUsersData(state,data){
            state.users=data;
        },
    },
    actions:{
        addUser({commit},params){
            return new Promise((resolve, reject) => {
                api.userAdd(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        editUser({commit},params){
            return new Promise((resolve, reject) => {
                api.editUser(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        delUser({commit},params){
            api.delUser(params).then(e=>{
                if(e.code=='200'){
                    resolve(e);
                }else{
                    reject(e);
                }
            });
        },
        getUsers({commit}){
             api.getUsers().then(e=>{
                commit('SetUsersData',e.data);
            });
        }
    }
}