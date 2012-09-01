<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Task launching Sub-System</h1>
<h3><u>STEP 1:</u></h3>
<ol>
<li>{t}Recuperating latest counter states{/t}</li>
<li>{t}Updating counters in PPM tasks{/t}</li>
<li>{t}Checking counter-based PPM tasks{/t}</li>
</ol>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="2">
<input type="submit" name="check" value="{t}Launch Tasks{/t}">
</form>
<table>
<tr><th>{t}DBFLD_INDICATOR{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}DBFLD_INDICATOR{/t}</th><th>{t}Last Counter{/t}</th><th>{t}Interval{/t}</th><th>{t}SUM{/t}</th><th>{t}Counter Now{/t}</th><th>{t}Action{/t}</th></tr>
{foreach from=$tasks item=task}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
    <td>{$task.TASKNUM}</td>
    <td>{$task.EQNUM}</td>
    <td>{$task.COUNTER}</td>
    <td style="text-align=right">{$task.COUNTER}</td>
    <td style="text-align=right">{$task.NUMOFDATE}</td>
    <td style="text-align=right">{$task.NEXTDUE}</td>
    <td style="text-align=right">{$task.STATE}</td>
    {if $task.STATE ge $task.NEXTDUE}
        <td style="background-color=red;">LAUNCH</td>
    {else}
        <td style="background-color=darkgreen;">OK</td>        
    {/if}
    </tr>
{/foreach}
</table>
</body>
</html>
 
