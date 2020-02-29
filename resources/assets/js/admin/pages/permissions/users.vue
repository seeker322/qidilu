<template>
    <div>
        <i-button type="info">添加用户</i-button>
        <Table border :columns="columns1" :data="data1">

            <template slot-scope="{ row,index}" slot="action">

                <Icon type="ios-eye" @click="show(index)" />

                <Icon type="md-trash" @click="show(index)"/>


            </template>
        </Table>
    </div>

</template>
<script>
    export default {
        data () {
            return {
                columns1: [
                    {
                        title: 'id',
                        key: 'id'
                    },
                    {
                        title: '登录名',
                        key: 'name'
                    },

                    {
                        title: '加入时间',
                        key: 'time'
                    },
                    {
                        title: '是否启用',
                        key: 'role'
                    },
                    {
                        title: '操作',
                        slot: 'action',
                        key: 'action'
                    }
                ],
                data1: [
                    {
                        name: 'John Brown',
                        age: 18,
                        address: 'New York No. 1 Lake Park',
                        date: '2016-10-03'
                    },
                    {
                        name: 'Jim Green',
                        age: 24,
                        address: 'London No. 1 Lake Park',
                        date: '2016-10-01'
                    },
                    {
                        name: 'Joe Black',
                        age: 30,
                        address: 'Sydney No. 1 Lake Park',
                        date: '2016-10-02'
                    },
                    {
                        name: 'Jon Snow',
                        age: 26,
                        address: 'Ottawa No. 2 Lake Park',
                        date: '2016-10-04'
                    }
                ]
            }
        }
    }
</script>