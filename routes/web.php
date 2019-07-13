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
//Route::get('/test', function () {
//    return "111";
//});



Route::group(['middleware' => [],'namespace' => 'Admin', 'prefix' => 'admin'], function () {
    //
    Route::get('/', function () {
        return view('admin.index');
    });
});


Route::group(['namespace' => 'Home'], function () {
    //
    Route::get('/', function () {
        return view('home.index');
    });
});
