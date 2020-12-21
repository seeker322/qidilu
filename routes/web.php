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
Auth::routes();

//Route::get('/login', 'HomeController@index')->name('home');

Route::get('/login', function () {
    return view('admin.login');
})->name('login');

Route::post('/login', 'Auth\LoginController@authenticate');
Route::get('/loginOut', 'Auth\LoginController@loginOut');

Route::group(['middleware' => ["auth:admin"],'namespace' => 'Admin', 'prefix' => 'admin'], function () {
//    Route::get('/', function () {
//        return view('admin.index');
//    });
    Route::get('/', 'indexController@index');
    Route::resource('user', 'UserController');
    Route::resource('role', 'RoleController');
    Route::resource('permission', 'PermissionController');
    Route::resource('artical', 'ArticalController');
    Route::resource('artical', 'ArticalController');
    Route::post('/articalBanner', 'ArticalController@updateBanner');
    Route::resource('banner', 'BannerController');
    Route::resource('video', 'VideoController');
    Route::resource('single', 'SingleController');
    Route::resource('download', 'DownLoadController');
    Route::resource('comment', 'CommentController');
    Route::post('/uploadImg', 'UploadController@uploadImg');
    Route::post('/uploadAticalImg', 'UploadController@uploadAticalImg');
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


