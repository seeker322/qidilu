import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);

export default new VueRouter({
    saveScrollPosition: true,
    routes: [
        {
            name: 'index',
            path: '/',
            component: resolve => void(require(['../pages/index.vue'], resolve)),
            children: [
                {
                    path: '/index-main',
                    name: '/index-main',
                    meta: {
                        title: '首页'
                    },
                    component: resolve => void(require(['../pages/index/main.vue'], resolve)),
                },
                {
                    name: 'permissions',
                    path: '/permissions',
                    meta: {
                        title: '权限管理'
                    },
                    component: resolve => void(require(['../pages/permissions/access.vue'], resolve))
                },
                {
                    name: 'permissions-roles',
                    path: '/permissions-roles',
                    meta: {
                        title: '角色管理'
                    },
                    component: resolve => void(require(['../pages/permissions/roles.vue'], resolve))
                },
                {
                    name: 'permissions-users',
                    path: '/permissions-users',
                    meta: {
                        title: '用户管理'
                    },
                    component: resolve => void(require(['../pages/permissions/users.vue'], resolve))
                },
            ]
        },

        {
            name: 'hello',
            path: '/test',
            component: resolve => void(require(['../components/TestComponent.vue'], resolve))
        }
    ]
});