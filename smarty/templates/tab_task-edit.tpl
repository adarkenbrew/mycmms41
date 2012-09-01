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
<input type="hidden" name="id1"   value="{$data.TASKNUM}">
<input type="hidden" name="EQNUM" value="{$data.EQNUM}">
<table width="800">
<tr><td align="right">{t}Task Description{/t}</td>
    <td><input type="text" name="DESCRIPTION" size="70" value="{$data.DESCRIPTION}"></td></tr>
<tr><td align="right">{t}Task Instructions{/t}</td>
    <td><textarea name="TEXTS_A" cols="70" rows="10">{$data.TEXTS_A}</textarea></td></tr>
<tr><td colspan="2">
    <input type="submit" class="submit" value="{t}Save{/t}" name="form_save">
    <input type="submit" class="submit" value="{t}Close{/t}" name="close"></td></tr>
</table>
</form>
