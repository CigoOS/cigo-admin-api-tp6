{
  "name": "cigoos/cigo-admin-api-tp6",
  "type": "project",
  "license": "MIT",
  "authors": [
    {
      "name": "西谷老湿",
      "email": "zim@cigoos.com"
    }
  ],
  "keywords": [
    "framework",
    "cigoadmin",
    "cigoadmin"
  ],
  "homepage": "https://www.cigoadmin.com",
  "description": "西谷后台-后端接口:thinkphp-v6版本",
  "require": {
    "php": ">=7.1.0",
    "cigoos/cigo-admin-api-core-tp6": "dev-master",
    "topthink/think-multi-app": "^1.0"
  },
  "autoload": {
    "psr-4": {
      "app\\": "app"
    },
    "psr-0": {
      "": "extend/"
    }
  },
  "config": {
    "preferred-install": "dist"
  },
  "scripts": {
    "post-autoload-dump": [
      "@php think service:discover",
      "@php think vendor:publish"
    ]
  }
}
