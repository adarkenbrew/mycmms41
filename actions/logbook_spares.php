<?php
/**
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage logbook
* @filesource
*/
require("../includes/config_mycmms.inc.php");
require("setup.php");
require("lib_queries.php");

switch ($_REQUEST['STEP']) {
case "1": {
    $DB=DBC::get();
    $tpl=new smarty_mycmms();
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    
    if ($_REQUEST['LOOK_TEXT']=="on") {
        $tpl->assign("spares",$DB->query("SELECT i.ITEMNUM,i.DESCRIPTION,i.NOTES,s.LOCATION FROM invy i LEFT JOIN stock s ON i.ITEMNUM=s.ITEMNUM WHERE DESCRIPTION LIKE '%{$_REQUEST['TEXT']}%'",PDO::FETCH_ASSOC));
    }
    if ($_REQUEST['LOOK_BOM']=="on") {
        $sparecode=DBC::fetchcolumn("SELECT SPARECODE FROM equip WHERE EQNUM='{$_REQUEST['EQNUM']}'",0);
        $tpl->assign("spares",$DB->query("SELECT sp.ITEMNUM,i.DESCRIPTION,s.LOCATION FROM spares sp LEFT JOIN invy i ON sp.ITEMNUM=i.ITEMNUM LEFT JOIN stock s ON i.ITEMNUM=s.ITEMNUM WHERE sp.SPARECODE='$sparecode'",PDO::FETCH_ASSOC));
    }
    if ($_REQUEST['LOOK_SAP']=="on") {
        $tpl->assign("spares",$DB->query("SELECT i.ITEMNUM,i.DESCRIPTION,i.NOTES,s.LOCATION FROM invy i LEFT JOIN stock s ON i.ITEMNUM=s.ITEMNUM WHERE i.SAP LIKE '{$_REQUEST['SAP']}'",PDO::FETCH_ASSOC));
        // WOP
        if ($_REQUEST['WOP']=="on") {
            $tpl->assign("with_wo",true);
            $tpl->assign("wos",$DB->query("SELECT wop.ITEMNUM,wo.WONUM,wo.EQNUM,wo.TASKDESC,wo.REQUESTDATE,wop.QTYREQD,wop.QTYUSED FROM wop LEFT JOIN wo ON wop.WONUM=wo.WONUM WHERE wop.ITEMNUM='{$_REQUEST['SAP']}' ORDER BY wo.WONUM DESC LIMIT 0,100",PDO::FETCH_ASSOC));
        }
    } 
    $tpl-
    $tpl->display("logbook_spares_list.tpl");
    break;
} // EO STEP1
default: {
    $DB=DBC::get();
    require("_wikihelp.php");
    
    $tpl=new smarty_mycmms();
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("wiki",get_wiki_help($_SERVER['SCRIPT_NAME']));
    $tpl->display("logbook_spares_form.tpl");
    break;
} // EO default
} // EO Switch
?>
