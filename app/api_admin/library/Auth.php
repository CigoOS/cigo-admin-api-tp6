<?php
declare (strict_types=1);

namespace app\api_admin\library;

use cigoadmin\library\traites\ApiCommon;

/**
 * 登录及权限管理
 *
 * Class Auth
 * @package app\api\library
 */
class Auth
{
    use ApiCommon;

    /**
     * 更新token，保持登录状态
     *
     * @return $this
     */
    public function updateToken()
    {

        return $this;
    }
}

