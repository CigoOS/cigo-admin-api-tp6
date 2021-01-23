<?php

namespace app\api_client\library;

use app\BaseController;

/**
 * Api接口基准类
 *
 * Class ApiBase
 * @package app\api_client\library
 */
class ApiBase extends BaseController
{
    protected $moduleName = 'client';

    protected $args = [];

    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub

        $this->args = input();
    }
}