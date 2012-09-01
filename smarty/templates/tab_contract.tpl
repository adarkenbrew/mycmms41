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
<table>
<tr><td><b>{$client_data.CLID}</b></td><td colspan="2">{$client_data.NAME}</td></tr>
<tr><td>{$client.CONTACT}</td><td>{$client.PHONE}</td><td>{$client.EMAIL}</td></tr>
<tr><td>{$client_data.ADDRESS}</td><td>{$client_data.POSTCODE}</td><td>{$client_data.CITY}</td></tr>
<tr><td><b>{$data.CLMCHID}</b></td><td>{$data.EXCEL}</td><td>{$data.DESCRIPTION}</td></tr>
</table>

<hr>

<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="id1"   value="{$data.CLID}">
<input type="hidden" name="id2" value="{$data.CLMCHID}">
<table width="800">
<tr><td align="right">{t}CLID: {/t}</td>
    <td>{$client_data.NAME}</td></tr>
<tr><td align="right">{t}Machine Contract Conditions{/t}</td>
    <td><textarea name="CONDITIONS" cols="70" rows="10">{$data.CONDITIONS}</textarea></td></tr>
<tr><td></td><td>{include file="_combobox.tpl" options=$machines NAME="EQNUM" SELECTEDITEM=$data.CLMCHID}</td></tr>    
<tr><td colspan="2">
    <input type="submit" class="submit" value="{t}Save{/t}" name="form_save">
    <input type="submit" class="submit" value="{t}Close{/t}" name="close"></td></tr>
</table>
</form>
