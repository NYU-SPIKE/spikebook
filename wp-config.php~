<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'spikebook');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'mr&-+sy@~thu^LOzsA46W[rhxlg*mI:lW> xZ0*_X:>{sShjyIW2[>i=(7;TC+lp');
define('SECURE_AUTH_KEY',  'tr<hA`,Lwis_wAzX _T1/*-{s(l`DZBu]=}JH.aQ+E.}4Vd7bR:3W Ie+sORvdC~');
define('LOGGED_IN_KEY',    'd4$]qAM,@g2h<RRNX7Mt<(OhPQ.lmS#9Y:0+1MID--z!KY.MinGiHV-6-*m;VEr<');
define('NONCE_KEY',        'nGv(6F.ph}F+jb-F(iJFrt0Cj$KZ-H9N/|<`>(xD}6P]iPA7I`)%o7vb-f6x<1yY');
define('AUTH_SALT',        'gs@P*|--fsT`PAR][WJN/%7KZjr awd@XR/3d]iyHiim[9om pRtKK3kOy17w;D<');
define('SECURE_AUTH_SALT', 'MY8-.DD6`tI2`T3Y<{nI0YYa6db,NL/x=#)=+J((*#RxY9|C(Bi)fThmL:[o#:M*');
define('LOGGED_IN_SALT',   '#E3iuB/^jqj08}K!h8L*l6:QWF:;=fW;Aqa-8<U7#[Hd-o||3c9tqY?[b@#b@g8*');
define('NONCE_SALT',       'jvPS|^[QN1$i44wbWSi$.]3eFp7)-HKxb>wg&z,21;Yex?L8#cwzWRdEH#pf!ps9');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
