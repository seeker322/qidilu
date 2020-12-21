import Vue from 'vue';
import Vuex from 'vuex';
import test from './modules/test'
import user from './modules/user'
import role from './modules/role'
import artical from './modules/artical'
import single from './modules/single'
import comment from './modules/comment'
import video from './modules/video'
import app from './modules/app'
import banner from './modules/banner'

import globs from './modules/globs'
import permission from './modules/permission'
Vue.use(Vuex)
export default new Vuex.Store({
    modules: {
        globs,
        banner,
        comment,
        video,
        test,
        single,
        artical,
        user,
        role,
        permission,
        app
    }
})