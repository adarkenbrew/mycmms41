<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
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
<input type="hidden" name="id1" value="{$data.WONUM}">
<table width="600">
<!-- Equipment Tree -->
<tr><td colspan="2"><i>{$data.TASKDESC}</i><BR>{$data.TEXTS_B}</td></tr>
<tr><td align="right"><a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=EQUIP2','EQNUM')">{t}Select equipment{/t}</a></td>
    <td><input type="text" name="EQNUM" size="25" value="{$data.EQNUM}">
        <input type="text" name="DESCRIPTION" size="40" value="{$data.DESCRIPTION}">
<!-- OEE Tree -->
<tr><td align="right"><a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=OEE','OEE')">{t}Select OEE{/t}</a></td>
    <td><input type="text" name="OEE" size="25" value="{$data.RFOCODE}">
        <input type="text" name="OEE_DESCRIPTION" size="40" value="{$data.OEE_DESCRIPTION}"></td></tr>
<!-- RFF Tree -->
<tr><td a align="right"><a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=RFF','RFF')">{t}Reason-For-Faillure{/t}</a></td>
    <td><input type="text" name="RFF" size="25" value="{$data.RFFCODE}">
        <input type="text" name="RFF_DESCRIPTION" size="40" value="{$data.RFFCODEDESC}"></td></tr>
<!-- Timing -->
<tr><td>{t}Start Event{/t}</td>
    <td>{include file="_calendartime.tpl" NAME="DT_START" VALUE=$data.DT_START|date_format:"%Y-%m-%d %H:%M"}</td></tr>
<tr><td>{t}End of Event{/t}</td>
    <td>{include file="_calendartime.tpl" NAME="DT_END" VALUE=$data.DT_END|date_format:"%Y-%m-%d %H:%M"}</td></tr>
<tr><td>{t}DBFLD_DURATION{/t}</td>
    <td>{$data.DT_DURATION}</td></tr>
<tr><td>{t}8D reference{/t}</td>
    <td><input type="text" name="REF8D" size="5" value="{$data.REF8D}">{t} (0 for NEW){/t}</td></tr>      
<tr><td colspan="2">
    <input class="save" type="submit" value="{t}Save{/t}" name="form_save">
    <input type="submit" class="submit" value="{t}Close{/t}" name="close"></td></tr>
</table>
</body>
</html>