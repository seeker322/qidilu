<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Artical;
use App\Models\Admin\WebInfo;
use App\Models\Admin\Certificate;
use App\Models\Admin\Partner;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class WebInfoController extends Controller
{



    public function index(){
        $articalLsit= Artical::where("recommend",1)->orderBy('created_at','desc')->get()->toArray();
        $video=WebInfo::first();
        $certificates=Certificate::orderBy('created_at','desc')->get()->toArray();
        $partners=Partner::orderBy('created_at','desc')->get()->toArray();

        if(!$video){
            $video=[];
        }
        $webInfo=array(
            "recommendList"=>$articalLsit,
            "video"=>$video,
            "certificates"=>$certificates,
            "partners"=>$partners
        );
        return ["code"=>200,'data'=>$webInfo,"msg"=>"获取成功"];
    }

    public function saveSeo(Request $request){

        $searchKey=WebInfo::first();

        if($searchKey){
            $searchKey->title=$request->input('title');
            $searchKey->description=$request->input('description');
            $searchKey->save();
        }else{
            $data=[
                'description'=>$request->input('description'),
                'title'=>$request->input('title')
            ];
            WebInfo::create($data);
        }

        //
        return ["code"=>200,"msg"=>"保存成功"];
    }
    public function setSearchKey(Request $request){

        $searchKey=WebInfo::first();
        if($searchKey){
            $searchKey->search_key=$request->input('search_key');
            $searchKey->save();
        }else{
            $data=[
                'search_key'=>$request->input('search_key')
            ];
            WebInfo::create($data);
        }

        //
        return ["code"=>200,"msg"=>"保存成功"];
    }

    public function setWebVideo(Request $request){
        $video=WebInfo::first();
        if($video){
            $video->video=$request->input('video');
            $video->cover_img=$request->input('cover_img');
            $video->save();
        }else{
            $data=[
                'video'=>$request->input('video'),
                'cover_img'=>$request->input('cover_img')
            ];
            WebInfo::create($data);
        }

        //
        return ["code"=>200,"msg"=>"保存成功"];
    }


    public function createCertificate(Request $request)
    {
        $data=[
            'title'=>$request->input('title'),
            'sort'=>$request->input('sort'),
            'url'=>$request->input('url'),
            'cover_img'=>$request->input('cover_img'),
        ];
        Certificate::create($data);
        return ["code"=>200,"msg"=>"新增成功"];
    }

    public function updateCertificate($id,Request $request){
        $certificate = Certificate::find($id);
        $certificate->title=$request->input('title');
        $certificate->sort=$request->input('sort');
        $certificate->cover_img=$request->input('cover_img');
        $certificate->url=$request->input('url');
        $certificate->save();
        return ["code"=>200,"data"=>$certificate,"msg"=>"修改成功"];
    }


    //根据id删除对应的资源 user/{id}
    public function destroyCertificate($id,Request $request){
        Certificate::destroy($id);
        return ["code"=>200,"msg"=>"删除成功"];
    }

    public function createPartner(Request $request)
    {
        $data=[
            'title'=>$request->input('title'),
            'sort'=>$request->input('sort'),
            'url'=>$request->input('url'),
            'cover_img'=>$request->input('cover_img'),
        ];
        Partner::create($data);
        return ["code"=>200,"msg"=>"新增成功"];
    }

    public function updatePartner($id,Request $request){
        $partner = Partner::find($id);
        $partner->title=$request->input('title');
        $partner->sort=$request->input('sort');
        $partner->cover_img=$request->input('cover_img');
        $partner->url=$request->input('url');
        $partner->save();
        return ["code"=>200,"data"=>$partner,"msg"=>"修改成功"];
    }

    //根据id删除对应的资源 user/{id}
    public function destroyPartner($id,Request $request){
        Partner::destroy($id);
        return ["code"=>200,"msg"=>"删除成功"];
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


}
