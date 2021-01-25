<?php

use think\facade\Request;

return [
    //----------------------------------------------------------------------------------------------------------

    /* 文件上传相关配置 */
    'file_upload'         => array(
        'autoSub'         => true, //自动子目录保存文件
        'subName'         => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath'        => './upload/images', //保存根路径
        'waterImg'        => './upload/water.jpg', //图片水印图片路径
        'waterText'       => '我是水印', //文字水印
        'waterTextFont'   => './upload/msyh.ttf', //文字水印字体路径
        'replace'         => false, //存在同名是否覆盖
        'fileLimit'       => array(
            'img'                  => array(
                'maxSize'                       => 20 * 1024 * 1024,
                'exts'                          => 'jpg,gif,png,jpeg',
            ),
            'video'                => array(
                'maxSize'                       => 300 * 1024 * 1024,
                'exts'                          => 'mp4,rmvb,mov'
            ),
            'file'                 => array(
                'maxSize'                       => 100 * 1024 * 1024,
                'exts'                          => 'doc,docx,xls,xlsx,ppt,pptx,zip,rar,txt,apk'
            )
        ),
    ), //文件上传相关配置（文件上传类配置）

    //----------------------------------------------------------------------------------------------------------

    /* 七牛云配置参数 */
    'qiniu_cloud'         => [
        'AccessKey'                => env('qiniu-cloud.access-key', ''),
        'SecretKey'                => env('qiniu-cloud.secret-key', ''),
        'host'                     => 'upload-z2.qiniup.com',
        'tokenExpireTime'          => env('qiniu-cloud.link-timeout', 3600),
        'returnBody'               => '{"key":"$(key)","hash":"$(etag)","fname":"$(fname)","fprefix":"$(fprefix)","mimeType":"$(mimeType)","fsize":"$(fsize)","bucket":"$(bucket)"}',
        'enableCallbackServer'     => true,
        'callbackUrl'              => env('qiniu-cloud.callback-url', (empty($_SERVER['host']) ? '' : $_SERVER['host']) . '/v1/qiniu/notify'),
        'callbackBodyType'         => 'application/json',
        'callbackBody'             => '{"key":"$(key)","hash":"$(etag)","fname":"$(fname)","fprefix":"$(fprefix)","mimeType":"$(mimeType)","fsize":"$(fsize)","bucket":"$(bucket)"}',
    ],

    //----------------------------------------------------------------------------------------------------------

    /* 阿里云相关配置 */
    'ali_cloud'           => [
        'access_key'               => env('ali-cloud.access-key'),
        'access_secret'            => env('ali-cloud.access-secret'),
        'sms'                      => [
            'sign_name'                         => env('ali-cloud.sign-name'),
            'expire_time'                       => env('ali-cloud.expire-time'), //验证码超时秒数
            'code_cache_prefix' => env('ali-cloud.code-cache-prefix'), //验证码缓存前缀
            'tpl'                               => [
                'user_verify'                               => env('ali-cloud.tpl-user-verify'), //身份验证验证码
            ]
        ]
    ]

    //----------------------------------------------------------------------------------------------------------
];
