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
    require("setup.php");
    $DB=DBC::get();
    $pEQNUM=DBC::fetchcolumn("SELECT EQNUM FROM wo WHERE WONUM={$_REQUEST['WONUM']}",0);  
    $pTASKNUM=$_REQUEST['TASKNUM'];$pWONUM=$_REQUEST['WONUM'];
    try {
            $DB->beginTransaction();
            DBC::execute("DELETE FROM woop WHERE WONUM=:wonum",array("wonum"=>$pWONUM));
            DBC::execute("DELETE FROM wocraft WHERE WONUM=:wonum",array("wonum"=>$pWONUM));
            DBC::execute("DELETE FROM wop WHERE WONUM=:wonum",array("wonum"=>$pWONUM));
            DBC::execute("DELETE FROM wodocu WHERE WONUM=:wonum",array("wonum"=>$pWONUM));
            
            DBC::execute("INSERT INTO woop (WONUM,OPNUM,OPDESC) SELECT :wonum,OPNUM,OPDESC FROM tskop WHERE TASKNUM=:tasknum",array("wonum"=>$pWONUM,"tasknum"=>$pTASKNUM));
            DBC::execute("INSERT INTO wocraft (WONUM,OPNUM,CRAFT,TEAM,ESTHRS) SELECT :wonum,OPNUM,CRAFT,TEAM,ESTHRS FROM tskcraft WHERE TASKNUM=:tasknum",array("wonum"=>$pWONUM,"tasknum"=>$pTASKNUM));
            DBC::execute("INSERT INTO wop (WONUM,ITEMNUM,QTYREQD) SELECT :wonum,ITEMNUM,QTYREQD FROM tskparts WHERE TASKNUM=:tasknum",array("wonum"=>$pWONUM,"tasknum"=>$pTASKNUM));
            DBC::execute("INSERT INTO wodocu (WONUM,FILENAME,DESCRIPTION) SELECT :wonum,FILENAME,DESCRIPTION FROM taskdocu WHERE TASKNUM=:tasknum",array("wonum"=>$pWONUM,"tasknum"=>$pTASKNUM));
            DBC::execute("UPDATE wo SET TASKNUM=:tasknum WHERE WONUM=:wonum",array("wonum"=>$pWONUM,"tasknum"=>$pTASKNUM));
            $DB->commit();
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
        }
    
    $tpl=new smarty_mycmms();
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("tasknum",$_REQUEST['TASKNUM']);
    $tpl->assign("wonum",$_REQUEST['WONUM']);
    $tpl->display("task2workorder_end.tpl");    
    break;
}   
default: {
    require("setup.php");
    require("_wikihelp.php");

    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("wiki",get_wiki_help($_SERVER['SCRIPT_NAME']));
    $tpl->display("task2workorder_form.tpl");
    break;
} // EO default
} // EO switch
?>
