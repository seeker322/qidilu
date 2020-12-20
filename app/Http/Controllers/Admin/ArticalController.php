<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Artical;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ArticalController extends Controller
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
    public function show($id,Request $request){

        $articalLsit= Artical::where("pid",$id)->get()->toArray();

        return ["code"=>200,'data'=>$articalLsit,"msg"=>"修改成功"];
    }
    //根据id显示对应的资源编辑界面 {id}/edit
    public function edit($id,Request $request){

    }

    //根据id编辑对应的资源 user/{id}
    public function update($id,Request $request){
        $artical = Artical::find($id);
        $artical->title=$request->input('title');
        $artical->description=$request->input('description');
        $artical->content=$request->input('content');
        $artical->author=$request->input('author');
        $artical->origin=$request->input('origin');
        $artical->sort=$request->input('sort');
        $artical->cover_img=$request->input('cover_img');
        $artical->save();
        return ["code"=>200,"msg"=>"修改成功"];
    }
//    创建资源
    public function store(Request $request)
    {
        $data=[
            'title'=>$request->input('title'),
            'pid'=>$request->input('pid'),
            'description'=>$request->input('description'),
            'content'=>$request->input('content'),
            'author'=>$request->input('author'),
            'origin'=>$request->input('origin'),
            'sort'=>$request->input('sort'),
            'cover_img'=>$request->input('cover_img'),
        ];

        Artical::create($data);

        return ["code"=>200,"msg"=>"新增成功"];
    }
    //根据id删除对应的资源 user/{id}
    public function destroy($id,Request $request){
        Artical::destroy($id);
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
