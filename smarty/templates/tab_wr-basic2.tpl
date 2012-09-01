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
<tr><td valign ="top" align="right" width="30%">{t}Workorder Task Description{/t}</td>
    <td><textarea name="TASKDESC" id="TASKDESC" cols="80" rows="4">{$data.TASKDESC}</textarea></td></tr>
<tr><td align="right">{t}DBFLD_ORIGINATOR{/t}</td><td>{t}DBFLD_ASSIGNEDTECH{/t}</td></tr>
<tr><td align="right">{include file="_combobox.tpl" options=$originators NAME="ORIGINATOR" SELECTEDITEM=$user}</td>
    <td>{include file="_combobox.tpl" options=$technicians NAME="ASSIGNEDTECH" SELECTEDITEM=$user}</td></tr>
<tr><td align="right">{t}DBFLD_PRIORITY{/t}</td>
    <td>{include file="_combobox.tpl" options=$priorities NAME="PRIORITY" SELECTEDITEM=""}</td></tr>
<tr><td align="right">{t}DBFLD_WOTYPE{/t}</td>
    <td>{include file="_combobox.tpl" options=$wotypes NAME="WOTYPE" SELECTEDITEM=""}</td></tr>
<tr><td align="right">{t}DBFLD_REQUESTDATE{/t}</td><td>{t}DBFLD_SCHEDSTARTDATE{/t}</td></tr>
<tr><td align="right">{$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</td>
    <td>{include file="_calendar.tpl" NAME="SCHEDSTARTDATE" VALUE=""}</td></tr>
<tr><td align="right"><a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=EQUIP2','EQNUM')">{t}Select equipment{/t}</a></td>
    <td><input name="EQNUM" size="25" value="{$data.EQNUM}"><input name="DESCRIPTION" size="35" value="{$data.DESCRIPTION}"></td></tr>
<tr><td colspan="2"><input type="submit" value="{t}Save{/t}" name="form_save">
                    <input type="submit" value="{t}Save & Close{/t}" name="close"></td></tr>
</table>
</form>
