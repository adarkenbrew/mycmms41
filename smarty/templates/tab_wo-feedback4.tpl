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
<body>
<p class="info">{t}Assigned Technician{/t} : {$smarty.session.user} ({$actual_id})</p>
<table width="800">
<tr><th>{t}Indicator{/t}</th><th>{t}Type{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}Task Done?{/t}</th><th>{t}DBFLD_action{/t}</th></tr>
{foreach item=check from=$checks}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
{if $actual_id ne $check.INDICATOR}
<form action="{$SCRIPT_NAME}" name="EDIT" method="get">
<input type="hidden" name="ACTION" value="EDIT">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$check.INDICATOR}">
    <td width="50%">{$check.INDICATOR}:<br>{$check.LABEL}<br>{$check.INSTRUCTIONS}</td>
    <td>{$check.TYPE}</td>
    <td>{$check.EQNUM}</td>
    <td align="center">{if $check.VALUE eq NULL}{t}Check NOT DONE{/t}
        {else}({$check.ASSIGNEDTECH}/{$check.TASKDONE|date_format:"%d-%m %H:%M"})<br><b>{$check.VALUE}</b>{/if}</td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="EDIT"></a></td>
</form>
</tr>
{/if}
{if $actual_id eq $check.INDICATOR}
<form action="{$SCRIPT_NAME}" name="EDIT" method="post">
<input type="hidden" name="ACTION" value="EDIT">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$check.INDICATOR}">
<input type="hidden" name="TASKNUM" value="{$check.TASKNUM}">
    <td width="50%">{$check.INDICATOR}:<br>{$check.LABEL}<br>{$check.INSTRUCTIONS}</td>
    <td>{$check.TYPE}</td>
    <td>{$check.EQNUM}</td>
    <td align="center"><input type="text" size="8" name="VALUE">{$check.VALUE}</td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="EDIT"></a></td>
</form>
</tr>
{/if}
{/foreach}
</table>
</body>
</html>