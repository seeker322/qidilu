<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Comment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CommentController extends Controller
{
    //显示所有的用户
    public function index(Request $request)
    {
        $comment=Comment::get()->toArray();
        return ["code"=>200,"data"=>$comment];
    }
    //显示创建用户的表单界面
    public function create(Request $request)
    {

    }
    //根据id显示对应的资源  user/{id}
    public function show($pid,Request $request){


    }
    //根据id显示对应的资源编辑界面 {id}/edit
    public function edit($id,Request $request){

    }

    //根据id编辑对应的资源 user/{id}
    public function update($pid,Request $request){



    }
//    创建资源
    public function store(Request $request)
    {
        $data=[
            'name'=>$request->input('name'),
            'phone'=>$request->input('phone'),
            'content'=>$request->input('content'),
            'wechat'=>$request->input('wechat')
        ];

        Comment::create($data);
        return ["code"=>200,"msg"=>"保存成功"];
    }

    //根据id删除对应的资源 user/{id}
    public function destroy($id,Request $request){
        Comment::destroy($id);
        return ["code"=>200,"msg"=>"删除成功"];
    }

}
