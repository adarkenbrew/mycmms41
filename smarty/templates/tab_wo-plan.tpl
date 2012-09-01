<html>
<head>
<title></title>
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
<input type="hidden" name="ACTION" value="STANDARD">
<input type="hidden" name="id1" value="{$data.WONUM}" />
<input type="hidden" name="id2" value="{$data.EQNUM}" />
<input type="hidden" name="COMMENTS" value="{$data.TEXTS_A}">
<table width="800">
<tr><td align="right">{t}Preparation done by{/t}</td>
    <td>{include file="_combobox.tpl" options=$preparation NAME="ASSIGNEDBY" SELECTEDITEM=$data.ASSIGNEDBY}</td></tr>
<tr><td align="right">{t}Responsible for execution{/t}</td>
    <td>{include file="_combobox.tpl" options=$supervision NAME="ASSIGNEDTO" SELECTEDITEM=$data.ASSIGNEDTO}</td></tr>
<tr><td align="right">{t}Assigned Technician or Company{/t}</td>
    <td>{include file="_combobox.tpl" options=$execution NAME="ASSIGNEDTECH" SELECTEDITEM=$data.ASSIGNEDTECH}</td></tr>
<tr><td align="right">{t}Planned Start Date{/t}</td>
    <td>{include file="_calendar.tpl" NAME="SCHEDSTART" VALUE=$data.SCHEDSTARTDATE}</td></tr>
<tr><td align="right">{t}Estimated Cost{/t}</td><td><input type="text" name="ESTCOST" value="{$data.ESTCOST}"></td></tr>
<tr><td align="right">{t}Workorder Status{/t}<BR>(<I>{$WOSTATUS_Message}</I>)</td>
    <td>{include file="_combobox.tpl" options=$wostatus NAME="WOSTATUS" SELECTEDITEM=$data.WOSTATUS}</td></tr>
<tr><td align="center" colspan="2"><textarea name="PREPARATION" cols="100" rows="10">{$data.TEXTS_A}</textarea></td></tr>
<tr><td align="right" colspan="2">
    <input class="submit" type="submit" value="{t}Save{/t}" name="form_save">
    <input type="submit" class="submit" value="{t}Close{/t}" name="close"></td></tr>
</table>            
</form>

{* SARALEE extension TASKNUM=SPOELEN with 1 operation 900 *}
<form action="{$SCRIPT_NAME}" method="post" class="form" name="spoelen">
<input type="hidden" name="ACTION" value="ADD_OPERATION">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="id1" value="{$data.WONUM}">
<input type="hidden" name="id2" value="{$data.EQNUM}">
<input type="hidden" name="TASKNUM" value="SPOELEN">
<table width="800">
<tr><td>{t}Na werken MOETEN de koffieleidingen steeds gespoeld worden{/t}</td>
    <td align="right"><input type="submit" class="submit" value="{t}Spoelen{/t}" name="form_save"></td></tr>
</table>
</form>

{* Generic Tasks *}
<form action="{$SCRIPT_NAME}" method="post" class="form" name="task2wo">
<input type="hidden" name="ACTION" value="TASK2WO">
<input type="hidden" name="form_save" value="SET">
<table width="800">
<tr><td>{include file="_combobox.tpl" options=$tasklist NAME="TASKNUM" SELECTEDITEM=$data.TASKNUM}</td>
    <td align="right"><input type="submit" class="submit" value="{t}Task Copy{/t}" name="form_save"></td></tr>
</table>    