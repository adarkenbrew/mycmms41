<html>
<head>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Show data of Work Order{/t}</h1>
<table width="800">
<tr><th>{t}DBFLD_WONUM{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}DBFLD_TASKNUM{/t}</th></tr>
{foreach from=$wo_data item=wo}
<tr><td>{$wo.WONUM}</td><td>{$wo.EQNUM}</td><td>{$wo.TASKDESC}</td></tr>
{/foreach}
</table>

<table width="800">
<tr><th>{t}DBFLD_OPNUM{/t}</th>
    <th>{t}DBFLD_OPDESC{/t}</th>
    <th>{t}DBFLD_CRAFT{/t}</th>
    <th>{t}DBFLD_ESTHRS{/t}</th>
    <th>{t}DBFLD_TEAM{/t}</th></tr>
{foreach from=$woop item=op}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
    <td>{$op.OPNUM}</td>
    <td>{$op.OPDESC}</td>
    <td>{$op.CRAFT}</td>
    <td>{$op.ESTHRS}</td>
    <td>{$op.TEAM}</td></tr>
{/foreach}
</table>
<hr>
<table width="800">
<tr><th colspan="2">{t}New TASK reference{/t}</th></tr>
<tr><td>
<form action="{$SCRIPT_NAME}">
<input type="hidden" name="STEP" value="2">
<input type="hidden" name="WONUM" value="{$wo.WONUM}">
    {t}Task Reference{/t}</td>
    <td><input type="text" name="TASKNUM" size="20" value=""></td></tr>
<tr><td>{t}Task Description{/t}</td>
    <td><input type="text" name="TASKNUMDESCRIPTION" size="50" value=""></td></tr>
<tr><td colspan="2" align="center"><input type="submit" name="STEP2" value="{t}Copy WO to Task{/t}"></td></tr>
</form>
</table>

</body>
</html>