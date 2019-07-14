<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('index');
//});


Route::get('/login', function () {
    return view('admin.login');
});

Route::group(['middleware' => [],'namespace' => 'Admin', 'prefix' => 'admin'], function () {
    //
    Route::get('/', function () {
        return view('admin.index');
    });

    Route::get('/test', function () {
        return "这是后端测试页面";
    });
});


Route::group(['namespace' => 'Home'], function () {
    //
    Route::get('/', function () {
        return view('home.index');
    });

    Route::get('/test', function () {
        return "这是前端测试项目";
    });
});
