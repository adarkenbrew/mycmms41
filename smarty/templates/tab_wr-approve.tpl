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
<input type="hidden" name="WOPREV" value="0" />
<input type="hidden" name="EXPENSE" value="MAINT" />
<input type="hidden" name="WOTYPE" value="REPAIR" />
<table width="800">
<tr><td align="right">{t}DBFLD_ORIGINATOR{/t}</td>
    <td>{include file="_combobox.tpl" options=$originators NAME="ORIGINATOR" SELECTEDITEM=$data.ORIGINATOR}</td></tr>
<tr><td valign ="top" align="right" width="30%">{t}DBFLD_TASKDESC{/t}</td>
    <td><textarea name="TASKDESC" id="TASKDESC" cols="80" rows="2">{$data.TASKDESC}</textarea></td></tr>
<tr><td align="right">{t}DBFLD_APPROVEDBY{/t}</td>
    <td><input type="text" name="APPROVEDBY" size="15" value="{$user}"></td></tr>
<tr><td align="right">{t}DBFLD_APPROVEDDATE{/t}</td>
    <td>{include file="_calendar.tpl" NAME="APPROVEDDATE" VALUE=$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</td></tr>
<tr><td align="right">{t}DBFLD_WOTYPE{/t}</td>
    <td>{include file="_combobox.tpl" options=$wotypes NAME="WOTYPE" SELECTEDITEM=$data.WOTYPE}</td></tr>    
<tr><td align="right">{t}DBFLD_ESTCOST{/t}</td>
    <td><input type="text" name="ESTCOST" size="5" value="{$data.ESTCOST}"></td></tr>    
<tr><td align="right">{t}DBFLD_ASSIGNEDBY{/t}</td><td align="left">{t}DBFLD_ASSIGNEDTO{/t}</td></tr>
<tr><td align="right">{include file="_combobox.tpl" options=$preparation NAME="ASSIGNEDBY" SELECTEDITEM=$data.ASSIGNEDBY}</td>
    <td align="left">{include file="_combobox.tpl" options=$supervision NAME="ASSIGNEDTO" SELECTEDITEM=$data.ASSIGNEDTO}</td></tr>
<tr><td colspan="2" align="center"><textarea cols="100" rows="10" name="COMMENT">{$data.TEXTS_A}</textarea></td></tr>
<tr><td colspan="2">    
    <input type="submit" value="{t}Save{/t}" name="form_save">
    <input type="submit" value="{t}Save & Close{/t}" name="close"></td></tr>
</table>
</form>

