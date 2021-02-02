<template>
    <div class="layout">
        <Layout>

            <Sider :style="{width:'250px', maxWidth:'250px',flex: '0 0 250px', left: 0, overflow: 'auto'}" ref="side1" hide-trigger collapsible :collapsed-width="78" v-model="isCollapsed">
                <div class="slider-logo" :class="menuitemClasses">
<!--                    <Icon type="md-settings"></Icon>-->
                    <span>E汇客后台</span>

                </div>
                <Menu ref="side_menu" :active-name="activeId" theme="dark" width="auto" :open-names="[openId]" :class="menuitemClasses">
                    <template v-for="item in permissionList">
                        <template v-if="item.is_menu=='1'">
                            <template v-if="item.child.length>0">
                                <Submenu :name="item.id">
                                    <template slot="title">
                                        <Icon :type="item.icon"></Icon>
                                        <span>{{item.name}}</span>
                                    </template>
                                    <template v-for="itemone in item.child">
                                        <template v-if="itemone.is_menu=='1'" >
                                            <MenuItem :name="itemone.id" @click.native="setCurrentPageData(itemone)"  :to="'/'+(itemone.has_params?itemone.url+'/'+itemone.id:itemone.url)">{{itemone.name}}</MenuItem>
                                        </template>
                                    </template>
                                </Submenu>
                            </template>
                            <template v-else>
                                 <MenuItem :name="item.id" @click.native="setCurrentPageData(item)"  :to="'/'+(item.has_params?item.url+'/'+item.id:item.url)">
                                     <Icon :type="item.icon"></Icon>
                                     <span>{{item.name}}</span>
                                 </MenuItem>
<!--                                <Submenu :name="item.id">-->
<!--                                    <template slot="title">-->
<!--                                        <Icon :type="item.icon"></Icon>-->
<!--                                        <span>{{item.name}}</span>-->
<!--                                    </template>-->
<!--                                    -->
<!--                                </Submenu>-->
                            </template>

                        </template>

                    </template>
                </Menu>
            </Sider>
            <Layout>
                <Header :style="{padding: 0}" class="layout-header-bar">
                    <div class="qi-header-menu">

                        <div class="qi-header-menu-icon">

                          <Button type="text" style="font-size:20px;">{{curPageTitle}}</Button>
<!--                          <Icon @click.native="collapsedSider" :class="rotateIcon" :style="{margin: '0 20px'}" type="md-menu" size="24"></Icon>-->
                        </div>
                        <div class="qi-header-menu-dropdwon">
                            <Dropdown trigger="click"  style="margin-left: 20px;">
                                <a href="javascript:void(0)" style="color:#999">
                                    {{userInfo.name}}
                                    <Icon type="md-arrow-dropdown" />
                                </a>
                                <DropdownMenu slot="list">
                                    <DropdownItem>基本资料</DropdownItem>
                                    <DropdownItem>修改密码</DropdownItem>
                                    <DropdownItem divided ><div @click="loginOut">退出</div></DropdownItem>
                                </DropdownMenu>
                            </Dropdown>

                        </div>
                    </div>

                    
                </Header>

<!--                <div class="layout-breadcrumb">-->
<!--                    <el-breadcrumb separator-class="el-icon-arrow-right">-->
<!--                        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>-->
<!--                        <el-breadcrumb-item>活动管理</el-breadcrumb-item>-->
<!--                        <el-breadcrumb-item>活动列表</el-breadcrumb-item>-->
<!--                        <el-breadcrumb-item>活动详情</el-breadcrumb-item>-->
<!--                    </el-breadcrumb>-->
<!--                </div>-->
                <Content :style="{margin: '15px 20px 10px 20px', background: '#fff'}">
                    <router-view></router-view>
                </Content>
                <div class="layout-copy">
                    2011-2020
                </div>
            </Layout>
        </Layout>
    </div>
</template>

