<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Single;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

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
            $single->content=$request->input('content');
            $single->cover_img=$request->input('cover_img');
            $single->icon=$request->input('icon');
            $single->hover_icon=$request->input('hover_icon');
            $single->save();
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
            'content'=>$request->input('content'),
            'cover_img'=>$request->input('cover_img'),
            'icon'=>$request->input('icon'),
            'hover_icon'=>$request->input('hover_icon')
        ];

        Single::create($data);
        return ["code"=>200,"msg"=>"保存成功"];
    }

}
