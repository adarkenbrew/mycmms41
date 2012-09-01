<?PHP
/** 
* Planable work
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage request
* @filesource
* @todo Use Smarty
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_inputPageSmarty.php");

class WR2Page extends inputPageSmarty {
public function validate_form() {
    $_SESSION['form_data']=serialize($_REQUEST);
    $errors = array();
    if ($_SESSION['Ident_1']!="new") { $errors['NO_NEW']=_("WO_Error: New WO already created"); }
    if (empty($_REQUEST['TASKDESC'])) { $errors['TASKDESC']=_("WO_Error: Please describe the problem/question"); }
    if (empty($_REQUEST['EQNUM'])) { $errors['EQNUM']=_("WO_Error: Select Object"); }
    if ($_REQUEST['PRIORITY']=="Undefined") { $errors['PRIORITY']=_("WO_Error: Priority must be selected"); }
    if ($_REQUEST['WOTYPE']=="Undefined") { $errors['WOTYPE']=_("WO_Error: Type of Work must be selected"); }
    if ($_REQUEST['EQNUM']==$_SESSION['dept']) {    $errors['EQNUM']=_("WO_Error: Equipment MUST be selected");   }
    return $errors;
} // New
public function page_content() {
    $DB=DBC::get();
    if ($_SESSION['Ident_1']=="new") {  // New demand or adding missing information
        $data=unserialize($_SESSION['form_data']);
    } 
    if ($_SESSION['Ident_1']>100000) {  
        $obj_data=$this->get_data($_SESSION['Ident_1'],$_SESSION['Ident_2']);
        $data=(array)$obj_data;
    }
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('stylesheet_calendar',STYLE_PATH."/".CSS_CALENDAR);
    $tpl->assign("data",$data);
    $tpl->assign("user",$_SESSION['user']);
    $tpl->assign("originators",$DB->query("SELECT uname as id, longname as text FROM sys_groups ORDER BY uname",PDO::FETCH_NUM));
    $tpl->assign("technicians",$DB->query("SELECT uname as id, longname as text FROM sys_groups WHERE (profile & 64=64) ORDER BY uname",PDO::FETCH_NUM));
    $tpl->assign("priorities",$DB->query("SELECT PRIORITY,DESCRIPTION FROM wopriority WHERE PRIORITY IN (2,3,4)",PDO::FETCH_NUM));
    $tpl->assign("wotypes",$DB->query("SELECT WOTYPE,DESCRIPTION FROM wotype",PDO::FETCH_NUM));
    $tpl->display("tab_wr-basic2.tpl");
} // New
public function process_form() {
    // Resetting the values
    unset($_SESSION['form_data']);
    $DB=DBC::get();
    if ($_SESSION['Ident_1']!="new") { return 0; } // Only NEW
    // Form values
    $pEQNUM=$_REQUEST['EQNUM'];$pTASKDESC=$_REQUEST['TASKDESC'];$pORIGINATOR=$_REQUEST['ORIGINATOR'];
    $pWOTYPE=$_REQUEST['WOTYPE'];$pEXPENSE=$_REQUEST['EXPENSE'];$pPRIORITY=$_REQUEST['PRIORITY'];
    $pAPPROVEDBY=$_SESSION['APPROVER'];$pAPPROVEDDATE=$pAPPROVEDDATE="1900-01-01";$pTEXTS_A=$_REQUEST['TEXTS_A'];
    // Fixed values
    $pWOPREV=0;$pTASKNUM="NONE";$pWOSTATUS="R";
    try {
        $DB->beginTransaction();
        require("TXID_WO_CREATE.php"); 
        $DB->commit();
    } catch (Exception $e) {
        $DB->rollBack();
        PDO_log("Transaction ".__FILE__." failed: ".$e->getMessage());
    }       
    $_SESSION['Ident_1']=$new_wo;
    $_SESSION['Ident_2']=$pEQNUM;
    $this->input1=$new_wo;
    $this->input2=$pEQNUM;
} // New
} // End class

$inputPage=new WR2Page();
$inputPage->data_sql="SELECT wo.*,e.DESCRIPTION FROM wo LEFT JOIN equip e ON wo.EQNUM=e.EQNUM WHERE WONUM={$_SESSION['Ident_1']}";
$inputPage->flow();
?>