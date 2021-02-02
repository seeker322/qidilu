<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Permission;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PermissionController extends Controller
{
    public function index(Request $request)
    {
        $permission=Permission::with("roles")->orderBy('sort','asc')->get()->toArray();
        $menu=$this->getLoopMenu($permission);
        return ["code"=>200,"data"=>$menu];
    }


    public function getPeerChannel($id,Request $request)
    {
        $channel=Permission::find($id);
        $pid=$channel->pid;
        $permission=Permission::orderBy('sort','asc')->get()->toArray();
        $menu=$this->getLoopMenu($permission,$pid);
        return ["code"=>200,"data"=>$menu];
    }

    public function getSonChannel($id,Request $request)
    {
        $permission=Permission::orderBy('sort','asc')->get()->toArray();
        $menu=$this->getLoopMenu($permission,$id);
        return ["code"=>200,"data"=>$menu];
    }



    public function getTenChannel()
    {
        $permission=Permission::orderBy('sort','asc')->get()->toArray();
        $menu=$this->getLoopMenu($permission,58);
        return ["code"=>200,"data"=>$menu];
    }


    public function create(Request $request)
    {


    }

    public function  getLoopMenu($data, $pid = 0,$level = 0)
    {
        $arr = [];

        foreach ($data as $v) {
            if($v["pid"]==$pid){
                $v['level'] = $level;
                $v["child"]=$this->getLoopMenu($data,$v["id"],$level+1);
                $arr[]=$v;
            }

        }
        return $arr;
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



    public function update($id,Request $request){
        $this->customValidate($request,2);
        $permission = Permission::find($id);
        $permission->pid=$request->input("pid")?$request->input("pid"):0;
        $permission->is_menu=$request->input("is_menu")?$request->input("is_menu"):0;
        $permission->name=$request->input('name');
        $permission->sort=$request->input('sort');
        $permission->icon=$request->input('icon');
        $permission->description=$request->input('description');
        $permission->action=$request->input('action');
        $permission->url=$request->input('url');
        //这两项在栏目单页设置
        $permission->menu_icon=$request->input('menu_icon');
        $permission->menu_hover_icon=$request->input('menu_hover_icon');
        $permission->has_params=(int)$request->input('has_params');
        $permission->save();
        $permission->roles()->sync($request->input('roles'));
        return ["code"=>200,"msg"=>"修改成功"];
    }

    public function store(Request $request)
    {
        $this->customValidate($request,1);
        $permission =Permission::create([
            'name' => $request->input('name'),
            'icon' => $request->input('icon'),
            'description' => $request->input('description'),
            'pid'=>empty($request->input("pid"))?0:$request->input("pid"),
            'url'=>$request->input('url'),
            'has_params'=>(int)$request->input('has_params'),
            'sort'=>empty($request->input("sort"))?0:$request->input("sort"),
            'is_menu'=>empty($request->input("is_menu"))?0:$request->input("is_menu"),
            'action'=>$request->input("action")
        ]);
        $permission->roles()->attach($request->input('roles'));
        return ["code"=>200,"msg"=>"新增成功"];
    }

    public function destroy($id,Request $request){
        $permission=Permission::get();
        $permissionArr=clone $permission;
        $permissionArr=$permissionArr->toArray();
        $ids=$this->getLoopIds($permissionArr,$id); //获取要删除的权限id数组
        array_push($ids,(int)$id);
        $delData = Permission::whereIn('id', $ids)->with("roles")->get();
        foreach($delData as $v) {
            $v->roles()->detach(); //删除中间表数据
        }
        Permission::destroy($ids);
        return ["code"=>200,"msg"=>"删除成功"];
    }

    public function customValidate($request,$tag){
        if(empty($request->input("action"))){ //应用及模块
            $this->validate($request,[
                'name'=>'required',
                'description'=>'required',
                'roles'=>"array|min:1"
            ],[
                'name.required'=>'标识必填',
                'description.required'=>'描述必填',
                "roles.min"=>'请选择权限所属角色'
            ]);
        }else{ //控制器及操作
            if($tag==1){  //1:新增，2：编辑
                $this->validate($request,[
                    'name'=>'required',
                    'description'=>'required',
//                    'action' => 'required|unique:admin_permissions,action',
                    'action' => 'required',
                    'roles'=>"array|min:1"
                ],[
                    'name.required'=>'标识必填',
                    'name.unique'=>'标识已存在',
                    'description.required'=>'描述必填',
                    'action.required'=>'操作规则必填',
//                    'action.unique'=>'操作规则已存在',
                    "roles.min"=>'请选择权限所属角色'
                ]);
            }else{
                $this->validate($request,[
                    'name'=>'required',
                    'description'=>'required',
                    "pid"=>'required',
                    'action' => 'required',
                    'roles'=>"array|min:1"
                ],[
                    'name.required'=>'标识必填',
                    'description.required'=>'描述必填',
                    'pid.required'=>'参数缺失',
                    'action.required'=>'操作规则必填',
                    "roles.min"=>'请选择权限所属角色'
                ]);
            }
        }

    }
}
