import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (location) {
    return originalPush.call(this, location).catch(err => err)
}
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
                {
                    name: 'pos',
                    path: '/pos/:id',
                    meta: {
                        title: '拉卡拉'
                    },
                    component: resolve => void(require(['../pages/artical/list.vue'], resolve))
                },
                {
                    name: 'info',
                    path: '/info/:id',
                    meta: {
                        title: '资讯相关'
                    },
                    component: resolve => void(require(['../pages/artical/list.vue'], resolve))
                },
                {
                    name: 'news',
                    path: '/news/:id',
                    meta: {
                        title: '新闻中心'
                    },
                    component: resolve => void(require(['../pages/artical/list.vue'], resolve))
                },
                {
                    name: 'company',
                    path: '/company/:id',
                    meta: {
                        title: '公司介绍'
                    },
                    component: resolve => void(require(['../pages/single/index.vue'], resolve))
                },
                {
                    name: 'channels',
                    path: '/channels/:id',
                    meta: {
                        title: '十大渠道'
                    },
                    component: resolve => void(require(['../pages/single/index.vue'], resolve))
                },
                {
                    name: 'comment',
                    path: '/comment',
                    meta: {
                        title: '留言'
                    },
                    component: resolve => void(require(['../pages/comment/list.vue'], resolve))
                },

                {
                    name: 'video',
                    path: '/video/:id',
                    meta: {
                        title: '拉卡拉'
                    },
                    component: resolve => void(require(['../pages/video/list.vue'], resolve))
                },
                {
                    name: 'app',
                    path: '/app/:id',
                    meta: {
                        title: '公司介绍'
                    },
                    component: resolve => void(require(['../pages/app/index.vue'], resolve))
                },
                {
                    name: 'banner',
                    path: '/banner',
                    meta: {
                        title: '轮播图'
                    },
                    component: resolve => void(require(['../pages/banner/list.vue'], resolve))
                }
            ]
        },

        {
            name: 'hello',
            path: '/test',
            component: resolve => void(require(['../components/TestComponent.vue'], resolve))
        }
    ]
});