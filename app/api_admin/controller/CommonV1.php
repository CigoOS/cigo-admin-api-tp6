<?php
declare (strict_types=1);

namespace app\api_admin\controller;

use app\api_admin\library\ApiBase;
use cigoadmin\library\traites\CheckArgs;

/**
 * V1版本公共基类
 *
 * Class CommonV1
 * @package app\api_admin\controller\v1
 */
class CommonV1 extends ApiBase
{
    use CheckArgs;
}
