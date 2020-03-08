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
            console.log(111);
             api.getRoles().then(e=>{
                commit('SetRolesData',e.data);
            });
        }
    }
}