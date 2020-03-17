<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Permission;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PermissionController extends Controller
{
    public function index(Request $request)
    {
        $permission=Permission::with("roles")->get();
        return ["code"=>200,"data"=>$permission];
    }

    public function create(Request $request)
    {


    }

    public function update($id,Request $request){

        $this->validate($request,[
            'name'=>'required',
            'display_name'=>'required',
            'description'=>'required',
            'controller' => 'required',
            'roles'=>"array|min:1"
        ],[
            'name.required'=>'权限标识必填',
//            'name.unique'=>'权限标识已存在',
            'display_name.required'=>'权限名称必填',
            'description.required'=>'权限描述必填',
            'controller.required'=>'控制器操作必填',
//            'controller.unique'=>'控制器操作已存在',
            "roles.min"=>'请选择权限所属角色'
        ]);
        $permission = Permission::find($id);
        $permission->name=$request->input('name');
        $permission->display_name=$request->input('display_name');
        $permission->description=$request->input('description');
        $permission->controller=$request->input('controller');
        $permission->save();
        $permission->roles()->sync($request->input('roles'));
        return ["code"=>200,"msg"=>"修改成功"];

    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required|unique:admin_permissions,name',
            'display_name'=>'required',
            'description'=>'required',
            'controller' => 'required|unique:admin_permissions,controller',
            'roles'=>"array|min:1"
        ],[
            'name.required'=>'权限标识必填',
            'name.unique'=>'权限标识已存在',
            'display_name.required'=>'权限名称必填',
            'description.required'=>'权限描述必填',
            'controller.required'=>'控制器操作必填',
            'controller.unique'=>'控制器操作已存在',
            "roles.min"=>'请选择权限所属角色'
        ]);
        $permission =Permission::create([
            'name' => $request->input('name'),
            'display_name' => $request->input('display_name'),
            'description' => $request->input('description'),
            'controller' => $request->input('controller'),
        ]);
        $permission->roles()->attach($request->input('roles'));
        return ["code"=>200,"msg"=>"新增成功"];

    }

    public function destroy($id,Request $request){
        $permission = Permission::find($id);
        $permission->roles()->detach();
        $permission::destroy($id);
        return ["code"=>200,"msg"=>"删除成功"];
    }
}
