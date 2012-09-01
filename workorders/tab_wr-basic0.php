<?PHP
/** 
* Urgent Work Request Smarty format
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage request
* @filesource
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_inputPageSmarty.php");

class WR0Page extends inputPageSmarty {
public function validate_form() {
    $_SESSION['form_data']=serialize($_REQUEST);
    $errors = array();
    if ($_SESSION['Ident_1']!="new") { $errors['NO_NEW']=_("WO_Error: New WO is already created"); }
    if (empty($_REQUEST['TASKDESC'])) { $errors['TASKDESC']=_("WO_Error: Please describe the problem/question"); }
    if (empty($_REQUEST['EQNUM'])) { $errors['EQNUM']=_("WO_Error: Select Machine"); }
    if ($_REQUEST['PRIORITY']=="Undefined") { $errors['PRIORITY']=_("WO_Error: Priority must be selected"); }
    if ($_REQUEST['EQNUM']==$_SESSION['dept']) { $errors['EQNUM']=_("WO_Error: Equipment MUST be selected");   }
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
    $tpl = new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('data',$data);
    $tpl->assign('originators',$DB->query("SELECT uname as id, longname as text FROM sys_groups ORDER BY uname",PDO::FETCH_NUM));
    $tpl->assign('originator_preset',$_SESSION['user']);
    $tpl->assign('priorities',$DB->query("SELECT PRIORITY AS id, DESCRIPTION AS text FROM wopriority WHERE PRIORITY IN (0,1,9)",PDO::FETCH_NUM));
    $tpl->display('tab_wr-basic0.tpl');
} // New
public function process_form() {
    // Resetting the values
    unset($_SESSION['form_data']);
    $DB=DBC::get();
    if ($_SESSION['Ident_1']!="new") { return 0; } // Only NEW
    // Form values
    $pEQNUM=$_REQUEST['EQNUM'];$pTASKDESC=$_REQUEST['TASKDESC'];$pORIGINATOR=$_REQUEST['ORIGINATOR'];
    $pWOTYPE=$_REQUEST['WOTYPE'];$pEXPENSE=$_REQUEST['EXPENSE'];$pPRIORITY=$_REQUEST['PRIORITY'];
    // Fixed values for URGENT work
    $pWOPREV=0;$pTASKNUM="NONE";$pAPPROVEDBY="CMMS";$pTEXTS_A="Géén Voorbereiding";$pWOSTATUS="PR";
    $pAPPROVEDDATE=now2string(true);
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

$inputPage=new WR0Page();
$inputPage->data_sql="SELECT wo.*,e.DESCRIPTION FROM wo LEFT JOIN equip e ON wo.EQNUM=e.EQNUM WHERE WONUM={$_SESSION['Ident_1']}";
$inputPage->input1=$_SESSION['Ident_1'];
$inputPage->input2=$_SESSION['Ident_2'];
$inputPage->flow();
?>
