<?php
/** 
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @access  public
* @version 4.0
* @package mycmms40
* @subpackage framework
* @filesource
*/
$nosecurity_check=true;
require("../includes/config_mycmms.inc.php"); // Get Logo
require("setup.php");
$DB=DBC::get();

$tpl=new smarty_mycmms();
$tpl->debugging=false;
$tpl->assign('stylesheet',STYLE_PATH."/".CSS_TITLE);
$tpl->assign('logo',LOGO_TD);
$tpl->assign('logo_mysql',LOGO_MYSQL);
$tpl->assign('logo_sf',LOGO_SF);
$tpl->assign('tabs',$DB->query("SELECT tab,tabheader FROM sys_mainwindow WHERE system='td' ORDER BY taborder",PDO::FETCH_ASSOC));
$tpl->assign('nav',$_SESSION['nav']);   // Selected Tab
$tpl->assign('user',$_SESSION['user']); // Logged in as 
$tpl->assign('DB',$_SESSION['db']);     // Active DB
$tpl->assign('index',"index.php");
$tpl->assign('auth',"auth_td.php");
$tpl->display("framework_title.tpl");
?>
