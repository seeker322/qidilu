import api from '../../api';
export default {
    namespaced:true,
    state: {
        commentList: []
    },
    mutations:{
        setCommentList(state,data){
            state.commentList=data;
        }
    },
    actions:{
        addComment({commit},params){
            return new Promise((resolve, reject) => {
                api.addComment(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },

        delComment({commit},params){
            return new Promise((resolve, reject) => {
                api.delComment(params).then(e=>{
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        getCommentList({commit}){
             api.getCommentList().then(e=>{
                commit('setCommentList',e.data);
            });
        }
    }
}