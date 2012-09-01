<?PHP
/** 
* Change Type-of and interval of PPM
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_inputPageSmarty.php");

class taskeqFrequencyPage extends inputPageSmarty {
public function page_content() {
    $data=$this->get_data($this->input1,$this->input2);
    
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('stylesheet_calendar',STYLE_PATH."/".CSS_CALENDAR);
    $tpl->assign('data',$data);
    $tpl->display('tab_taskeq-frequency.tpl');
} // End page_content
public function process_form() {
    $DB=DBC::get();
    try {
        $DB->beginTransaction();
        switch ($_REQUEST['SCHEDTYPE']) {
        case 'F':   // Floating
            DBC::execute("UPDATE taskeq SET NUMOFDATE=:numofdate,SCHEDTYPE=:schedtype,LASTPERFDATE=:lastperfdate WHERE TASKNUM=:tasknum AND EQNUM=:eqnum",array("tasknum"=>$_REQUEST['id1'],"eqnum"=>$_REQUEST['EQNUM'],"numofdate"=>$_REQUEST['NUMOFDATE'],"lastperfdate"=>$_REQUEST['LASTPERFDATE'],"schedtype"=>$_REQUEST['SCHEDTYPE']));
            break;
        case 'X':   // Fixed
            DBC::execute("UPDATE taskeq SET NUMOFDATE=:numofdate,SCHEDTYPE=:schedtype,LASTPERFDATE=:lastperfdate,NEXTDUEDATE=:nextduedate WHERE TASKNUM=:tasknum AND EQNUM=:eqnum",array("tasknum"=>$_REQUEST['id1'],"eqnum"=>$_REQUEST['EQNUM'],"numofdate"=>$_REQUEST['NUMOFDATE'],"lastperfdate"=>$_REQUEST['LASTPERFDATE'],"nextduedate"=>$_REQUEST['NEXTDUEDATE'],"schedtype"=>$_REQUEST['SCHEDTYPE']));
            break;
        case 'T':
            DBC::execute("UPDATE taskeq SET NUMOFDATE=:numofdate,SCHEDTYPE=:schedtype,COUNTER=:counter,LASTCOUNTER=:lastcounter WHERE TASKNUM=:tasknum AND EQNUM=:eqnum",array("tasknum"=>$_REQUEST['id1'],"eqnum"=>$_REQUEST['EQNUM'],"numofdate"=>$_REQUEST['NUMOFDATE'],"counter"=>$_REQUEST['COUNTER'],"lastcounter"=>$_REQUEST['LASTCOUNTER'],"schedtype"=>$_REQUEST['SCHEDTYPE']));
            break;
        }
        if ($_REQUEST['ACTIVATE']=="on") {
            $st=$DB->prepare("UPDATE taskeq SET ACTIVE=1 WHERE TASKNUM=:tasknum AND EQNUM=:eqnum");
            $st->execute(array("tasknum"=>$_REQUEST['id1'],"eqnum"=>$_REQUEST['EQNUM']));
        } else {
            $st=$DB->prepare("UPDATE taskeq SET ACTIVE=-1 WHERE TASKNUM=:tasknum AND EQNUM=:eqnum");
            $st->execute(array("tasknum"=>$_REQUEST['id1'],"eqnum"=>$_REQUEST['EQNUM']));
        }
        $DB->commit(); 
    } catch (Exception $e) {
        $DB->rollBack();
        PDO_log("Transaction ".__FILE__." failed: ".$e->getMessage());
    } 
} // End process_form
} // End class

$inputPage=new taskeqFrequencyPage();
$inputPage->data_sql="SELECT task.*,taskeq.EQNUM,taskeq.NUMOFDATE,taskeq.LASTPERFDATE,taskeq.NEXTDUEDATE,taskeq.SCHEDTYPE,taskeq.COUNTER,taskeq.LASTCOUNTER,taskeq.ACTIVE,equip.DESCRIPTION AS 'EQDESC' FROM task LEFT JOIN taskeq ON task.TASKNUM=taskeq.TASKNUM LEFT JOIN equip ON taskeq.EQNUM=equip.EQNUM WHERE task.TASKNUM='{$inputPage->input1}' AND taskeq.EQNUM='{$inputPage->input2}'";
$inputPage->flow();
?>    