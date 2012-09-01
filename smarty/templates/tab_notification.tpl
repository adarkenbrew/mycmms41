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
<input type="hidden" name="WOTYPE" value="REPAIR" />
<table width="800">
<tr><td align="right">{t}CT{/t}</td>
    <td><input type="text" name="CT" value="{$data.CT}"></td></tr>
<tr><td align="right">{t}Reported by{/t}</td>
    <td>{include file="_combobox.tpl" options=$notifiers NAME="NOTIFIER" SELECTEDITEM=$data.NOTIFIER}</td></tr>
<tr><th align="right">{t}Notification Time{/t}</th>
    <th align="left">{t}End of Notification{/t}</th></tr>
<tr><td align="right">{include file="_calendartime.tpl" NAME="NOTIFDATE" VALUE="{$data.NOTIFDATE}"}</td>
    <td align="left">{include file="_calendartime.tpl" NAME="NOTIFDATE_END" VALUE="{$data.NOTIFDATE_END}"}</td></tr>
<tr><td>{t}Notification{/t}</td>
    <td><textarea name="NOTIFICATION" cols="70" rows="2">{$data.NOTIFICATION}</textarea>
<tr><td>{t}Notification (Long Text){/t}</td>
    <td><textarea name="LNOTIFICATION" cols="70" rows="4">{$data.LNOTIFICATION}</textarea></td></tr>
<tr><td align="right">{t}Type of notification{/t}</td>
    <td>{include file="_combobox.tpl" options=$notiftypes NAME="NOTIFTYPE" SELECTEDITEM=$data.NOTIFTYPE}</td></tr>

<!-- Equipment Tree -->
<tr><td align="right"><a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=EQUIP2','EQNUM')">{t}Select equipment{/t}</a></td>
    <td><input type="text" name="EQNUM" value="{$data.EQNUM}"><input type="text" name="DESCRIPTION" value="{$data.DESCRIPTION}"></td></tr>
<tr><td colspan="2">    
    <input class="submit" type="submit" value="{t}Save{/t}" name="form_save">
    <input class="submit" type="submit" value="{t}Close{/t}" name="close"></td></tr>
</table>