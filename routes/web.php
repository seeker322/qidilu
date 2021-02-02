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
    return view('Admin.login');
})->name('login');

Route::post('/login', 'Auth\LoginController@authenticate');
Route::get('/loginOut', 'Auth\LoginController@loginOut');

Route::group(['middleware' => ["auth:admin"],'namespace' => 'Admin', 'prefix' => 'admin'], function () {
//    Route::get('/', function () {
//        return view('admin.index');
//    });
    Route::get('/', 'IndexController@index');
    Route::resource('user', 'UserController');
    Route::resource('role', 'RoleController');
    Route::resource('permission', 'PermissionController');
    Route::resource('artical', 'ArticalController');
    Route::post('/articalBanner', 'ArticalController@updateBanner');
    Route::resource('banner', 'BannerController');
    Route::resource('video', 'VideoController');
    Route::resource('single', 'SingleController');
    Route::resource('download', 'DownLoadController');
    Route::resource('comment', 'CommentController');
    Route::post('/uploadImg', 'UploadController@uploadImg');
    Route::post('/uploadAticalImg', 'UploadController@uploadAticalImg');
    Route::get('/getWebInfo','WebInfoController@index');
    Route::post('/saveVideo', 'WebInfoController@setWebVideo');
    Route::post('/saveSeo', 'WebInfoController@saveSeo');
    Route::post('/setSearchKey', 'WebInfoController@setSearchKey');
    Route::post('/addCertificate','WebInfoController@createCertificate');
    Route::post('/updateCertificate/{id}','WebInfoController@updateCertificate');
    Route::get('/delCertificate/{id}','WebInfoController@destroyCertificate');
    Route::post('/addPartner','WebInfoController@createPartner');
    Route::post('/updatePartner/{id}','WebInfoController@updatePartner');
    Route::get('/delPartner/{id}','WebInfoController@destroyPartner');
});


Route::group(['namespace' => 'Home'], function () {
    //
    Route::get('/', function () {
        return view('Home.index');
    });

    Route::get('/test', function () {
        return "这是前端测试项目";
    });
});


