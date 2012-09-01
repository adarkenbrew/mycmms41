<?php
/** Configuration file for myCMMS
* -- Shouldn't be changed --
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @changed:   2010
* @access  public
* @version: 4.0
* @package mycmms40
* @subpackage framework
* @filesource
*/
session_start();
if ($rootfile) {
    require("config_settings.inc.php");
    set_include_path(".".PATH_SEPARATOR."./includes".PATH_SEPARATOR."./libraries".PATH_SEPARATOR.PEAR_PATH);      
} else if($deep2) {
    require("config_settings.inc.php");
    set_include_path(".".PATH_SEPARATOR."../../includes".PATH_SEPARATOR."../../libraries".PATH_SEPARATOR.PEAR_PATH);      
}
else {
    require("config_settings.inc.php");
    set_include_path(".".PATH_SEPARATOR."../includes".PATH_SEPARATOR."../libraries".PATH_SEPARATOR.PEAR_PATH);
}
$page_title=CMMS_TITLE;
// $DB_config=CMMS_DB;
$WIKI=WIKI;
if (OEE) {
    $OEE_Server=OEE_SERVER;
    $OEE_Server_Uname=OEE_UID;
    $OEE_Server_Pwd=OEE_PWD;
    $OEE_Server_DB=OEE_DB;
    $OEE_Server_Table=OEE_TABLE;
}
/**
* Initialization of the Database interface
*/
require_once(CMMS_LIB."/class_PDO_MySQL.php");
/**
* Checking User access
*/
require_once(CMMS_LIB."/lib_security.php");
require_once(CMMS_LIB."/lib_common.php");
if (!$nosecurity_check) {
    $permission=operation_allowed($_SERVER["SCRIPT_NAME"]);
    if (!$permission) {
        warning_screen($login, $group);
        exit;
    }
}
/** Presentation of the Form
* - Setting typical of Browsers
* - include Fill boxes for forms
*/
// require_once(CMMS_LIB."/fill_select.inc.php");
?>
