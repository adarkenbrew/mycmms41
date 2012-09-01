<?PHP
/** 
* TabMenu
* 
* @author  Werner Huysmans
* @access  public
* @package mycmms40
* @subpackage framework
* @filesource
*/
/** Parameters
* $tabwindow
* $defaultaction
*/
$tabwindow="wr2";
$defaultaction="request";
/** DO NOT CHANGE THE FOLLOWING
*/
$nosecurity_check=true;
require("../includes/config_mycmms.inc.php");
require("setup.php");
if (isset($_REQUEST['id1'])) {  // Save in Session
    $_SESSION['Ident_1']=$_REQUEST['id1'];
    $_SESSION['Ident_2']=$_REQUEST['id2'];
}
if(!empty($_GET['nav_tab'])) {   
    $_SESSION['nav_tab']=$_GET['nav_tab']; 
} else {
    $_SESSION['nav_tab']=$defaultaction;
}

$DB=DBC::get();
$result=$DB->query("SELECT tablink,tabaction FROM sys_tabwindows WHERE tabwindow='$tabwindow'");
foreach ($result->fetchAll(PDO::FETCH_ASSOC) AS $tab) {
    $action[$tab['tablink']]=$tab['tabaction'];   
}
$tpl=new smarty_mycmms();
$tpl->assign("nav_tab",$_SESSION['nav_tab']);
$tpl->assign("title","tabmenu_".$tabwindow."_title.php");
$tpl->assign("action",$action[$_SESSION['nav_tab']]);
$tpl->display("framework_tabwindow.tpl");
?>
