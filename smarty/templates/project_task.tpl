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
<table width="800">
<tr><td align="right">{t}Project Task Description{/t}</td>
    <td><input type="text" name="NAME" size="80" value="{$data.NAME}"}</td></tr>
<tr><td align="right">{t}Project{/t}</td>
    <td>{include file="_combobox.tpl" options=$projects NAME="PROJECTS" SELECTEDITEM=$data.PROJECT}</td></tr>
<tr><td colspan="2" align="left"><textarea cols="120" rows="6" name="REMARKS">{$data.REMARKS}</textarea></td></tr>
<tr><td align="right">{t}Status{/t}</td>
    <td>{include file="_combobox.tpl" options=$project_states NAME="STATUS" SELECTEDITEM=$data.STATUS}</td></tr>
<tr><td align="right">{t}Started{/t}</td>
    <td>{include file="_calendar.tpl" NAME="START" VALUE=$data.START}</td></tr>
<tr><td align="right">{t}Finished{/t}</td>
    <td>{include file="_calendar.tpl" NAME="FINISH" VALUE=$data.FINISH}</td></tr>    
<tr><td colspan="2"><input type="submit" class="submit" value="{t}Save & Close{/t}" name="close"></td></tr>
</table>
</form>
