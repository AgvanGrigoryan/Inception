<?php

if (
	isset($_SERVER['HTTP_X_FORWARDED_PROTO']) &&
	$_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https'
) {
	$_SERVER['HTTPS'] = 'on';
}
$_SERVER['HTTP_HOST'] = 'aggrigor.42.fr';
define('FORCE_SSL_ADMIN', true);
define('COOKIE_DOMAIN', $_SERVER['HTTP_HOST']);
define('COOKIEPATH', '/');
define('SITECOOKIEPATH', '/');


define( 'WP_DEBUG_LOG', true);
define( 'WP_DEBUG_DISPLAY', false);

# redis setup
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_CACHE_KEY_SALT', '123my_uniq_salt123');
define('WP_REDIS_DATABASE', 0);

define('DB_NAME', $_SERVER['WORDPRESS_DB_NAME']);
define('DB_USER', $_SERVER['WORDPRESS_DB_USER']);
define('DB_PASSWORD', trim(file_get_contents(getenv('WORDPRESS_DB_PASSWORD_FILE'))));
define('DB_HOST', $_SERVER['WORDPRESS_DB_HOST']);
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define ('CONCATENATE_SCRIPTS', false);
define('WP_HOME', $_SERVER['WP_URL']);
define('WP_SITEURL', $_SERVER['WP_URL']);

$table_prefix = 'wp_';
define('WP_DEBUG', false);
if (!defined('ABSPATH')) {
	define('ABSPATH', dirname(__FILE__) . '/');
}

require_once ABSPATH . 'wp-settings.php';

?>
