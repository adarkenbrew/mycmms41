<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function setFocus() {
    window.focus();
}
</script>
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
</head>
<body onload="setFocus()">
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="WOTYPE" value="REPAIR" />
<input type="hidden" name="WONUM" value="{$data.WONUM}">
<table width="600">
<tr><td>{t}CT{/t}</td><td>{$data.CT}</td></tr>
<tr><td>{t}DBFLD_WONUM{/t}</td><td><b>{$data.WONUM}</b></td></tr>
<tr><td></td></tr>
<tr><td>{t}DBFLD_PRIORITY{/t}</td>
    <td><input type="text" name="PRIORITY" size="3" value="0"></td></tr>
<tr><td>{t}DT Duration{/t}</td>
    <td><b>{$data.DT_DURATION}</b></td></tr>    
{if $data.WONUM eq NULL}
<tr><td>{t}Start Event{/t}</td>
    <td>{include file="_calendartime.tpl" NAME="DT_START" VALUE=$smarty.now|date_format:"%Y-%m-%d %H:%M"}</td></tr>
<tr><td>{t}End of Event{/t}</td>
    <td>{include file="_calendartime.tpl" NAME="DT_END" VALUE=$smarty.now|date_format:"%Y-%m-%d %H:%M"}</td></tr>
{else}
<tr><td>{t}Start Event{/t}</td>
    <td><b>{$data.DT_START|date_format:"%Y-%m-%d %H:%M"}</b></td></tr>
<tr><td>{t}End of Event{/t}</td>
    <td><b>{$data.DT_END|date_format:"%Y-%m-%d %H:%M"}</b></td></tr>
{/if}    
<tr><td colspan="2" align="center"><input class="submit" type="submit" value="{t}Generate Work Order{/t}" name="form_save"></td></tr>
</table>
</form>
