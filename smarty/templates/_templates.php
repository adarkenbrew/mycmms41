<?php
/**
* Templates for Smarty
* @package DEBUG
* @filesource    
*/
?>
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
<?PHP
// Data retrieval
    $DB=DBC::get();
    $obj_data=$this->get_data($this->input1,$this->input2);
    $data=(array)$obj_data;
    require("setup.php");
    $tpl=new smarty_mycmms();
    $tpl->debugging=false;
    $tpl->assign('stylesheet',STYLE_PATH."/".CSS_SMARTY);
    $tpl->assign('stylesheet_calendar',STYLE_PATH."/".CSS_CALENDAR);
    $tpl->assign('data',$data);
    
// Names of all demanders
    $tpl->assign("originators",$DB->query("SELECT uname as id, longname as text FROM sys_groups ORDER BY uname",PDO::FETCH_NUM));
    $tpl->assign('supervision',$DB->query("SELECT uname AS id, longname AS text FROM sys_groups WHERE (profile & 4)=4",PDO::FETCH_NUM));
    $tpl->assign('preparation',$DB->query("SELECT uname AS id, longname AS text FROM sys_groups WHERE (profile & 8)=8",PDO::FETCH_NUM));
    $tpl->assign("technicians",$DB->query("SELECT uname as id, longname as text FROM sys_groups WHERE (profile & 64=64) ORDER BY uname",PDO::FETCH_NUM));
    $tpl->assign('wotypes',$DB->query("SELECT WOTYPE,DESCRIPTION FROM wotype",PDO::FETCH_NUM));
    $tpl->assign('wostatus',$DB->query("SELECT WOSTATUS AS id,DESCRIPTION AS text FROM wostatus WHERE WOSTATUS IN ({$WOSTATUS_List})",PDO::FETCH_NUM));
?>
<!--
{include file="_combobox.tpl" options=$preparation NAME="ASSIGNEDBY" SELECTEDITEM=$data.ASSIGNEDBY}
{include file="_calendar.tpl" NAME="SCHEDSTART" VALUE=$data.SCHEDSTARTDATE}
{include file="_calendar.tpl" NAME="SCHEDSTART" VALUE=}
-->    