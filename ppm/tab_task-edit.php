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

class taskeditPage extends inputPageSmarty {
public function page_content() {
    $DB=DBC::get();
    $sql="SELECT task.TASKNUM,taskeq.EQNUM,task.DESCRIPTION,task.TEXTS_A FROM task LEFT JOIN taskeq ON task.TASKNUM=taskeq.TASKNUM WHERE task.TASKNUM='{$this->input1}' AND taskeq.EQNUM='{$this->input2}'";
    $result=$DB->query($sql);
    $data=$result->fetch(PDO::FETCH_ASSOC);
    
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('data',$data);
    $tpl->display("tab_task-edit.tpl");
} // End page_content
public function process_form() {
    $DB=DBC::get();
    $st=$DB->prepare("UPDATE task SET DESCRIPTION=:DESCRIPTION,TEXTS_A=:TEXTS_A WHERE TASKNUM=:TASKNUM");
    $st->execute(array("TASKNUM"=>$_REQUEST['id1'],"DESCRIPTION"=>$_REQUEST['DESCRIPTION'],"TEXTS_A"=>$_REQUEST['TEXTS_A']));
} // New
} // End class

$inputPage=new taskeditPage();
$inputPage->input1=$_SESSION['Ident_1'];
$inputPage->input2=$_SESSION['Ident_2'];
$inputPage->flow();
?>    