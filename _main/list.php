<?PHP 
/** The list.php manages the content of the Maintmain window
* LIST retrieves the SQL query and then manipulates the query:
* - replaces the parameters
* - shows the fields with an alias
* - handles LIMIT and ORDER
*
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @access  public
* @package mycmms40
* @version 4.0
* @subpackage framework
* @filesource
* @todo Move Login Screen to Smarty Template 
*/
$nosecurity_check=true;
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_listPageSmarty.php");  

class mainlistPage extends ListPageSmarty {
    public function DisplayTDLogin() {
        require("setup.php");
        $DB=DBC::get();
        
        $tpl=new smarty_mycmms();
        $tpl->assign('stylesheet',STYLE_PATH."/".CSS_LISTS);
        $tpl->assign('stylesheet_exception',STYLE_PATH."/".CSS_LOGIN);
        $tpl->assign('authorisation_script',"../_main/auth_td.php");
        $tpl->display("framework_tdlogin.tpl");
    }
    public function DisplayProductionLogin() {
        require("setup.php");
        $DB=DBC::get();
        
        $tpl=new smarty_mycmms();
        $tpl->assign('stylesheet',STYLE_PATH."/".CSS_LISTS);
        $tpl->assign('stylesheet_exception',STYLE_PATH."/".CSS_LOGIN);
        $tpl->assign('authorisation_script',"../_main/auth_prod.php");
        $tpl->assign('names',$DB->query("SELECT uname,longname FROM sys_groups",PDO::FETCH_NUM));
        $tpl->display("framework_productionlogin.tpl");
    }
    public function DisplayASCOLogin() {
        require("setup.php");
        $DB=DBC::get();
        
        $tpl=new smarty_mycmms();
        $tpl->assign('stylesheet',STYLE_PATH."/".CSS_LISTS);
        $tpl->assign('stylesheet_exception',STYLE_PATH."/".CSS_LOGIN);
        $tpl->assign('authorisation_script',"../_main/auth_asco.php");
        $tpl->assign('machines',$DB->query("SELECT EQNUM AS 'text',EQNUM as 'id' FROM equip WHERE EQROOT LIKE 'AZ%'",PDO::FETCH_NUM));
        $tpl->assign('names',$DB->query("SELECT uname AS 'text',uname as 'id' FROM sys_groups",PDO::FETCH_NUM));
        $tpl->display("framework_ascologin.tpl");   
    }
} // EO mainlistPage
$list=new mainlistPage();
$list->rootdirs=$rootdirs;   

/**
* If no profile is set, the user must login
*/
if(!isset($_SESSION['profile'])) {   
    switch ($_SESSION['system']) {
    case 'td':
        $list->DisplayTDLogin();
        break;
    case 'production':
        $list->DisplayProductionLogin();
        break;
    case 'oee':
        $list->DisplayOEELogin();
        break;
    case 'asco':
        $list->DisplayASCOLogin();
        break;
    }    
} else {
/**
* Show the list...
*/
    $DB=DBC::get();
    /**
    * If this is the first launch of the query ($_REQUEST), reset the ORDER BY SQL
    * If this is a refresh ($_SESSION)
    */
    if (empty($_REQUEST['query_name'])) {
        $result=$DB->query("SELECT * FROM sys_queries WHERE name='{$_SESSION['query_name']}'");
        $template=$result->fetch(PDO::FETCH_ASSOC);
    } else {
        unset($_SESSION['order_by']);
        $result=$DB->query("SELECT * FROM sys_queries WHERE name='{$_REQUEST['query_name']}'",PDO::FETCH_ASSOC); 
        $template=$result->fetch(PDO::FETCH_ASSOC);
    }
    switch ($_SESSION['system']) {
    case 'td':
        $list->DisplayPageSmarty($template['template_section']);
        break;
    case 'tdO':
        $list->stylesheet_exc=CSS_EMPTY;
        if ($production_format!="STANDARD") {
            $list->stylesheet_exc=CSS_LIST_TD;
        }
        $list->title="title_td.php";
        $list->DisplayPage();
        break;
    case 'production':
        $list->DisplayPageSmarty($template['template_section']);
        break;
    case 'oee':
        $list->DisplayPageSmarty($template['template_section']);
        break;
    case 'asco':
        $list->DisplayPageSmarty($template['template_section']);
        break;    
    } // EO switch system
}   
?>

 
