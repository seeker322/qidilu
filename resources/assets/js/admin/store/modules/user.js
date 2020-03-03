import api from '../../api';
export default {
    namespaced:true,
    state: {
        users: ""
    },
    mutations:{
        SetData(state,data){

        },
    },
    actions:{
        addUser({commit},params){
            api.userAdd(params).then(e => {
                // commit('SetData',e.data);
            });
        }
    }
}