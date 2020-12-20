<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\DownLoad;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DownLoadController extends Controller
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

        $single= DownLoad::find($pid);
        return ["code"=>200,'data'=>$single,"msg"=>"获取成功"];
    }
    //根据id显示对应的资源编辑界面 {id}/edit
    public function edit($id,Request $request){

    }

    //根据id编辑对应的资源 user/{id}
    public function update($pid,Request $request){

        $single = DownLoad::find($pid);
        if($single){
            $single->ios=$request->input('ios');
            $single->android=$request->input('android');
            $single->cover_img=$request->input('cover_img');
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

            'pid'=>$request->input('pid'),
            'ios'=>$request->input('ios'),
            'android'=>$request->input('android'),
            'cover_img'=>$request->input('cover_img'),
        ];

        DownLoad::create($data);
        return ["code"=>200,"msg"=>"保存成功"];
    }

}
