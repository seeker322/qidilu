<template>

    <el-container>
        <el-header  height="50px">
            <div class="qi-admin-header">
                <div class="qi-admin-left">LOGO</div>
                <div class="qi-admin-right">头部</div>
            </div>

        </el-header>
        <el-container>
            <el-aside width="200px">

                <el-menu
                        default-active="2"
                        class="el-menu-vertical-demo"
                        @open="handleOpen"
                        @close="handleClose"
                        background-color="#20222A"
                        text-color="#fff"
                        active-text-color="#ffd04b">
                    <el-submenu index="1">
                        <template slot="title">
                            <i class="el-icon-location"></i>
                            <span>导航一</span>
                        </template>
                        <el-menu-item-group>
                            <template slot="title">分组一</template>
                            <el-menu-item index="1-1">选项1</el-menu-item>
                            <el-menu-item index="1-2">选项2</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="分组2">
                            <el-menu-item index="1-3">选项3</el-menu-item>
                        </el-menu-item-group>
                        <el-submenu index="1-4">
                            <template slot="title">选项4</template>
                            <el-menu-item index="1-4-1">选项1</el-menu-item>
                        </el-submenu>
                    </el-submenu>
                    <el-menu-item index="2">
                        <i class="el-icon-menu"></i>
                        <span slot="title">导航二</span>
                    </el-menu-item>
                    <el-menu-item index="3">
                        <i class="el-icon-setting"></i>
                        <span slot="title">导航三</span>
                    </el-menu-item>
                </el-menu>

            </el-aside>
            <el-container>
                <el-breadcrumb separator-class="el-icon-arrow-right">
                    <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
                    <el-breadcrumb-item>活动管理</el-breadcrumb-item>
                    <el-breadcrumb-item>活动列表</el-breadcrumb-item>
                    <el-breadcrumb-item>活动详情</el-breadcrumb-item>
                </el-breadcrumb>
                <el-main>


                </el-main>
                <el-footer height="20px">Footer</el-footer>
            </el-container>
        </el-container>
    </el-container>

</template>

<script>
    export default {
        name: "index",

        methods: {
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            }
        }
    }
</script>

<style lang="scss">
    .el-header{
        color: #333;
        text-align: center;
        line-height: 50px;
        border-bottom: none;
        box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
        box-sizing: border-box;
        background-color: #fff;
        padding:0px;
    }

    .el-footer {
          color: #333;
          text-align: center;
          line-height: 20px;
          border-bottom: none;
          box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
          box-sizing: border-box;
          background-color: #fff;
      }

    .el-aside {
        background-color:rgba(32,34,42,.97);
        color: #333;
        text-align: center;
        line-height: 200px;
        .el-menu{
            border-right: solid 0px #e6e6e6;
        }
    }

    .el-main {
        background-color: #E9EEF3;
        color: #333;
        text-align: center;
        line-height: 160px;
    }

    #app > .el-container {
        height:100%;
    }

    .el-container:nth-child(5) .el-aside,
    .el-container:nth-child(6) .el-aside {
        line-height: 260px;
    }

    .el-container:nth-child(7) .el-aside {
        line-height: 320px;
    }
    .el-breadcrumb{
        padding:0 15px;
        height:50px;
        line-height:50px;
    }

    .qi-admin-header{
        display: flex;
        flex-direction: row;
        width: 100%;
        height:100%;
        justify-content: flex-start;
        .qi-admin-left{
            width: 200px;
            flex-shrink: 0;
            height:100%;

            background-color:rgba(32,34,42,.97);
            color: rgba(255,255,255,.8);
            box-shadow: 0 1px 2px 0 rgba(0,0,0,.15);
        }
        .qi-admin-right{
            width: 100%;
        }
    }
</style>