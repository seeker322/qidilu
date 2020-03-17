import Vue from 'vue';
import Vuex from 'vuex';
import test from './modules/test'
import user from './modules/user'
import role from './modules/role'
import permission from './modules/permission'
Vue.use(Vuex)
export default new Vuex.Store({
    modules: {
        test,
        user,
        role,
        permission
    }
})