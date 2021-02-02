<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('addComment','Admin\CommentController@store');

Route::get('getBanner','Admin\BannerController@index');
//获取相同级别的栏目数据
Route::get('getSonChannel/{id}','Admin\PermissionController@getSonChannel');
Route::get('getPeerChannel/{id}','Admin\PermissionController@getPeerChannel');
Route::get('getArticalList/{id}','Admin\ArticalController@show');

Route::post('getSearchList','Admin\ArticalController@getSearchList');
Route::get('getArticalInfo/{id}','Admin\ArticalController@getArticalInfo');
Route::get('getTenChannel','Admin\PermissionController@getTenChannel');
Route::get('getSingleInfo/{id}','Admin\SingleController@show');
Route::get('getAllArtical/{id}','Admin\ArticalController@getAllArtical');
Route::get('getWebInfo','Admin\WebInfoController@index');
Route::get('getAppInfo','Admin\DownLoadController@index');

Route::get('getVideoList/{id}','Admin\VideoController@show');
Route::get('getVideoInfo/{id}','Admin\VideoController@getVideoInfo');

