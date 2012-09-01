<?php
/** 
* Copy WO content to Task
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource
* @todo Use Smarty
*/
require("../includes/config_mycmms.inc.php");

switch ($_REQUEST['STEP']) {
case "1": {
    require("setup.php");
    $DB=DBC::get();
    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("wo_data",$DB->query("SELECT wo.WONUM,EQNUM,TASKDESC FROM wo WHERE WO.WONUM={$_REQUEST['WONUM']}",PDO::FETCH_ASSOC));
    $tpl->assign("woop",$DB->query("SELECT woop.OPNUM,woop.OPDESC,CRAFT,ESTHRS,TEAM FROM woop LEFT JOIN wocraft wc ON woop.WONUM=wc.WONUM AND woop.OPNUM=wc.OPNUM WHERE woop.WONUM={$_REQUEST['WONUM']}",PDO::FETCH_ASSOC));
    $tpl->display("workorder2task_preview.tpl");
    break;
} // EO STEP1   
case "2": {
    $DB=DBC::get();
    $activePPMtask=DBC::fetchcolumn("SELECT COUNT(*) FROM TASKEQ WHERE TASKNUM='{$_REQUEST['TASKNUM']}' AND EQNUM<>'CMMS'",0);
    $pWONUM=$_REQUEST['WONUM'];$pTASKNUM=$_REQUEST['TASKNUM'];
    if ($activePPMtask->NR > 0) { //  PPM tasks exist
        try {
            $DB->beginTransaction();
            DBC::execute("UPDATE wo SET TEXTS_A='No Methods' WHERE WONUM=:wonum AND TEXTS_A IS NULL",array("wonum"=>$pWONUM));
            DBC::execute("UPDATE task SET TEXTS_A=(SELECT TEXTS_A FROM wo WHERE WONUM=:wonum) WHERE TASKNUM=:tasknum",
            array("tasknum"=>$pTASKNUM,"wonum"=>$pWONUM));
            // DBC::execute("DELETE FROM task WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            // DBC::execute("DELETE FROM taskeq WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM tskop WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM tskcraft WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM tskparts WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM taskdocu WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            # New TASK
            DBC::execute("INSERT INTO task (TASKNUM,DESCRIPTION,WOTYPE,TEXTS_A,LASTEDITDATE) SELECT :tasknum,:description,'PPM',TEXTS_A,NOW() FROM wo WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"description"=>$pDESCRIPTION,"wonum"=>$pWONUM));
            DBC::execute("INSERT INTO taskeq (TASKNUM,EQNUM,LASTPERFDATE,SCHEDTYPE,DATEUNIT,NUMOFDATE) VALUES (:tasknum,'CMMS','20000101','F','D',30)",array("tasknum"=>$pTASKNUM));
            DBC::execute("INSERT INTO tskop (TASKNUM,OPNUM,OPDESC) SELECT :tasknum,OPNUM,OPDESC FROM woop WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            DBC::execute("INSERT INTO tskcraft (TASKNUM,OPNUM,CRAFT,TEAM,ESTHRS) SELECT :tasknum,OPNUM,CRAFT,TEAM,ESTHRS FROM wocraft WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            DBC::execute("INSERT INTO tskparts (TASKNUM,ITEMNUM,QTYREQD) SELECT DISTINCT :tasknum,ITEMNUM,QTYREQD FROM wop WHERE WONUM=:wonum AND QTYREQD IS NOT NULL",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            DBC::execute("INSERT INTO taskdocu (TASKNUM,FILENAME,DESCRIPTION) SELECT :tasknum,FILENAME,DESCRIPTION FROM wodocu WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            $DB->commit();
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
        } // EO try
    } else {    // Only Generic Task exists
        try {
            $DB->beginTransaction();
            DBC::execute("UPDATE wo SET TEXTS_A='No Methods' WHERE WONUM=:wonum AND TEXTS_A IS NULL",array("wonum"=>$pWONUM));
            DBC::execute("DELETE FROM task WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM taskeq WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM tskop WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM tskcraft WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM tskparts WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM task WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            DBC::execute("DELETE FROM taskdocu WHERE TASKNUM=:tasknum",array("tasknum"=>$pTASKNUM));
            # New TASK
            DBC::execute("INSERT INTO task (TASKNUM,DESCRIPTION,WOTYPE,TEXTS_A,LASTEDITDATE) SELECT :tasknum,:description,'PPM',TEXTS_A,NOW() FROM wo WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"description"=>$pDESCRIPTION,"wonum"=>$pWONUM));
            DBC::execute("INSERT INTO taskeq (TASKNUM,EQNUM,LASTPERFDATE,SCHEDTYPE,DATEUNIT,NUMOFDATE) VALUES (:tasknum,'CMMS','20000101','F','D',30)",array("tasknum"=>$pTASKNUM));
            DBC::execute("INSERT INTO tskop (TASKNUM,OPNUM,OPDESC) SELECT :tasknum,OPNUM,OPDESC FROM WOOP WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            DBC::execute("INSERT INTO tskcraft (TASKNUM,OPNUM,CRAFT,TEAM,ESTHRS) SELECT :tasknum,OPNUM,CRAFT,TEAM,ESTHRS FROM WOCRAFT WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            DBC::execute("INSERT INTO tskparts (TASKNUM,ITEMNUM,QTYREQD) SELECT DISTINCT :tasknum,ITEMNUM,QTYREQD FROM WOP WHERE WONUM=:wonum AND QTYREQD IS NOT NULL",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            DBC::execute("INSERT INTO taskdocu (TASKNUM,FILENAME,DESCRIPTION) SELECT :tasknum,FILENAME,DESCRIPTION FROM WODOCU WHERE WONUM=:wonum",array("tasknum"=>$pTASKNUM,"wonum"=>$pTASKNUM));
            $DB->commit();
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
        } // EO try
    }

    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("tasknum",$_REQUEST['TASKNUM']);
    $tpl->assign("wonum",$_REQUEST['WONUM']);
    $tpl->display("workorder2task_end.tpl");    
    break;
} // EO STEP2    
default: {
    require("setup.php");
    require("_wikihelp.php");
    
    $tpl=new smarty_mycmms();
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("wiki",get_wiki_help($_SERVER['SCRIPT_NAME']));
    $tpl->display("workorder2task_form.tpl");
}// EO default
} // EO switch
?>
