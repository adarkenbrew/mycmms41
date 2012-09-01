<?php
/** 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource
*/
require("../includes/config_mycmms.inc.php");

switch ($_REQUEST['STEP']) {
case "1": {
    $DB=DBC::get();
    $pTASKINFO=DBC::fetchcolumns("SELECT TASKNUM,EQNUM FROM taskeq WHERE ID={$_REQUEST['TASKNUM']}");  
    $pTASKNUM=$pTASKINFO[0]; $pEQNUM=$pTASKINFO[1];
    require("TXID_1003.php");
    $newwo=DBC::fetchcolumn("SELECT LAST_INSERT_ID()",0);
    
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("newwo",$newwo);
    $tpl->display("task2newwo_end.tpl");    
    break;
}   
default: {
    $DB=DBC::get();
         
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("tasks",$DB->query("SELECT ID AS 'id',CONCAT(TASKNUM,':',EQNUM) AS 'text' FROM taskeq",PDO::FETCH_NUM));
    $tpl->display("task2newwo_form.tpl");
    break;
} // EO default
} // EO switch

