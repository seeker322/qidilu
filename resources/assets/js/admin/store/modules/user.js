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
            api.userAdd(params).then(e => {
                // commit('SetData',e.data);
            });
        },
        getUsers({commit}){
             api.getUsers().then(e=>{
                commit('SetUsersData',e.data);
            });
        }
    }
}