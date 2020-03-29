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

        $role=Role::get();
        $roleArr=clone $role;
        $roleArr=$roleArr->toArray();
        $ids=$this->getLoopIds($roleArr,$id); //获取要删除的权限id数组
        array_push($ids,(int)$id);
        $delData = Role::whereIn('id', $ids)->with("roles")->get();
        foreach($delData as $v) {
            $v->roles()->detach(); //删除中间表数据
        }
        Role::destroy($ids);
        return ["code"=>200,"msg"=>"删除成功"];
//
//        $role = Role::find($id);
////        $role->roles()->detach();
//        $role::destroy($id);
//        return ["code"=>200,"msg"=>"删除成功"];
    }
}
