<?PHP
/** 
* Edit Work Order base data
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage work
* @filesource
* @link http://localhost/_documentation/mycmms40_lib/
* @todo DB Transaction 
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_inputPageSmarty.php");

class thisPage extends inputPageSmarty {
public function page_content() {
    $DB=DBC::get();
    $data=$this->get_data($this->input1,$this->input2);
        
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->caching=false;
    $tpl->debugging=false;
    $tpl->assign('data',$data);
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("priorities",$DB->query("SELECT PRIORITY AS id, DESCRIPTION AS text FROM wopriority",PDO::FETCH_NUM));
    $tpl->assign('wotypes',$DB->query("SELECT WOTYPE AS id, DESCRIPTION AS text FROM wotype",PDO::FETCH_NUM));
    $tpl->assign('budgets',$DB->query("SELECT EXPENSE AS id, DESCRIPTION AS text FROM expense",PDO::FETCH_NUM));
    $tpl->assign('projects',$DB->query("SELECT PROJECTID AS id, PROJECTTASK AS text FROM projects",PDO::FETCH_NUM));    
    $tpl->assign('previous_wos',$DB->query("SELECT WONUM AS id, CONCAT(WONUM,':',TASKDESC) AS text FROM wo WHERE WOTYPE='PPM' AND WOSTATUS='P'",PDO::FETCH_NUM));    
    $tpl->display("tab_wo-basic.tpl");
} // End page_content
public function process_form() {
    $DB=DBC::get();
    try {
        $DB->beginTransaction();            
        DBC::execute("UPDATE wo SET WOPREV=:woprev,TASKDESC=:taskdesc,WOTYPE=:wotype,EXPENSE=:expense,PROJECTID=:projectid,PRIORITY=:priority WHERE WONUM=:wonum",array("woprev"=>$_REQUEST['WOPREV'],"taskdesc"=>$_REQUEST['TASKDESC'],"wotype"=>$_REQUEST['WOTYPE'],"expense"=>$_REQUEST['EXPENSE'],"projectid"=>$_REQUEST['PROJECTID'],"priority"=>$_REQUEST['PRIORITY'],"wonum"=>$_REQUEST['id1']));
    
        if ($_REQUEST['EQNUM']!=$_REQUEST['OLD']) {
            DBC::execute("UPDATE wo SET EQNUM=:eqnum WHERE WONUM=:wonum",array("wonum"=>$_REQUEST['id1'],"eqnum"=>$_REQUEST['EQNUM']));
            DBC::execute("UPDATE wo LEFT JOIN equip ON wo.EQNUM=equip.EQNUM SET wo.EQLINE=equip.EQROOT WHERE WONUM=:wonum",array("wonum"=>$_REQUEST['id1']));
            $_SESSION['id2']=$_REQUEST['EQNUM'];  
            DBC::execute("UPDATE wo SET COMPONENT='' WHERE WONUM=:wonum",array("wonum"=>$_REQUEST['id1']));  
        }
        if ($_REQUEST['COMPONENT']!=$_REQUEST['OLD_COMP']) {
            DBC::execute("UPDATE wo SET COMPONENT=:component WHERE WONUM=:wonum",array("component"=>$_REQUEST['COMPONENT'],"wonum"=>$_REQUEST['id1']));  
        }
        $DB->commit();
    } catch (Exception $e) {
        $DB->rollBack();
        PDO_log("Transaction ".__FILE__." failed: ".$e->getMessage());
    }        
} // EO process_form
} // End class

$inputPage=new thisPage();
$inputPage->data_sql="SELECT wo.*,wo.EQNUM AS OLD,equip.DESCRIPTION FROM wo LEFT JOIN equip ON wo.EQNUM=equip.EQNUM WHERE wo.WONUM={$inputPage->input1}";
$inputPage->flow();
?>

