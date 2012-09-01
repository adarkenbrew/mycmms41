<?php
/** 
* Standalone TASK launching, this script does 3 sequential tasks:
* - Sets the NEXTDUEDATE in every Task (set_nextduedate)
* - Get a list of all active tasks (ACTIVE=0 and NEXTDUEDATE<NOW and no active WO (get_available_tasks)
*
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource
**/
require("../includes/config_mycmms.inc.php");  
require("HTML/Table.php");
require(CMMS_LIB."/class_actionPage.php");
require("setup.php");

$action=new actionPage();
switch ($_REQUEST['STEP']) {
    case "1": {
        $DB=DBC::get();
        $result=$DB->query("SELECT pc.TASKNUM AS 'tasknum',pc.EQNUM AS 'eqnum',t.DESCRIPTION AS 'description',pc.PLANDATE FROM ppmcalendar pc LEFT JOIN task t ON pc.TASKNUM=t.TASKNUM WHERE PLANDATE BETWEEN '{$_REQUEST['START']}' AND '{$_REQUEST['END']}' AND pc.EQNUM LIKE '{$_REQUEST['EQNUM']}' AND pc.WONUM IS NULL");
        if ($result) {
            $tasks=$result->fetchAll(PDO::FETCH_ASSOC);
        }

        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("tasks",$tasks);
        $tpl->display("tasklaunch_calendar_step1.tpl");
        break;
        } // EO STEP1
    case "2": { 
        $DB=DBC::get();
        DBC::execute("UPDATE ppmcalendar SET LAUNCH=-1",array());    // Reset
        for ($c=0; $c < sizeof($_REQUEST['taskid']); $c++) {
            $taskid = split(":",$_REQUEST['taskid'][$c]);
            DBC::execute("UPDATE ppmcalendar SET LAUNCH=1 WHERE TASKNUM=:tasknum AND EQNUM=:eqnum AND PLANDATE=:plandate",array("tasknum"=>$taskid[0],"eqnum"=>$taskid[1],"plandate"=>$taskid[2]));
        }
        $result=$DB->query("SELECT pc.TASKNUM AS 'tasknum',pc.EQNUM AS 'eqnum',pc.PLANDATE AS 'PLANDATE',t.DESCRIPTION AS 'description' FROM ppmcalendar pc LEFT JOIN task t ON pc.TASKNUM=t.TASKNUM WHERE pc.LAUNCH=1 AND pc.WONUM IS NULL");
        if ($result) {
            $tasks=$result->fetchAll(PDO::FETCH_ASSOC);
        }
       
        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("tasks",$tasks);
        $tpl->display("tasklaunch_calendar_step2.tpl");
        break;
    } // EO STEP2
    case "3":   {
        $DB=DBC::get();
        $result=$DB->query("SELECT pc.TASKNUM,pc.EQNUM,pc.PLANDATE,task.DESCRIPTION,task.TEXTS_A FROM ppmcalendar pc LEFT JOIN task ON pc.TASKNUM=task.TASKNUM WHERE pc.WONUM is NULL AND LAUNCH=1");
        if ($result) {
            foreach($result->fetchAll(PDO::FETCH_OBJ) as $task) {
            try {
                $DB->beginTransaction();
                DBC::execute("INSERT INTO wo (WONUM,EQNUM,TASKNUM,TASKDESC,TEXTS_A,WOTYPE,PRIORITY,ORIGINATOR,WOSTATUS,EXPENSE,REQUESTDATE,SCHEDSTARTDATE,APPROVEDDATE,APPROVEDBY) VALUES (NULL,:eqnum,:tasknum,:taskdesc,:texts_a,'PPM',2,'CMMS','PL','MAINT',NOW(),:schedstartdate,NOW(),'CMMS')",array("tasknum"=>$task->TASKNUM,"eqnum"=>$task->EQNUM,"taskdesc"=>$task->DESCRIPTION,"texts_a"=>$task->TEXTS_A,"schedstartdate"=>$task->PLANDATE));
                $new_wo=DBC::fetchcolumn("SELECT LAST_INSERT_ID()",0);
                DBC::execute("INSERT INTO woop (WONUM,OPNUM,OPDESC) SELECT :wonum,OPNUM,OPDESC FROM tskop WHERE TASKNUM=:tasknum",array("wonum"=>$new_wo,"tasknum"=>$task->TASKNUM));
                DBC::execute("INSERT INTO wocraft (WONUM,OPNUM,CRAFT,TEAM,ESTHRS) SELECT :wonum,OPNUM,CRAFT,TEAM,ESTHRS FROM tskcraft WHERE TASKNUM=:tasknum",array("wonum"=>$new_wo,"tasknum"=>$task->TASKNUM));
                DBC::execute("INSERT INTO wop (WONUM,ITEMNUM,QTYREQD) SELECT :wonum,ITEMNUM,QTYREQD FROM tskparts WHERE TASKNUM=:tasknum",array("wonum"=>$new_wo,"tasknum"=>$task->TASKNUM));
                DBC::execute("INSERT INTO wodocu (WONUM,FILENAME,DESCRIPTION) SELECT :wonum,FILENAME,DESCRIPTION FROM taskdocu WHERE TASKNUM=:tasknum",array("wonum"=>$new_wo,"tasknum"=>$task->TASKNUM));
                // Block PPMCalendar
                DBC::execute("UPDATE ppmcalendar SET WONUM=:wonum WHERE TASKNUM=:tasknum AND EQNUM=:eqnum AND PLANDATE=:plandate",array("wonum"=>$new_wo,"eqnum"=>$task->EQNUM,"tasknum"=>$task->TASKNUM,"plandate"=>$task->PLANDATE));;
                // Block TaskEq
                DBC::execute("UPDATE taskeq SET WONUM=:wonum WHERE TASKNUM=:tasknum AND EQNUM=:eqnum",array("wonum"=>$new_wo,"eqnum"=>$task->EQNUM,"tasknum"=>$task->TASKNUM));
                $DB->commit();
            } catch (Exception $e) {
                $DB->rollBack();
                PDO_log("Transaction ".__FILE__." failed: ".$e->getMessage()." (".$task->TASKNUM."/".$task->EQNUM.")");
            }
        } // EO foreach
        } // EO result

        $result=$DB->query("SELECT pc.TASKNUM AS 'tasknum',pc.EQNUM AS 'eqnum',pc.PLANDATE AS 'PLANDATE',t.DESCRIPTION AS 'description',pc.WONUM AS 'WONUM' FROM ppmcalendar pc LEFT JOIN task t ON pc.TASKNUM=t.TASKNUM WHERE pc.LAUNCH=1");
        $tasks=$result->fetchAll(PDO::FETCH_ASSOC);
        
        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("tasks",$tasks);
        $tpl->display("tasklaunch_calendar_end.tpl");
        break;
    } // EO STEP3
    default: {
        require("_wikihelp.php");

        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("stylesheet_calendar",STYLE_PATH."/".CSS_CALENDAR);
        $tpl->assign("machines",array("%","AZ%"));
        $tpl->assign("wiki",get_wiki_help($_SERVER['SCRIPT_NAME']));
        $tpl->display("tasklaunch_calendar_form.tpl");
    } // EO default
}
?>
 
