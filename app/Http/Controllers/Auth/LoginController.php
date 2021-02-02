<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
//use http\Env\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Admin\User;
use Illuminate\Support\Facades\Hash;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    protected function redirectTo()
    {
        return '/admin#/control-board';
    }

    protected function guard()
    {
        return Auth::guard('admin');
    }
    public function username()
    {
        return 'name';
    }

    public function authenticate(Request $request)
    {
//        admin  qwe123
        $this->validateLogin($request);
        $credentials = $request->only('name', 'password');
        if ($this->guard()->attempt($credentials)) {
            //身份验证通过...
            return ['code'=>200,'msg'=>'登录成功,正在跳转','url'=>$this->redirectTo()];
        }else{
            return ['code'=>1,'msg'=>'账号或密码错误'];
        }


    }

    protected function validateLogin($request){
        $this->validate($request, [
            'name' => 'required',
            'password' => 'required',
            'captcha' => 'required|captcha',
        ],[
            'captcha.required' => '请填写验证码',
            'captcha.captcha' => '验证码错误',
        ]);
    }

    public function loginOut(Request $request){
        Auth::logout();
        $request->session()->invalidate();
        return ['code'=>200,'msg'=>'退出成功'];
    }








}
