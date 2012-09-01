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
<input type="hidden" name="WOPREV" value="0" />
<input type="hidden" name="EXPENSE" value="MAINT" />
<input type="hidden" name="WOTYPE" value="REPAIR" />
<table width="800">
<tr><td valign ="top" align="right" width="30%">{t}DBFLD_TASKDESC{/t}</td>
    <td><textarea name="TASKDESC" id="TASKDESC" cols="80" rows="2">{$data.TASKDESC}</textarea></td></tr>
<tr><td align="right">{t}DBFLD_ORIGINATOR{/t}</td>
    <td>{include file="_combobox.tpl" options=$originators NAME="ORIGINATOR" SELECTEDITEM=$originator_preset}</td></tr>
<tr><td align="right">{t}DBFLD_PRIORITY{/t}</td>
    <td>{include file="_combobox.tpl" options=$priorities NAME="PRIORITY" SELECTEDITEM=""}</td></tr>
    </td></tr>
<tr><td align="right">{t}DBFLD_REQUESTDATE{/t}</td>
    <td>{$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</td></tr>
<tr><td align="right"><a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=EQUIP2','EQNUM')">{t}Select equipment{/t}</a></td>
    <td><input name="EQNUM" size="25" value="{$data.EQNUM}"><input name="DESCRIPTION" size="35" value="{$data.DESCRIPTION}"></td></tr>
<tr><td colspan="2">    
    <input class="submit" type="submit" value="{t}Save{/t}" name="form_save"></td></tr>
</table>
</form>
