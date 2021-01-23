<?php
declare (strict_types=1);

namespace app\api_admin\controller\v1;

use app\api_admin\controller\CommonV1;
use cigoadmin\controller\Sms;

class Tools extends CommonV1
{
    use Sms;

    public function sendSmsCode()
    {
        return $this->sendVerifyCode();
    }
}