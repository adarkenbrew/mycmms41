<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO8859-1" />
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
</head>
<body>
<h1 class="action">{t}Quick re-assignment of Resources{/t}</h1>
<h2 class="action">{t}Quick re-assignment of Resources{/t} -- {t}STEP 0: {/t}{t}Work already planned{/t}</h2>

<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<input type="submit" name="check" value="{t}Indicate WO for week planning{/t}">
<table width="800" align="center">
<tr><th>{t}DBFLD_WONUM{/t}</th>
    <th>{t}DBFLD_EQNUM{/t}</th>
    <th>{t}DBFLD_TASKDESC{/t}</th>
    <th>{t}DBFLD_REQUESTDATE{/t}</th>
    <th>{t}DBFLD_SCHEDSTARTDATE{/t}</th>
    <th>{t}DBFLD_ASSIGNEDTECH{/t}</th>
    <th>{t}WeekPlan{/t}</th></tr>
{foreach item=wo from=$wos}
<tr bgcolor="{cycle values="#CCCCCC,#DDDDDD"}">
    <td>{$wo.WONUM}</td>
    <td>{$wo.EQNUM}</td>
    <td>{$wo.TASKDESC}</td>
    {if $wo.REQUESTDATE le $recent_work}
        <td bgcolor="orange">
    {else}
        <td bgcolor="green">
    {/if}
        {$wo.REQUESTDATE}</td>    
    <td>{include file="_combobox_multiple.tpl" options=$techs NAME="assignedtech[{$wo.WONUM}][]" SELECTEDITEM=""}</td>
    <td>{include file="_calendar.tpl" NAME="schedstartdate[{$wo.WONUM}]" VALUE=$wo.SCHEDSTARTDATE}</td>
    <td><input type='checkbox' name='wonum[]' value='{$wo.WONUM}'></td></tr>
{/foreach}
</form>
</table>

</body>
</html>