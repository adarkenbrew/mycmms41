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
    $SELECT="SELECT woe.WONUM,wo.EQNUM,wo.TASKDESC,wo.REQUESTDATE,woe.EMPCODE,woe.REGHRS FROM woe LEFT JOIN wo ON woe.WONUM=wo.WONUM WHERE";
    $LOOKUP= " 1 ";    
    $ORDERBY=" ORDER BY woe.WONUM DESC LIMIT 0,100";    
    if ($_REQUEST['LOOK_ASSIGNEDTECH']=="on") {
        $LOOKUP.=" AND woe.EMPCODE='{$_REQUEST['ASSIGNEDTECH']}'";
    }
    if ($_REQUEST['LOOK_WORKPERIOD']=="on") {
        $LOOKUP.=" AND woe.WODATE BETWEEN '{$_REQUEST['DT1']}' AND '{$_REQUEST['DT2']}'";
    }
    if ($_REQUEST['LOOK_EQNUM']=="on") {
        $LOOKUP.=" AND wo.EQNUM LIKE'{$_REQUEST['EQNUM']}%'";
    } 
    $tpl->assign("woes",$DB->query($SELECT.$LOOKUP.$ORDERBY,PDO::FETCH_ASSOC));
    $tpl->display("logbook_hours_list.tpl");
    break;
} // EO STEP1
default: {
    $DB=DBC::get();
    require("_wikihelp.php");
    
    $tpl=new smarty_mycmms();
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign("stylesheet_calendar",STYLE_PATH."/".CSS_CALENDAR);
    $tpl->assign("assignedtechs",$DB->query("SELECT uname,longname FROM sys_groups WHERE profile & 64 <> 0",PDO::FETCH_NUM));
    $tpl->assign("wiki",get_wiki_help($_SERVER['SCRIPT_NAME']));
    $tpl->display("logbook_hours_form.tpl");
    break;
} // EO default
} // EO Switch
?>
