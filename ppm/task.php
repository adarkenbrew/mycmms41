<?PHP
/** 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40_ppm
* @subpackage ppm
* @filesource
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_inputPageSmarty.php");

class PPMtaskPage extends inputPageSmarty {
public function validate_form() {
    $_SESSION['form_data']=serialize($_REQUEST);
    $errors = array();
    if (empty($_REQUEST['TASKNUM'])) { $errors['TASKNUM']=_("TASK_Error: TASKNUM cannot be empty"); }
    if (empty($_REQUEST['DESCRIPTION'])) { $errors['DESCRIPTION']=_("TASK_Error: TASK description cannot be empty"); }
    if (empty($_REQUEST['TEXTS_A'])) { $errors['TEXTS_A']=_("TASK_Error: Describe the work to be done briefly here"); }
    return $errors;
}
public function page_content() {
    $data=unserialize($_SESSION['form_data']);
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('data',$data);
    $tpl->display("task.tpl");
}
function process_form() {  
    unset($_SESSION['form_data']);
    $DB=DBC::get();
    try {
        $DB->beginTransaction();
        DBC::execute("INSERT INTO task (TASKNUM,DESCRIPTION,TEXTS_A,WOTYPE) VALUES (:tasknum,:short_description,:long_description,:wotype)",array("tasknum"=>$_REQUEST['TASKNUM'],"short_description"=>$_REQUEST['DESCRIPTION'],"long_description"=>$_REQUEST['TEXTS_A'],"wotype"=>$_REQUEST['WOTYPE']));
        DBC::execute("INSERT INTO taskeq(TASKNUM,EQNUM,SCHEDTYPE,LASTPERFDATE,NEXTDUEDATE,DATEUNIT,NUMOFDATE,LAUNCH,ACTIVE) VALUES (:tasknum,:eqnum,'F','20000101','20000101','D',30,-1,-1)",array("tasknum"=>$_REQUEST['TASKNUM'],"eqnum"=>$_REQUEST['EQNUM']));
        $DB->commit();
    } catch (Exception $e) {
        $DB->rollBack();
        PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
    }
}
}
 
$inputPage=new PPMtaskPage();
$inputPage->flow();