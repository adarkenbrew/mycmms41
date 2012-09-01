<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Task launching Sub-System</h1>
<h3><u>STEP 2:</u></h3>
<ol>
<li>{t}Launching the WO{/t}</li>
<li>{t}Setting the WO information in the PPM task{/t}</li>
<ul><li>WONUM</li>
    <li>LASTCOUNTER</li></ul>
</ol>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="2">
<input type="submit" name="check" value="{t}Launch Tasks{/t}">
</form>
<table>
<tr><th>{t}DBFLD_TASKNUM{/t}</th>
    <th>{t}DBFLD_EQNUM{/t}</th>
    <th>{t}DBFLD_INDICATOR{/t}</th>
    <th>{t}DBFLD_WONUM{/t}</th>
    <th>{t}Action{/t}</th></tr>
{foreach from=$tasks item=task}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
    <td>{$task.TASKNUM}</td>
    <td>{$task.EQNUM}</td>
    <td>{$task.COUNTER}</td>
    <td>{$task.WONUM}</td>
    <td style="background-color=red;">LAUNCH</td>
    </tr>
{/foreach}
</table>
</body>
</html>
 
