<?PHP 
/** 
* TabMenu_Title
* 
* @author  Werner Huysmans
* @access  public
* @version 4.0 201106
* @package mycmms40
* @subpackage framework
* @filesource
* @tpl framework_tabwindow.tpl
*/
/** Parameters
* $tabwindow
* $defaultaction
*/
$tabwindow="ppm";
/** DO NOT CHANGE THE FOLLOWING
*/
$nosecurity_check=true;
require("../includes/config_mycmms.inc.php");
require("setup.php");
$DB=DBC::get();

$tpl=new smarty_mycmms();
$tpl->debugging=false;
$tpl->assign("stylesheet",STYLE_PATH."/".CSS_TITLE);
$tpl->assign("index","tabmenu_".$tabwindow.".php");
$tpl->assign("settings",$_SESSION);
$tpl->assign("tabs",$DB->query("SELECT tablink,tabheader FROM sys_tabwindows WHERE tabwindow='$tabwindow' ORDER BY taborder",PDO::FETCH_ASSOC));
$tpl->display("framework_tabwindow_title.tpl");
?>