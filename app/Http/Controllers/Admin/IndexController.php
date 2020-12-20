<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class IndexController extends Controller
{

    public function index(Request $request)
    {
        $user=Auth::user();
        return view('admin.index',["userInfo"=>array("name"=>$user->name,"email"=>$user->email)]);
    }
}
