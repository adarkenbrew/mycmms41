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
<input type="hidden" name="id1" value="{$data.WONUM}">
<input type="hidden" name="id2" value="{$data.EQNUM}">
<input type="hidden" name="ORIGINATOR" value="{$data.ORIGINATOR}">
<input type="hidden" name="TASKDESC" value="{$data.TASKDESC}">
<TABLE WIDTH="600">
<tr><td>{t}Requested by{/t}</td>
    <td><input type="text" name="ORIGINATOR" size="15" value="{$data.ORIGINATOR}"></td></tr>
<tr><td>{t}Task Description{/t}</td>
    <td><input type="text" name="TASKDESC" size="70" value="{$data.TASKDESC}"></td></tr>
<tr><td>{t}DBFLD_REQUESTDATE{/t}</td>
    <td>{include file="_calendar.tpl" NAME="REQUESTDATE" VALUE=$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</td></tr>
<tr><td>{t}DBFLD_APPROVEDBY{/t}</td>
    <td><input type="text" name="APPROVEDBY" size="15" value="{$smarty.session.user}"></td></tr>
<tr><td>{t}Date refusal{/t}</td>
    <td>{include file="_calendar.tpl" NAME="APPROVEDDATE" VALUE=$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</td></tr>
<tr><td>{t}Reason for Refusal{/t}</td>
    <td><textarea name="REASON" cols="50" rows="3"></textarea></td></tr>            
<tr><td colspan="2">    
    <input type="submit" value="{t}Refuse & Close{/t}" name="close"></td></tr>
</table>
</form>

