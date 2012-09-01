<html>
<head>
<title></title>
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function setFocus() {
    window.focus();
}
</script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body onload="setFocus()">
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="WOTYPE" value="PPM">
<input type="hidden" name="EQNUM" value="CMMS">
<table width="800">
<tr><td valign ="top" align="right">{t}Task Name{/t}</td>
    <td><input type="text" name="TASKNUM" value="{$data.TASKNUM}"></td></tr>
<tr><td align="right">{t}Task Description{/t}</td>
    <td><input type="text" name="DESCRIPTION" value="{$data.DESCRIPTION}"></td></tr>
<tr><td align="right">{t}Long Task Description{/t}</td>
    <td><textarea name="TEXTS_A" cols="72" rows="5">{$data.TEXTS_A}</textarea></td></tr>
<tr><td colspan="2">    
    <input class="submit" type="submit" value="{t}Save{/t}" name="close"></td></tr>
</table>
</form>
