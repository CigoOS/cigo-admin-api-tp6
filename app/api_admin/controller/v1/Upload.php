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
        return $this->makeToken();
    }
}
