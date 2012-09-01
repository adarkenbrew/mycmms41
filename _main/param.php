<?php
/** param.php: Parameters for Listing, param.php is the generic input screen to introduce parameters.
* It's the Quick-and-Dirty input without control, but also easy to use...
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @access  public
* @package mycmms40
* @version 4.0
* @subpackage framework
* @filesource
* @since 20110612: param.php / framework.tpl / NoDB
*/
require("../includes/config_mycmms.inc.php");
if ($_SERVER['REQUEST_METHOD']=='GET') {
    $DB=DBC::get();
    $sql = "SELECT params FROM sys_queries WHERE name='{$_REQUEST['query_name']}'";
    $result = $DB->query($sql);
    if ($result) {
        $data_all=$result->fetch(PDO::FETCH_OBJ);
        $data = explode(";",$data_all->params);
        $params[]=explode(":", $data[0]);
        $params[]=explode(":", $data[1]); 
        $params[]=explode(":", $data[2]); 
        $params[]=explode(":", $data[3]); 
    } else {
        $title = "Parameters for Query";
        $param1 = "Parameter 1";
        $param2 = "Parameter 2";
        $param3 = "Parameter 3";
    }
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("query_name",$_REQUEST['query_name']);
    $tpl->assign("params",$params);
    $tpl->display("framework_params.tpl");
} else {
    $QUERY=$_REQUEST['query_name'];
    $_SESSION['param1']=$_REQUEST['param1'];
    $_SESSION['param2']=$_REQUEST['param2'];
    $_SESSION['param3']=$_REQUEST['param3'];
    switch ($_REQUEST['system']) {
    case 'td':
    case 'production':
        header("location: list.php?query_name=".$QUERY);
        break;
    default:
        header("location: list.php?query_name=".$QUERY);
        break;  
} // End of switch    
}
