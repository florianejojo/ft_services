<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' ); 

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '`TawTS{(1Tie@p{ D[].y_n-=^&g5X1e.PB9H3/}iH6:W3IX3ya0-??wX ($M+nZ');
define('SECURE_AUTH_KEY',  '`c2q+y{(`j3:Ub!KSCc%@t8E# DsRz|>O=6S(P+1i6fmrn)I(-w^92m}x^SdZ:M0');
define('LOGGED_IN_KEY',    '|-JC[41-[M_VcL`?sHTJ&^f:RXGD(;aH>+ |S#~#|~CHVzzn)LP$;JSk}Qa;EQ`9');
define('NONCE_KEY',        'OICdQM$jhg;CU(j&,OE|gWjgs6g-F;+2[Zew9DV79G=*2,W|<Lvn]0#r}+TtIn^s');
define('AUTH_SALT',        'vbkPS>How>/,p#:9I^:dtwfPX-bQ|Pp{=o?ja2xn^xmmfal*7t1mW|,}Dc2uaEEE');
define('SECURE_AUTH_SALT', 'qQ$I]zE-@Bb?vQ! F)%(sJ%=l[Oe*UPoq|W(>mxgy6_:@MQk5#HcTm L?:,i&t6)');
define('LOGGED_IN_SALT',   'U B%&+-T>F*I.&cP&smf}y.]Ykp.+zVzOhh~q>Rd:Us%uwWYhn(]w7-6Q;oR{|Bv');
define('NONCE_SALT',       ',P9a,CE9|pO<>*&PKd2CX*jN8vDWDR#*mU56r8 ~jl-(LzdW#j%V/n;clzx}ufB$');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
