<?php

use think\facade\Route;

// 根路由
Route::get('/', '/Index/index');

/**
 * v1 版本路由
 */
Route::get("/test", "/test/token");

Route::post("/:version/qiniu/token", ":version.qiniu/token");//获取七牛云凭证
Route::post("/:version/qiniu/notify", ":version.notify/qiniu");//七牛云异步通知
Route::post(":version/phoneLogin", ":version.user/loginByPhone"); //登录

/**********************************************************************************************************************/

//默认路由
Route::rule(
    "/:version",
    ":version.Index/index",
    'GET|POST'
);
