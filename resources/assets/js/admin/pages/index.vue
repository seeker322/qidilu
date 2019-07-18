<template>
    <div class="layout">
        <Layout>

            <Sider ref="side1" hide-trigger collapsible :collapsed-width="78" v-model="isCollapsed">
                <div class="slider-logo" :class="menuitemClasses">
                    <Icon type="md-settings"></Icon>
                    <span>后台</span>

                </div>
                <Menu active-name="1-2" theme="dark" width="auto" :open-names="['1']" :class="menuitemClasses">

                    <Submenu name="1">
                        <template slot="title">
                            <Icon type="ios-navigate"></Icon>
                            <span>Item 1</span>
                        </template>
                        <MenuItem name="1-1" >Option 1</MenuItem>
                        <MenuItem name="1-2">Option 2</MenuItem>
                        <MenuItem name="1-3">Option 3</MenuItem>
                    </Submenu>
                    <Submenu name="2">
                        <template slot="title">
                            <Icon type="ios-keypad"></Icon>
                            <span>Item 2</span>
                        </template>
                        <MenuItem name="2-1">Option 1</MenuItem>
                        <MenuItem name="2-2">Option 2</MenuItem>
                    </Submenu>
                    <Submenu name="3">
                        <template slot="title">
                            <Icon type="ios-analytics"></Icon>
                            <span>Item 3</span>
                        </template>
                        <MenuItem name="3-1">Option 1</MenuItem>
                        <MenuItem name="3-2">Option 2</MenuItem>
                    </Submenu>
                </Menu>
            </Sider>
            <Layout>
                <Header :style="{padding: 0}" class="layout-header-bar">
                    <div class="qi-header-menu">

                        <div class="qi-header-menu-icon"><Icon @click.native="collapsedSider" :class="rotateIcon" :style="{margin: '0 20px'}" type="md-menu" size="24"></Icon></div>
                        <div class="qi-header-menu-dropdwon">
                            <Dropdown trigger="click"  style="margin-left: 20px;">
                                <a href="javascript:void(0)" style="color:#999">
                                    Admin
                                    <Icon type="md-arrow-dropdown" />
                                </a>
                                <DropdownMenu slot="list">
                                    <DropdownItem>基本资料</DropdownItem>
                                    <DropdownItem>修改密码</DropdownItem>
                                    <DropdownItem divided>退出</DropdownItem>
                                </DropdownMenu>
                            </Dropdown>

                        </div>
                    </div>

                    
                </Header>

                <div class="layout-breadcrumb">
                    <Breadcrumb separator=">">
                        <Breadcrumb-item href="#">首页</Breadcrumb-item>
                        <Breadcrumb-item href="#">应用中心</Breadcrumb-item>
                        <Breadcrumb-item>某应用</Breadcrumb-item>
                    </Breadcrumb>
                </div>
                <Content :style="{margin: '15px 20px 10px 20px', background: '#fff', minHeight: '260px'}">
                    Content
                </Content>
                <div class="layout-copy">
                    2011-2016 &copy; TalkingData
                </div>
            </Layout>
        </Layout>
    </div>
</template>

<script>
    export default {
        data () {
            return {
                isCollapsed: false
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
            }
        },
        methods: {
            collapsedSider () {
                this.$refs.side1.toggleCollapse();
            }
        }
    }
</script>

<style lang="scss">
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
        padding: 10px 25px;
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
        width: 69px;
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
        padding: 10px 24px;
    }
    .ivu-menu.collapsed-menu{
        padding-top:14px;
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
</style>