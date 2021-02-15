<?php

declare(strict_types=1);

namespace app\api_admin\controller\v1;

use app\api_admin\controller\CommonV1;
use cigoadmin\controller\UploadCloud;
use cigoadmin\controller\UploadLocal;
use cigoadmin\library\ErrorCode;
use cigoadmin\library\HttpReponseCode;

class Upload extends CommonV1
{
    use UploadLocal;
    use UploadCloud;


    public function upload()
    {
        return $this->localUpload();
    }

    public function token()
    {
        $res = false;

        switch (env('cigo-admin.file-save-type')) {
            case 'cloudQiniu':
                $res = $this->makeCloudQiniuToken();
                break;
            case 'cloudAliyun':
                $res = $this->makeCloudAliyunToken();
                break;
            case 'cloudTencent':
                $res = $this->makeCloudTencentToken();
                break;
            default:
                $res = $this->makeApiReturn("系统云存储配置错误", [], ErrorCode::ServerError_OTHER_ERROR, HttpReponseCode::ServerError_InternalServer_Error);
                break;
        }
        return $res;
    }
}
