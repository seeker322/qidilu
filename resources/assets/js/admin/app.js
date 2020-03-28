
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */
// require('./bootstrap');
window.Vue = require('vue');
import store from './store'
import router from './router'
import VueRouter from 'vue-router';
import axios from 'axios';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import iView from 'iview';
import 'iview/dist/styles/iview.css';
Vue.use(iView);
Vue.use(ElementUI);
Vue.prototype.axios = axios;
Vue.use(VueRouter);
//vue-layer
import layer from 'vue-layer';
Vue.prototype.$layer = layer(Vue, {
    msgtime: 3,//目前只有一项，即msg方法的默认消失时间，单位：秒
});
import 'vue-layer/lib/vue-layer.css';
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    store,
    router
});
