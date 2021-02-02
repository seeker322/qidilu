<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Artical;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Admin\Permission;

class ArticalController extends Controller
{
    //
    public function updateBanner(Request $request){
        $permission = Permission::where("id",$request->input('pid'))->first();
        $permission->banner=$request->input('banner');
        $permission->save();
        return ["code"=>200,"msg"=>"修改成功"];
    }
    //显示所有的用户
    public function index(Request $request)
    {

    }
    //显示创建用户的表单界面
    public function create(Request $request)
    {

    }

    public function getArticalInfo($id,Request $request){
        $articalInfo= Artical::find($id);
        return ["code"=>200,'data'=>$articalInfo,"msg"=>"获取成功"];
    }

    public function getSearchList(Request $request){

        $keyWord=$request->input('search_key');
        $list=Artical::where('title',$keyWord)->orWhere('title','like','%'.$keyWord.'%')
                ->get()->toArray();
        return ["code"=>200,'data'=>$list,"msg"=>"获取成功"];
    }

    public function getAllArtical($id,Request $request){

        $menu=Permission::where("pid",$id)->orderBy('sort','asc')->get()->toArray();
        $ids =array_column($menu,"id");
        $articalList=Artical::whereIn('pid',$ids)->orderBy('sort','asc')->get()->toArray();
        return ["code"=>200,'data'=>$articalList,"msg"=>"获取成功"];
    }

    //根据id显示对应的资源  user/{id}
    public function show($id,Request $request){

        $articalLsit= Artical::where("pid",$id)->orderBy('created_at','desc')->get()->toArray();
        $permission = Permission::where("id",$id)->first();
        $data=array(
            "list"=>$articalLsit,
            "banner"=>$permission->banner
        );
        return ["code"=>200,'data'=>$data,"msg"=>"获取成功"];
    }
    //根据id显示对应的资源编辑界面 {id}/edit
    public function edit($id,Request $request){

    }

    //根据id编辑对应的资源 user/{id}
    public function update($id,Request $request){
        $artical = Artical::find($id);
        $artical->title=$request->input('title');
        $artical->description=$request->input('description');
        $artical->content=$this->replacePicUrl($request->input('content'));
        $artical->author=$request->input('author');
        $artical->origin=$request->input('origin');
        $artical->sort=$request->input('sort');
        $artical->recommend=$request->input('recommend');
        $artical->cover_img=$request->input('cover_img');
        $artical->video_url=$request->input('video_url');
        $artical->save();
        return ["code"=>200,"data"=>$artical,"msg"=>"修改成功"];
    }
//    创建资源
    public function store(Request $request)
    {
        $data=[
            'title'=>$request->input('title'),
            'pid'=>$request->input('pid'),
            'description'=>$request->input('description'),
            'content'=>$this->replacePicUrl($request->input('content')),
            'author'=>$request->input('author'),
            'origin'=>$request->input('origin'),
            'sort'=>$request->input('sort'),
            'recommend'=>$request->input('recommend'),
            'video_url'=>$request->input('video_url'),
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
