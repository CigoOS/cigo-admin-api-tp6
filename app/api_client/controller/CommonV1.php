<?php
declare (strict_types=1);

namespace app\api_client\controller;

use app\api_client\library\ApiBase;
use cigoadmin\library\traites\CheckArgs;

/**
 * V1版本公共基类
 *
 * Class CommonV1
 * @package app\api_client\controller\v1
 */
class CommonV1 extends ApiBase
{
    use CheckArgs;
}
