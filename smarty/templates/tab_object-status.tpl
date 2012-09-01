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
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body onload="setFocus()">
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="id1" value="{$data.EQNUM}">
<table width="800">
<tr><td>{t}DBFLD_STATUS_GEO{/t}</td>
    <td>{include file="_combobox.tpl" options=$geostate NAME="STATUS_GEO" SELECTEDITEM=$data.STATUS_GEO}</td></tr>
<tr><td>{t}DBFLD_STATUS_TECH{/t}</td>
    <td>{include file="_combobox.tpl" options=$techstate NAME="STATUS_TECH" SELECTEDITEM=$data.STATUS_TECH}</td></tr>
<tr><td>{t}DBFLD_STATUS_SAFETY{/t}</td>
    <td>{include file="_combobox.tpl" options=$safetystate NAME="STATUS_SAFETY" SELECTEDITEM=$data.STATUS_SAFETY}</td></tr>
<tr><td colspan="2"><textarea name="INTERVENTION" cols="100" rows="10">{$data.INTERVENTION}</textarea></td></tr>
<tr><td>{t}DBFLD_SCHEDSTARTDATE{/t}</td>
    <td>{include file="_calendar.tpl" NAME="SCHEDSTARTDATE" VALUE=$data.SCHEDSTARTDATE}</td></tr>
<tr><td>{t}DBFLD_DURATION{/t}</td>
    <td><input type="text" name="DURATION" value="{$data.DURATION}"></td></tr>
<tr><td colspan="2"><input type="submit" value="{t}Save{/t}" name="form_save">
                    <input type="submit" value="{t}Close{/t}" name="close"></td></tr>
</form>
</table>
