<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Storage;
class UploadController extends Controller
{
    public function uploadImg(Request $request)
    {
        if ($request->isMethod('POST')) { //判断文件是否是 POST的方式上传
            $tmp = $request->file('file');
            $path = '/upload/img'; //public下的article
            if ($tmp->isValid()) { //判断文件上传是否有效
                $FileType = $tmp->getClientOriginalExtension(); //获取文件后缀

                $FilePath = $tmp->getRealPath(); //获取文件临时存放位置

                $FileName = date('Y-m-d') . uniqid() . '.' . $FileType; //定义文件名

                Storage::disk('upload')->put($FileName, file_get_contents($FilePath)); //存储文件

                return $data = [
                    'code' => 200,
                    'data' => $path . '/' . $FileName //文件路径
                ];
            }
        }
    }

    public function uploadAticalImg(Request $request)
    {
        if ($request->isMethod('POST')) { //判断文件是否是 POST的方式上传
            $tmp = $request->file('upload');
            $path = '/upload/artical'; //public下的article
            if ($tmp->isValid()) { //判断文件上传是否有效
                $FileType = $tmp->getClientOriginalExtension(); //获取文件后缀

                $FilePath = $tmp->getRealPath(); //获取文件临时存放位置

                $FileName = date('Y-m-d') . uniqid() . '.' . $FileType; //定义文件名

                Storage::disk('artical')->put($FileName, file_get_contents($FilePath)); //存储文件
                return $data=[
                        "uploaded"=>1,
                        "fileName"=>$FileName,
                        "url"=>$path . '/' . $FileName
                ];
            }
        }
    }
}
