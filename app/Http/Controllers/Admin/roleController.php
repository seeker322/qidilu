<?php

namespace App\Http\Controllers\Admin;

use App\Models\Admin\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class roleController extends Controller
{
    //
    public function index(Request $request)
    {
        $roles=Role::get();
        return ["code"=>200,"data"=>$roles];
    }
}