<script>
    import {mapState,mapActions} from 'vuex';
    export default {
        data () {
            return {
                isCollapsed: false,
                activeId:0,
                openId:0,
                curPageTitle:""
            }
        },
        created(){
            this.getPermissions().then(res=>{
                this.getActiveData(res);
            });
            this.getUserInfo();
            let curPageTitle=localStorage.getItem("curPageTitle");
            if(curPageTitle){
              this.curPageTitle=curPageTitle
            }else{
              localStorage.setItem("curPageTitle", "控制台");
              this.curPageTitle="控制台"

            }


        },
        computed: {
            rotateIcon () {
                return [
                    'menu-icon',
                    this.isCollapsed ? 'rotate-icon' : ''
                ];
            },
            menuitemClasses () {
                return [
                    'menu-item',
                    this.isCollapsed ? 'collapsed-menu' : ''
                ]
            },
            ...mapState({
                permissionList:state => state.permission.permissions,
                userInfo:state => state.globs.userInfo
            })
        },
        mounted(){
            this.getPermissions().then(res=>{
                this.getActiveData(res);
                this.$nextTick(()=>{
                    this.$refs.side_menu.updateOpened();
                    this.$refs.side_menu.updateActiveName()
                })
            });
        },
        methods: {
            ...mapActions("permission",["getPermissions"]),
            ...mapActions("globs",["getUserInfo"]),
            setCurrentPageData(item){
              localStorage.setItem("curPageTitle", item.name);
              this.curPageTitle= item.name
            },
            getActiveData(source){
                for (var key in source) {
                    if('/'+source[key].url==this.$route.path){
                        this.activeId=source[key].id;
                        this.openId=source[key].pid;
                        console.log(this.openId);
                    }
                    if (source[key].child) {
                        this.getActiveData(source[key].child)
                    }
                }
            },
            collapsedSider () {
                this.$refs.side1.toggleCollapse();
            },
            loginOut(){
                var that=this;
                this.axios({
                    method: 'get',
                    url: '../loginOut',
                    data: "",
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    }
                }).then((e)=>{
                          console.log(e);
                        if ( e.code == 200){
                            this.$Message.success(e.msg);
                            window.location.href = "/login";
                        }else{
                            this.$Message.error(e.msg);
                        }
                    }
                )
            }


        }
    }
</script>

<style lang="scss">
    .ivu-menu-submenu{
        .ivu-menu-item{
            padding-left:52px !important;
        }
    }
    .ivu-menu-item-selected{
        border-right: none;
        color: #fff !important;
        background: #2d8cf0!important;
    }
    .layout{
        border: 1px solid #d7dde4;
        background: #f5f7f9;
        position: relative;
        border-radius: 4px;
        overflow: hidden;
        height:100%;
        .ivu-layout{

            height:100%;
        }
    }
    .layout-breadcrumb{
        margin-top:1px;
        padding: 14px 25px;
        background-color: #fff;
        box-shadow: 0 1px 2px 0 rgba(0,0,0,.05);
    }
    .ivu-layout-sider{
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
    .ivu-layout-header{
        height:50px;
        line-height:50px;
    }
    .slider-logo{
        height:50px;
        line-height:50px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
        box-sizing: border-box;
        font-size:18px;
        text-align: center;
        color: rgba(255,255,255,.7);
        margin-bottom:1px;
    }
    .layout-header-bar{
        background: #fff;
        box-shadow: 0 1px 1px rgba(0,0,0,.1);
    }
    .layout-logo-left{
        width: 90%;
        height: 30px;
        background: #5b6270;
        border-radius: 3px;
        margin: 15px auto;
    }
    .menu-icon{
        transition: all .3s;
    }
    .rotate-icon{
        transform: rotate(-90deg);
    }
    .menu-item span{
        display: inline-block;
        overflow: hidden;
        width: 120px;
        text-overflow: ellipsis;
        white-space: nowrap;
        vertical-align: bottom;
        transition: width .2s ease .2s;
    }
    .menu-item i{
        transform: translateX(0px);
        transition: font-size .2s ease, transform .2s ease;
        vertical-align: middle;
        font-size: 16px;
    }

    .collapsed-menu span{
        width: 0px;
        transition: width .2s ease;
    }
    .ivu-menu-vertical.collapsed-menu .ivu-menu-submenu-title{
        padding:0px 24px;
    }
    .ivu-menu-vertical .ivu-menu-item, .ivu-menu-vertical .ivu-menu-submenu-title{
        padding: 14px 24px;
    }
    .ivu-menu.collapsed-menu{
        padding-top:14px;
    }
    .ivu-layout-content{
      height:auto;
      min-height: auto;
    }
    .collapsed-menu{
        .ivu-icon-ios-arrow-down:before,.ivu-icon-ios-arrow-up:before{
            display: none;
        }
        ul{
            display:none;
        }
    }
    .collapsed-menu i{
        transform: translateX(5px);
        transition: font-size .2s ease .2s, transform .2s ease .2s;
        vertical-align: middle;
        font-size: 22px;
    }
    .layout-copy{
        text-align: center;
        padding: 0px 0 0px;
        color: #9ea7b4;
    }
    .qi-header-menu{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        .qi-header-menu-dropdwon{
            margin-right: 25px;
        }
    }

    .avatar-uploader .el-upload {
      border: 1px dashed #d9d9d9;
      border-radius: 6px;
      cursor: pointer;
      position: relative;
      overflow: hidden;

    }
    .avatar-uploader .el-upload:hover {
      border-color: #409EFF;
    }
    .avatar-uploader-icon {
      font-size: 28px;
      color: #8c939d;
      width: 178px;
      height: 178px;
      line-height: 178px;
      text-align: center;
    }
    .avatar {
      width: 178px;
      height: 178px;
      display: block;
      object-fit: contain;

    }
</style>