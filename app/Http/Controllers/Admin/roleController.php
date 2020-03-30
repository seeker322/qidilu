<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class roleController extends Controller
{
    //
    public function index(Request $request)
    {
        $role=Role::with("permissions")->get()->toArray();
        return ["code"=>200,"data"=>$role];
    }
    public function show($id,Request $request)
    {
//        $role=Role::with("permissions")->get()->toArray();
//        return ["code"=>200,"data"=>$role];
    }
    public function create(Request $request)
    {

    }
    public function update($id,Request $request){

        $this->validate($request,[
            'name'=>'required',
            'description'=>'required',
        ],[
            'name.required'=>'权限标识必填',
            'description.required'=>'权限描述必填',
//            "roles.min"=>'请选择权限所属角色'
        ]);
        $role = Role::find($id);
        $role->name=$request->input('name');
        $role->description=$request->input('description');
        $role->save();
        $role->permissions()->sync($request->input('permissions'));
        return ["code"=>200,"msg"=>"修改成功"];

    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required',
            'description'=>'required',
//            'roles'=>"array|min:1"
        ],[
            'name.required'=>'权限标识必填',
            'description.required'=>'权限描述必填',
//            "roles.min"=>'请选择权限所属角色'
        ]);
        $role =Role::create([
            'name' => $request->input('name'),
            'description' => $request->input('description'),
        ]);
        $role->permissions()->attach($request->input('permissions'));
        return ["code"=>200,"msg"=>"新增成功"];

    }

    public function destroy($id,Request $request){

        $role = Role::find($id);
        $role->permissions()->detach();
        $role::destroy($id);
        return ["code"=>200,"msg"=>"删除成功"];
    }

    //递归获取要删除的id数组
    public function  getLoopIds($data, $pid = 0,$level = 0)
    {
        static $list = [];
        foreach ($data as  $value){
            //第一次遍历,找到父节点为根节点的节点 也就是pid=0的节点
            if ($value['pid'] == $pid){
                //父节点为根节点的节点,级别为0，也就是第一级
                $value['level'] = $level;
                //把数组放到list中
                $list[] = $value['id'];
                //把这个节点从数组中移除,减少后续递归消耗
                //unset($array[$key]);  #尽量注释下这个
                //开始递归,查找父ID为该节点ID的节点,级别则为原级别+1
                $this->getLoopIds($data, $value['id'], $level+1);
            }
        }
        return $list;
    }
}
