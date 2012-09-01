<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<table border="0px">
<tr><th>{t}DBFLD_WONUM{/t}</th><th>Tech_Report</th><th>{t}Comments{/t}</th></tr>

{foreach item=log from=$data}
<tr bgcolor="{cycle values="#FFFFFF,#DDDDDD"}">
    <td><a href="../workorders/wo_print.php?id1={$log.DBFLD_WONUM}" target="new">{$log.DBFLD_WONUM}</td>
    <td>{$log.REPORT}/{$log.ASSIGNEDTECH}</td>
    <td>{$log.EQUIP_DESC} (<b>CLMCHID:{$log.DBFLD_EQNUM}</b>): (<b>{$log.DBFLD_ORIGINATOR}</b> intervention {$log.DBFLD_SCHEDSTARTDATE})<br>
        <b>{$log.DBFLD_TASKDESC}</b><br>
        {$log.DBFLD_TEXTS_B|nl2br}{$line++}
{foreachelse}
<tr><td colspan="2">No Items to list</td></tr>        
{/foreach}

</table>
</body>
</html>