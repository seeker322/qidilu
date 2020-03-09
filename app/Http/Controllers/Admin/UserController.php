<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Admin\User;

class UserController extends Controller
{
    //

    public function index(Request $request)
    {
       $users=User::with("roles")->get();
       return ["code"=>200,"data"=>$users];
    }

    public function create(Request $request)
    {


    }

    public function update($id,Request $request){

        $this->validate($request,[
            'name'=>'required',
            'password'=>'required',
            'email'=>'required',
            'password_confirmation' => 'required|same:password'
        ],[
            'name.required'=>'用户名必填',
            'password.required'=>'密码必填',
            'email.required'=>'邮箱必填',
        ]);
        $user = User::find($id);
        $user->password=bcrypt($request->input['password']);
        $user->email=$request->input('email');
        $user->save();
        $user->roles()->sync($request->input('roles'));
        return ["code"=>200,"msg"=>"修改成功"];

    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name'=>'required',
            'password'=>'required',
            'email'=>'required',
            'password_confirmation' => 'required|same:password'

        ],[
            'name.required'=>'用户名必填',
            'password.required'=>'密码必填',
            'email.required'=>'邮箱必填',
        ]);
        $user =User::create([
            'name' => $request->input('name'),
            'password' => bcrypt($request->input['password']),
            'email' => $request->input('email'),
        ]);
        $user->roles()->attach($request->input('roles'));
        return ["code"=>200,"msg"=>"新增成功"];

    }

    public function destroy($id,Request $request){
        $user = User::find($id);
        $user->roles()->detach();
        $user::destroy($id);
        return ["code"=>200,"msg"=>"删除成功"];
    }

}
