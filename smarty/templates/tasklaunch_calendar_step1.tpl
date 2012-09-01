<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Task launching Sub-System with PPM Calendar</h1>
<h3><u>STEP 1:</u>{t}List of tasks found in PPM Calendar{/t}</h3>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="2">
<input type="submit" name="check" value="{t}Unmark if you want to block task{/t}">
<table>
<tr><th>{t}DBFLD_TASKNUM{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}Description{/t}</th><th>{t}Planned Date{/t}</th><th>{t}Launch{/t}</th></tr>
{foreach from=$tasks item=task}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
    <td>{$task.tasknum}</td>
    <td>{$task.eqnum}</td>
    <td>{$task.description}</td>
    <td>{$task.PLANDATE}</td>
    <td><input type="checkbox" name="taskid[]" value="{$task.tasknum}:{$task.eqnum}:{$task.PLANDATE}" checked></td></tr>
{/foreach}
</table>
</form>
</body>
</html>
 
