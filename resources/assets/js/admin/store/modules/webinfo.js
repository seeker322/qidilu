import api from '../../api';
export default {
    namespaced:true,
    state: {
        webInfo: {},

    },
    mutations:{
        setArticalList(state,data){
            state.webInfo=data;
        }
    },
    actions:{
        editArtical({commit},params){
            return new Promise((resolve, reject) => {
                api.editArtical(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        getWebInfo({commit},params){
            return new Promise((resolve, reject) => {
                api.getWebInfo(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },

        saveVideo({commit},params){
            return new Promise((resolve, reject) => {
                api.saveVideo(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },

        saveSeo({commit},params){
            return new Promise((resolve, reject) => {
                api.saveSeo(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },


        saveSearchKey({commit},params){
            return new Promise((resolve, reject) => {
                api.saveSearchKey(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },


        setWebVideo({commit},params){
            return new Promise((resolve, reject) => {
                api.getWebInfo(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },


        addPartner({commit},params){
            return new Promise((resolve, reject) => {
                api.addPartner(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        editPartner({commit},params){
            return new Promise((resolve, reject) => {
                api.editPartner(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        addCertificate({commit},params){
            return new Promise((resolve, reject) => {
                api.addCertificate(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        editCertificate({commit},params){
            return new Promise((resolve, reject) => {
                api.editCertificate(params).then(e => {
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }

                });
            })
        },
        delCertificate({commit},params){
            return new Promise((resolve, reject) => {
                api.delCertificate(params).then(e=>{
                    if(e.code=='200'){
                        resolve(e);
                    }else{
                        reject(e);
                    }
                });
            })
        },
        delPartner({commit},params){
            return new Promise((resolve, reject) => {
                api.delPartner(params).then(e=>{
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