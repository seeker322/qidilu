<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Banner;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BannerController extends Controller
{
    //显示所有的用户
    public function index(Request $request)
    {
        $bannerLsit= Banner::get()->toArray();

        return ["code"=>200,'data'=>$bannerLsit,"msg"=>"修改成功"];
    }
    //显示创建用户的表单界面
    public function create(Request $request)
    {

    }
    //根据id显示对应的资源  user/{id}
    public function show($id,Request $request){


    }
    //根据id显示对应的资源编辑界面 {id}/edit
    public function edit($id,Request $request){

    }

    //根据id编辑对应的资源 user/{id}
    public function update($id,Request $request){
        $banner = Banner::find($id);
        $banner->title=$request->input('title');
        $banner->img=$request->input('img');
        $banner->sort=$request->input('sort');
        $banner->url=$request->input('url');
        $banner->save();
        return ["code"=>200,"msg"=>"修改成功"];
    }
//    创建资源
    public function store(Request $request)
    {
        $data=[
            'title'=>$request->input('title'),
            'img'=>$request->input('img'),
            'sort'=>$request->input('sort'),
            'url'=>$request->input('url')
        ];

        Banner::create($data);
        return ["code"=>200,"msg"=>"新增成功"];
    }
    //根据id删除对应的资源 user/{id}
    public function destroy($id,Request $request){
        Banner::destroy($id);
        return ["code"=>200,"msg"=>"删除成功"];
    }
}
