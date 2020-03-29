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
                    path: '/control-board',
                    name: '/control-board',
                    meta: {
                        title: '控制台'
                    },
                    component: resolve => void(require(['../pages/index/index.vue'], resolve)),
                },
                {
                    path: '/article',
                    name: '/article',
                    meta: {
                        title: '内容管理'
                    },
                    component: resolve => void(require(['../pages/article/index.vue'], resolve)),
                },
                {
                    path: '/system',
                    name: '/system',
                    meta: {
                        title: '系统管理'
                    },
                    component: resolve => void(require(['../pages/system/index.vue'], resolve)),
                },
                {
                    name: 'permissions',
                    path: '/permissions',
                    meta: {
                        title: '权限管理'
                    },
                    component: resolve => void(require(['../pages/permissions/permission.vue'], resolve))
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