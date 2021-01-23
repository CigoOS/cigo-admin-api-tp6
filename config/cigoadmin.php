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
        'AccessKey'                => env('qiniu_cloud.access_key', ''),
        'SecretKey'                => env('qiniu_cloud.secret_key', ''),
        'host'                     => 'upload-z2.qiniup.com',
        'tokenExpireTime'          => env('qiniu_cloud.link_timeout', 3600),
        'returnBody'               => '{"key":"$(key)","hash":"$(etag)","fname":"$(fname)","fprefix":"$(fprefix)","mimeType":"$(mimeType)","fsize":"$(fsize)","bucket":"$(bucket)"}',
        'enableCallbackServer'     => true,
        'callbackUrl'              => env('qiniu_cloud.callback_url', (empty($_SERVER['host']) ? '' : $_SERVER['host']) . '/v1/qiniu/notify'),
        'callbackBodyType'         => 'application/json',
        'callbackBody'             => '{"key":"$(key)","hash":"$(etag)","fname":"$(fname)","fprefix":"$(fprefix)","mimeType":"$(mimeType)","fsize":"$(fsize)","bucket":"$(bucket)"}',
    ],

    //----------------------------------------------------------------------------------------------------------

    /* 阿里云相关配置 */
    'ali_cloud'           => [
        'access_key'               => env('ali_cloud.access_key'),
        'access_secret'            => env('ali_cloud.access_secret'),
        'sms'                      => [
            'sign_name'                         => env('ali_cloud.sign_name'),
            'expire_time'                       => env('ali_cloud.expire_time'), //验证码超时秒数
            'code_cache_prefix' => env('ali_cloud.code_cache_prefix'), //验证码缓存前缀
            'tpl'                               => [
                'user_verify'                               => env('ali_cloud.tpl_user_verify'), //身份验证验证码
            ]
        ]
    ]

    //----------------------------------------------------------------------------------------------------------
];
