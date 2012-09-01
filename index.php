<?PHP
/** 
* Startpage for TD with full Smarty support
* 
* @author  Werner Huysmans 
* @access  public
* @version 4.0 201106
* @package mycmms40
* @subpackage framework
* @filesource
* @tpl framework_index.tpl
* @txid No DATABASE action
*/ 
$nosecurity_check=true;
$rootfile=true;
require("./includes/config_mycmms.inc.php");    # direct path
require("./libraries/setup.php");
if(!empty($_GET['nav']))
{	$_SESSION['nav']=$_GET['nav'];
    $_SESSION['system']="td";
} else {
    $_SESSION['nav']="work_orders";
    $_SESSION['system']="td";
}
// Retrieve the Tabs and their default actions
$DB=DBC::get();
$result=$DB->query("SELECT tab,tabdefault FROM sys_mainwindow WHERE system='td' ORDER BY taborder");
foreach ($result->fetchAll(PDO::FETCH_ASSOC) AS $tab_action) {
    $action[$tab_action['tab']]=$tab_action['tabdefault'];   
}
$tpl=new smarty_mycmms();
$tpl->debugging=false;
$tpl->caching=false;
$tpl->assign("page_title",CMMS_TITLE);
$tpl->assign("nav",$_SESSION['nav']);
$tpl->assign("query",$action[$_SESSION['nav']]);
$tpl->assign("title","title_td.php");
$tpl->display("framework_index.tpl");
?>
