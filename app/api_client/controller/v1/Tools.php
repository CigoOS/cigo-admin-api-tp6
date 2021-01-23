<?php
declare (strict_types=1);

namespace app\api_client\controller\v1;

use app\api_client\controller\CommonV1;
use app\cigoadmin\controller\Sms;

class Tools extends CommonV1
{
    use Sms;

    public function sendSmsCode()
    {
        return $this->sendVerifyCode();
    }
}