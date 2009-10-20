<?php
/**
 * Project:     PHPLinkDirectory: Version 2.1.2
 * This software is for use only to those who have purchased a license.
 * A license must be purchased for EACH installation of the software.
 * By using the software you agree to the terms:
 * You may not redistribute, sell or otherwise share this software in whole or in part without the consent of the the ownership of PHP Link Directory. Please contact david@david-duval.com if you need more information.
 * You agree to retain a link back to http://www.phplinkdirectory.com/ on all pages of your directory in you purchased the $25 version of the software.
 * License holders are entitled to upgrades to the 3.0 branch of the software as they are made available at ttp://www.phplinkdirectory.com/
 * In some cases, license holders may be required to agree to changes in the software license before receiving updates to the software.
 * For questions, help, comments, discussion, etc., please join the
 * PHP Link Directory Forum http://www.phplinkdirectory.com/forum/
 *
 * @link http://www.phplinkdirectory.com/
 * @copyright 2004-2006 NetCreated, Inc. (http://www.netcreated.com/)
 * @package PHPLinkDirectory
 **/

require_once 'init.php';
require_once 'libs/captcha/captcha.class.php';

@error_reporting(E_ERROR | E_WARNING | E_PARSE);

$settings = array ();

/* Really Simple captcha generation
 * Use if no TTF and GD font is supported
 */
$settings['simple_captcha'] = '0';

/* Absolute path to folder with fonts
 * With trailing slash!
 */
$settings['Fonts_Folder'] = 'libs/captcha/fonts/';

/* The minimum size a character should have */
$settings['minsize'] = 30;

/* The maximum size a character should have */
$settings['maxsize'] = 35;

/* The maximum degrees of an angle a character should be rotated.
 * A value of 20 means a random rotation between -20 and 20.
 */
$settings['angle'] = 30;

/* The background color of the image in HTML code
 * Default is "random"
 * Available options: - "random"
 *                    - "gradient"
 *                    - "56B100", "#F36100", "#6B6E4B" or whatever color you like
 */
$settings['background_color'] = 'random';

/* The image type
 * Default is "png" but "jpeg" and "gif" are also supported
 */
$settings['image_type'] = 'png';

/* Number of characters the image should include
 * Do not use large numbers, default is 6, but you can set it to 5 or 4
 *
 */
$settings['phrase_length'] = '6';

/* Distorsion level of the image
 *

 */
$settings['image_distorsion_level'] = '4';

/* The type of characters for generating random phrase.
 * Available options: - "alphanumeric" = "ABC..abc...0123.."
 *                    - "alphabetical" = "ABC..abc..."
 *                    - "numeric" = "0123..."
 *

 */
$settings['phrase_type'] = 'alphanumeric';

/* Initialize CAPTCHA class */
$captcha = & new CAPTCHA($settings);

$captcha->create_CAPTCHA();
$_SESSION['CAPTCHA'] = strtolower ($captcha->value);
session_write_close();
?>