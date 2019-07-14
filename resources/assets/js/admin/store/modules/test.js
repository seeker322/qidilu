import api from '../../api';
export default {
    namespaced:true,
    state: {
        cs: ""
    },
    mutations:{
        SetData(state,data){
            state.cs = data;
        },
    },
    actions:{
        index({commit},params){
            api.testurl(params).then( e => {
                console.log(e.data);
                commit('SetData',e.data);
            });
        }
    }
}
