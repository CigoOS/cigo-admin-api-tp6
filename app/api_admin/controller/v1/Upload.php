<?php

declare(strict_types=1);

namespace app\api_admin\controller\v1;

use app\api_admin\controller\CommonV1;
use cigoadmin\controller\FileUpload;

class Upload extends CommonV1
{
    use FileUpload;


    public function upload()
    {
        return $this->localUpload();
    }

    public function token()
    {
        return $this->makeToken();
    }
}
