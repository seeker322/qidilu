<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
//use http\Env\Request;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

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
        return '/admin';
    }

    public function username()
    {
        return 'name';
    }

//    protected function guard()
//    {
//        return Auth::guard('admin');
//    }

    public function authenticate(Request $request)
    {
        $this->validateLogin($request);

        //admin登录密码123456
        if (Auth::guard('admin')->attempt(['name' => $request->name, 'password' => $request->password])) {
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
            'captcha.required' => trans('validation.required'),
            'captcha.captcha' => trans('validation.captcha'),
        ]);
    }

    public function loginOut(Request $request){
        Auth::logout();
        $request->session()->invalidate();
        return ['code'=>200,'msg'=>'退出成功'];
    }








}
