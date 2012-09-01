<?PHP
/** 
* PPM: Linking tasks to machines
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource 
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_inputPageSmarty.php");
$OPNUM_ID=$_REQUEST['ID'];

class taskeqMachines extends inputPageSmarty {
public function page_content() {
    $DB=DBC::get();
    
    $sql="SELECT ID,te.EQNUM,e.DESCRIPTION,te.NUMOFDATE,te.LASTPERFDATE FROM taskeq te LEFT JOIN equip e ON te.EQNUM=e.EQNUM WHERE te.TASKNUM='{$this->input1}'";
    $result=$DB->query($sql);
    $data=$result->fetchAll(PDO::FETCH_ASSOC);
    $labels=array(
    "DBFLD_EQNUM"=>_("DBFLD_EQNUM"),
    "DBFLD_NUMOFDATE"=>_("DBFLD_NUMOFDATE"),
    "DBFLD_LASTPERFDATE"=>_("DBFLD_LASTPERFDATE"),
    "ADD"=>_("Add"),
    "CHANGE"=>_("Change")
    );
       
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('stylesheet_calendar',STYLE_PATH."/".CSS_CALENDAR);
    $tpl->assign('taskeq',$data);
    $tpl->assign('labels',$labels);
    $tpl->assign('actual_id',$_REQUEST['ID']);
    $tpl->display('tab_taskeq-machines.tpl');    
} // End page_content
function process_form() {
    $DB=DBC::get();
    switch ($_REQUEST['ACTION']) {
    case "UPDATE":
        if ($_REQUEST["NUMOFDATE"]==-1) {
            try {
                $DB->beginTransaction();
                # TXID_TASKEQ_DELETE
                $st=DBC::execute("DELETE FROM taskeq where TASKNUM=:tasknum AND EQNUM=:eqnum",array("tasknum"=>$this->input1,"eqnum"=>$_REQUEST['EQNUM']));
                $DB->commit();
            } catch (Exception $e) {
                $DB->rollBack();
                PDO_log("Transaction ".__FILE__." failed: ".$e->getMessage()." (".$task->TASKNUM."/".$task->EQNUM.")");
            } // EO try
        } else {
            try {
                $DB->beginTransaction();
                # TXID_TASKEQ_EDIT
                DBC::execute("UPDATE taskeq SET EQNUM=:eqnum,LASTPERFDATE=:lastperfdate,NUMOFDATE=:numofdate WHERE ID=:id",array("id"=>$_REQUEST['ID'],"eqnum"=>$_REQUEST['EQNUM'],"lastperfdate"=>$_REQUEST['LASTPERFDATE'],"numofdate"=>$_REQUEST['NUMOFDATE']));
                $DB->commit();
            } catch (Exception $e) {
                $DB->rollBack();
                PDO_log("Transaction ".__FILE__." failed: ".$e->getMessage()." (".$task->TASKNUM."/".$task->EQNUM.")");
            } // EO try
        }
        break;
    case "INSERT":
        try {
            $DB->beginTransaction();
            # TXID_TASKEQ_CREATE
            DBC::execute("INSERT INTO taskeq (TASKNUM,EQNUM,NUMOFDATE,SCHEDTYPE,LASTPERFDATE,NEXTDUEDATE,ACTIVE) VALUES (:tasknum,:eqnum,:numofdate,'F',:lastperfdate,:nextduedate,-1)",array("tasknum"=>$this->input1,"eqnum"=>$_REQUEST['EQNUM'],"numofdate"=>$_REQUEST['NUMOFDATE'],"lastperfdate"=>$_REQUEST['LASTPERFDATE'],"nextduedate"=>$_REQUEST['LASTPERFDATE']));
            $DB->commit();
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed: ".$e->getMessage()." (".$task->TASKNUM."/".$task->EQNUM.")");
        } // EO try
        break;
    default:
        break;                           
    }
} // End process_form
} // End class newPage

$inputPage=new taskeqMachines();
$inputPage->flow();
?>
