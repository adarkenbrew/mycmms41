<?php
/** 
* Report feedback
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage work
* @filesource
* @link http://localhost/_documentation/mycmms40_lib/
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_inputPageSmarty.php");
if ($_SESSION['Ident_1']=="new") {
    echo "<p>First Save</p>";
    exit();
}

class woFeedbackCommentsPage extends inputPageSmarty {
public function validate_form() {
    if ($_POST['close']) {
        if ($_POST['NEXTACTION']=="REVISION" AND empty($_POST['NEXTWO'])) {   
            $errors['NEXTWO']=_("WO_ERROR: On Revision, you should describe the work that must be done");
        }
        if (empty($_POST['ASSIGNEDTECH'])) {   
            $errors['ASSIGNEDTECH']=_("WO_Error: Please select your name");
        }
        if (empty($_POST['COMMENT'])) {   
            $errors['COMMENT']=_("WO_ERROR: We expect some feedback here");
        }
    }
    return $errors;
} // EO Validation
public function page_content() {
    $obj_data=$this->get_data($this->input1,$this->input2);
    $data=(array)$obj_data;

    require("setup.php");
    $tpl = new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->caching=false;
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('pageTitle',_("Maintenance Workorder")."#".$_SESSION['Ident_1']);
    $tpl->assign('data',$data);
    $tpl->assign('ASSIGNEDTECH',$_SESSION['user']);
    $tpl->display('tab_wo-feedback2a.tpl');
} // EO Displaying
public function process_form() {
    $pWONUM=$_REQUEST['id1'];
    $pASSIGNEDTECH=$_REQUEST['ASSIGNEDTECH'];
    $date=getdate();
    $TimeStamp="<BR>\n".$date['year']."-".$date['mon']."-".$date['mday']." ".$date['hours'].":".$date['minutes']." : ";
    $NEW_COMMENT=$TimeStamp."(".$pASSIGNEDTECH.") ".$_REQUEST['COMMENT'];
    $DB=DBC::get();
    switch ($_REQUEST['NEXTACTION']) {
    case "INTERMEDIATE":
        try {
            $DB->beginTransaction();
            DBC::execute("INSERT INTO wo_assign (ID,WONUM,ASSIGNEDTECH,ENDED) VALUES (NULL,:wonum,:assignedtech,NOW())",array("wonum"=>$pWONUM,"assignedtech"=>$pASSIGNEDTECH));
            DBC::execute("UPDATE wo SET TEXTS_B=CONCAT(TEXTS_B,:feedback) WHERE WONUM=:wonum",array("wonum"=>$pWONUM,"feedback"=>$NEW_COMMENT));
            $DB->commit();        
            return __FILE__." OK";
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
        }  
        $message=_("Intermediate Report for ").$pWONUM._(" is registered");
        break;
    case "END":
        try {
            $DB->beginTransaction();
            DBC::execute("INSERT INTO wo_assign (ID,WONUM,ASSIGNEDTECH,ENDED) VALUES (NULL,:wonum,:assignedtech,NOW())",array("wonum"=>$pWONUM,"assignedtech"=>$pASSIGNEDTECH));
            DBC::execute("UPDATE wo SET TEXTS_B=CONCAT(TEXTS_B,:feedback),COMPLETIONDATE=NOW(),WOSTATUS='F' WHERE WONUM=:wonum",array("wonum"=>$pWONUM,"feedback"=>$NEW_COMMENT));
            if ($_REQUEST['TASKNUM']!="NONE") {
                DebugBreak();
                $pTASKNUM=$_REQUEST['TASKNUM'];
                $pEQNUM=$_REQUEST['EQNUM'];
                # Recalculate NEXTDUEDATE
                require("TXID_TASK_RESET.php");
                # Generate Next PPM WO
                # require("TXID_TASK2WO.php");
            } # If PPM task
            $DB->commit();
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
        }  
        $message=_("Workorder ".$pWONUM." is finished");
        break;
    case "REVISION":
        try {
            $DB->beginTransaction();        
            DBC::execute("INSERT INTO wo_assign (ID,WONUM,ASSIGNEDTECH,ENDED) VALUES (NULL,:wonum,:assignedtech,NOW())",array("wonum"=>$pWONUM,"assignedtech"=>$pASSIGNEDTECH));
            DBC::execute("UPDATE wo SET TEXTS_B=CONCAT(TEXTS_B,:feedback),COMPLETIONDATE=NOW(),WOSTATUS='F' WHERE WONUM=:wonum",array("wonum"=>$pWONUM,"feedback"=>$NEW_COMMENT));
            if ($_REQUEST['TASKNUM']!="NONE") {
                # Recalculate NEXTDUEDATE
                require("TXID_1002.php");
                # Generate Next PPM WO
                # require("TXID_1003.php");
            } # If PPM task
            DBC::execute("INSERT INTO wo (WONUM,EQNUM,WOPREV,REQUESTDATE,TASKNUM,TASKDESC,TEXTS_A,TEXTS_B,ORIGINATOR,WOTYPE, EXPENSE,PRIORITY,CLOSEDATE,COMPLETIONDATE,SCHEDSTARTDATE,APPROVEDBY,APPROVEDDATE,WOSTATUS) VALUES (NULL,:eqnum,:woprev,NOW(),'NONE',:taskdesc,'Method:','Feedback',:originator,'REPAIR','MAINT','2','1900-01-01','1900-01-01',NOW(),:approvedby,'1900-01-01','R')",array("eqnum"=>$_REQUEST['EQNUM'],"woprev"=>$this->input1,"taskdesc"=>$_REQUEST['NEXTWO'],"originator"=>$_SESSION['user'],"approvedby"=>$_SESSION['APPROVER']));
    #        DBC::execute("CALL WO_CREATE_V2(:eqnum,:woprev,:tasknum,:taskdesc,:originator,:wotype,:expense,:priority,:approvedby,:methods)",array("eqnum"
            $rev_wo=DBC::fetchcolumn("SELECT LAST_INSERT_ID()",0);
            DBC::execute("UPDATE wo LEFT JOIN wo w2 ON wo.WOPREV=w2.WONUM SET wo.TEXTS_A=w2.TEXTS_B WHERE wo.WONUM=:newwo",array("newwo"=>$rev_wo));
            DBC::execute("UPDATE wo SET WONEXT=:wonext WHERE WONUM=:wonum",array("wonext"=>$rev_wo,"wonum"=>$pWONUM));
            $DB->commit();
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
        } 
        $message=_("Created Revision Workorder:").$new_wo;
        break;
    } // EO switch 
if ($_REQUEST['EQNUM']!=$_REQUEST['OLD']) {
    try {
        $DB->beginTransaction();    
        DBC::execute("UPDATE wo SET EQNUM=:eqnum WHERE WONUM=:wo",array("wonum"=>$pWONUM,"eqnum"=>$_REQUEST['EQNUM']));
        DBC::execute("UPDATE wo LEFT JOIN equip ON wo.EQNUM=equip.EQNUM SET wo.EQLINE=equip.EQROOT WHERE WONUM=:wonum",array("wonum"=>$pWONUM));
    } catch (Exception $e) {
        $DB->rollBack();
        PDO_log("Transaction ".__FILE__." failed".$e->getMessage());
    } 
    $message.=" / "._("Changed Machine-Function");
}
return $message;
} // process_form
} // End class

$inputPage=new woFeedbackCommentsPage();
$inputPage->input1=$_SESSION['Ident_1'];
$inputPage->input2="";
$inputPage->data_sql="SELECT wo.*,equip.DESCRIPTION FROM wo LEFT JOIN equip ON wo.EQNUM=equip.EQNUM WHERE wo.WONUM={$inputPage->input1}";
$inputPage->flow();
?>
