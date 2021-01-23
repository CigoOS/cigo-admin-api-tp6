<?php
declare (strict_types=1);

namespace app\api_admin\controller\v1;

use app\api_admin\controller\CommonV1;
use cigoadmin\controller\UploadLocal;

class File extends CommonV1
{
    use UploadLocal;

    public function upload()
    {
        return $this->upload();
    }
}