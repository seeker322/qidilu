<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Single;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Admin\Permission;

class SingleController extends Controller
{
    //显示所有的用户
    public function index(Request $request)
    {

    }
    //显示创建用户的表单界面
    public function create(Request $request)
    {

    }
    //根据id显示对应的资源  user/{id}
    public function show($pid,Request $request){

        $single= Single::find($pid);
        if($single){
            $single=$single->toArray();
        }
        $permission=Permission::find($pid);
        $single['menu_icon']=$permission->menu_icon;
        $single['menu_hover_icon']=$permission->menu_hover_icon;
        return ["code"=>200,'data'=>$single,"msg"=>"获取成功"];
    }
    //根据id显示对应的资源编辑界面 {id}/edit
    public function edit($id,Request $request){

    }

    //根据id编辑对应的资源 user/{id}
    public function update($pid,Request $request){

        $single = Single::find($pid);
        if($single){
            $single->title=$request->input('title');
            $single->description=$request->input('description');
            $single->content=$this->replacePicUrl($request->input('content'));
            $single->cover_img=$request->input('cover_img');
            $single->sort=$request->input('sort');
            $single->save();
            $permission=Permission::find($pid);
            if($permission){
                $permission->menu_icon=$request->input('menu_icon');
                $permission->menu_hover_icon=$request->input('menu_hover_icon');
                $permission->save();
            }

            return ["code"=>200,"msg"=>"保存成功"];
        }else{
            return $this->store($request);
        }


    }
//    创建资源
    public function store(Request $request)
    {
        $data=[
            'title'=>$request->input('title'),
            'pid'=>$request->input('pid'),
            'description'=>$request->input('description'),
            'content'=>$this->replacePicUrl($request->input('content')),
            'cover_img'=>$request->input('cover_img'),
            'menu_icon'=>$request->input('menu_icon'),
            'sort'=>$request->input('sort'),
            'menu_hover_icon'=>$request->input('menu_hover_icon')
        ];

        Single::create($data);
        return ["code"=>200,"msg"=>"保存成功"];
    }

    public function replacePicUrl($content = null) {
        return preg_replace_callback('/<[img|IMG].*?src=[\'| \"](?![http|https])(.*?(?:[\.gif|\.jpg]))[\'|\"].*?[\/]?>/', function ($r) {
            if(!filter_var($r[1], FILTER_VALIDATE_URL, FILTER_FLAG_PATH_REQUIRED)){
                $str = env("APP_URL").$r[1];
            }else{
                $str = $r[1];
            }
            return str_replace($r[1], $str, $r[0]);
        }, $content);

    }

}
