<?php
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
define('WP_HOME', 'https://aggrigor.42.fr');
define('WP_SITEURL', 'https://aggrigor.42.fr');

$table_prefix = 'wp_';
define('WP_DEBUG', false);
if (!defined('ABSPATH')) {
	define('ABSPATH', dirname(__FILE__) . '/');
}

require_once ABSPATH . 'wp-settings.php';

?>
