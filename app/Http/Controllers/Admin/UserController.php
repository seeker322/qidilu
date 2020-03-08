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

        dd($request->all());
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'password' => 'required',
            'confPassword' => 'required',
        ]);
        dd($request->all());

    }

}
