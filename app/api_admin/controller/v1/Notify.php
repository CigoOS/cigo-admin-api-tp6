<?php

declare(strict_types=1);

namespace app\api_admin\controller\v1;

use app\api_admin\library\ApiBase;
use cigoadmin\controller\FileUpload;

class Notify extends ApiBase
{
    use FileUpload;

    /**
     * 七牛云文件上传通知
     */
    public function qiniu()
    {
        return $this->cloudQiniuNotify();
    }


    /**
     * 腾讯云文件上传通知
     */
    public function tencent()
    {
        return $this->cloudTencentNotify();
    }
}
