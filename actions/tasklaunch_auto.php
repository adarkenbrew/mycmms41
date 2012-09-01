<?php
/**
* Automatic task launching, this script does 3 sequential tasks:
* - Sets the NEXTDUEDATE in every Task (TXID_6016)
* - Get a list of all active tasks (ACTIVE=0 and NEXTDUEDATE<NOW and no active WO (get_available_tasks)
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource
*/
set_time_limit(0);  // No time limit...
require("../includes/config_mycmms.inc.php");  

$fh=fopen(LAUNCH_LOG,"a+");
$DB=DBC::get();
/** Sequence is straightforward:
* - Make sure all dates are refreshed 
*/
require("TXID_SET_NEXTDUEDATE.php");
/**
* Make list...
*/
$result=$DB->query("SELECT task.TASKNUM AS 'TASKNUM',EQNUM AS 'EQNUM' FROM task LEFT JOIN taskeq ON task.TASKNUM=taskeq.TASKNUM WHERE ACTIVE=1 AND NEXTDUEDATE<ADDDATE(NOW(),INTERVAL 7 DAY) AND taskeq.WONUM IS NULL AND SCHEDTYPE IN ('F','X')");
fwrite($fh,"Log AutoLauncher:".now2string(true)."\n");
$i=0;
if ($result) {
    foreach($result->fetchAll(PDO::FETCH_OBJ) as $row) {
        $pTASKNUM=$row->TASKNUM; $pEQNUM=$row->EQNUM;
        try{
            $DB->beginTransaction();
            $pTASKNUM=$row->TASKNUM; $pEQNUM=$row->EQNUM;
            require("TXID_TASK2WO.php");
            $DB->commit();
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
        }
        fwrite($fh,$i.":".$row->TASKNUM." for machine ".$row->EQNUM." into ".$new_wo."\n");
        $i++;
    }
} else {
    fwrite($fh,"No new tasks found");
}
fwrite($fh,"Found ".$i." tasks to launch\n");
fclose($fh);
# Blocked
if (false) {
    $fh=fopen(LAUNCH_LOG,"r");
    $content=fread($fh,filesize(LAUNCH_LOG));
    echo "<pre>".$content."</pre>";
}  

# data
$result=$DB->query("SELECT wo.*,e.DESCRIPTION FROM wo LEFT JOIN equip e ON wo.EQNUM=e.EQNUM WHERE REQUESTDATE > ADDDATE(NOW(),INTERVAL -1 DAY) AND TASKNUM<>'NONE'");
$data=$result->fetchAll(PDO::FETCH_ASSOC);
# labels
require("setup.php");
$tpl=new smarty_mycmms();
$tpl->debugging=false;
$tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
$tpl->assign('data',$data);
$tpl->display("tasklaunch_auto.tpl");

set_time_limit(30);
?>

