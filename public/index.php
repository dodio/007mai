<?php

define('APP_NAME', 'app');
define('APP_PATH', '../app/');
define('FTX_DATA_PATH', '../data/');
define('EXTEND_PATH',	APP_PATH . 'Extend/');
define('CONF_PATH',		FTX_DATA_PATH . 'config/');
define('RUNTIME_PATH',	FTX_DATA_PATH . 'runtime/');
define('HTML_PATH',		FTX_DATA_PATH . 'html/');
define('ROOT_PATH',dirname(__FILE__));
define('CDN_ROOT', 'http://cdn.007mai.com');

require(CONF_PATH."version.php");
require(CONF_PATH."debug.php");

require("../thinkphp/setup.php");