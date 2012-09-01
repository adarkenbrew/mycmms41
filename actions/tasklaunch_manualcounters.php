<?php
/** 
* Standalone TASK launching, this script does 3 sequential tasks:
* - Gets the latest counters
* - Get a list of all active tasks (ACTIVE=0 and LASTCOUNTER<ACTUALCOUNTER and no active WO (get_available_tasks)
*
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource
**/
require("../includes/config_mycmms.inc.php");  
require("setup.php");

switch ($_REQUEST['STEP']) {
    case "1": {
        $DB=DBC::get();
        # Getting last counter state
        $indicators=$DB->query("SELECT wc1.INDICATOR,wc1.VALUE FROM wo_checks wc1, 
            (SELECT MAX(TASKDONE) AS lastrecorded,INDICATOR FROM wo_checks GROUP BY INDICATOR)lastcounters WHERE wc1.INDICATOR=lastcounters.INDICATOR AND wc1.TASKDONE=lastcounters.lastrecorded AND lastcounters.INDICATOR LIKE 'CPM%'",PDO::FETCH_ASSOC);
        # Transfer to table EQCOUNT
        foreach($indicators as $indicator) {
            DBC::execute("UPDATE eqcount SET STATE=:value WHERE COUNTER=:indicator",array("value"=>$indicator['VALUE'],"indicator"=>$indicator['INDICATOR']));
        }
        $tasks=$DB->query("SELECT te.TASKNUM,te.EQNUM,te.COUNTER,te.NUMOFDATE,te.COUNTER,LASTCOUNTER+NUMOFDATE AS 'NEXTDUE',ec.STATE FROM taskeq te LEFT JOIN eqcount ec ON te.COUNTER=ec.COUNTER WHERE SCHEDTYPE='T'",PDO::FETCH_ASSOC);
        
        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("tasks",$tasks);
        $tpl->display("tasklaunch_manualcounters_step1.tpl");
        break;
    }
    case "2":
        $DB=DBC::get();
        $tasks=$DB->query("SELECT te.TASKNUM,te.EQNUM,te.COUNTER,te.WONUM,ec.STATE FROM taskeq te LEFT JOIN eqcount ec ON te.COUNTER=ec.COUNTER WHERE SCHEDTYPE='T' AND te.LASTCOUNTER+te.NUMOFDATE < ec.STATE",PDO::FETCH_ASSOC);
        foreach ($tasks as $task) {
            DBC::execute("UPDATE taskeq SET LAUNCH=1,LASTCOUNTER=:actualcounter WHERE TASKNUM=:tasknum AND EQNUM=:eqnum",array("actualcounter"=>$task['STATE'],"tasknum"=>$task['TASKNUM'],"eqnum"=>$task['EQNUM']));    
        }
    

    
        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("tasks",$tasks);
        $tpl->display("tasklaunch_manualcounters_step2.tpl");
        break;
    default: {
        require("_wikihelp.php");

        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("wiki",get_wiki_help($_SERVER['SCRIPT_NAME']));
        $tpl->display("tasklaunch_manualcounters_form.tpl");
    }
}
?>
