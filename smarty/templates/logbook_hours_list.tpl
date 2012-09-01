<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<table border="0px">
<tr><th>{t}DBFLD_WONUM{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}DBFLD_TASKDESC{/t}</th><th>{t}DBFLD_REQUESTDATE{/t}</th><th>{t}DBFLD_EMPCODE{/t}</th><th>{t}DBFLD_REGHRS{/t}</th></tr>
{foreach item=woe from=$woes}
<tr bgcolor="{cycle values="#CCCCCC,#DDDDDD"}">
    <td><a href="../workorders/wo_print.php?id1={$woe.WONUM}" target="new">{$woe.WONUM}</a></td>
    <td>{$woe.EQNUM}</td>
    <td>{$woe.TASKDESC}</td>
    <td>{$woe.REQUESTDATE}</td>
    <td>{$woe.EMPCODE}</td>
    <td>{$woe.REGHRS}</td></tr>
{foreachelse}
<tr><td colspan="2">No Items to list</td></tr>        
{/foreach}
</table>
</body>
</html>