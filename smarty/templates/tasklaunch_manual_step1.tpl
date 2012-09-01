<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Task launching Sub-System</h1>
<h3><u>STEP 1:</u>{t}Checking the Due Dates{/t}</u><BR>
    {t}List of tasks -ready to launch-{/t}</h3>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="2">
<input type="submit" name="check" value="{t}Mark tasks ACTIVE{/t}">
<table>
<tr><th>{t}DBFLD_TASKNUM{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}Description{/t}</th><th>{t}DBFLD_NEXTDUEDATE{/t}</th><th>{t}Launch{/t}</th></tr>
{foreach from=$tasks item=task}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
    <td>{$task.tasknum}</td>
    <td>{$task.eqnum}</td>
    <td>{$task.description}</td>
    <td>{$task.next}</td>
    <td>
    {if $task.active eq 1}
        <input type="checkbox" name="taskid[]" value="{$task.tasknum}:{$task.eqnum}" checked>
    {else}
        <input type="checkbox" name="taskid[]" value="{$task.tasknum}:{$task.eqnum}">
    {/if}</td></tr>
{/foreach}
</table>
</form>
</body>
</html>
 
