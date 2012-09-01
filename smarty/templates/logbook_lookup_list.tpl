<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<table border="0px">
<tr><th>{t}DBFLD_WONUM{/t}</th><th>{t}Comments{/t}</th></tr>
{foreach item=log from=$data}
<tr bgcolor="{cycle values="#FFFFFF,#DDDDDD"}">
    <td><a href="../workorders/wo_print.php?id1={$log.DBFLD_WONUM}" target="new">{$log.DBFLD_WONUM}<BR>({$log.DBFLD_WOSTATUS})</a></td>
    <td>{$log.DBFLD_EQNUM}/{$log.EQUIP_DESC} : {$log.DBFLD_DESCRIPTION} ({$log.DBFLD_ORIGINATOR} meldde op {$log.DBFLD_REQUESTDATE})<br>
        <b>{$log.DBFLD_TASKDESC}</b><br>
        {$log.DBFLD_TEXTS_B|nl2br}{$line++}
{if $log.DBFLD_PRIORITY eq 0}
<br><font color="red"><i>{$log.DBFLD_RFF}</i>/<i>{$log.TEXTS_PPM}</i></font></td></tr>
{/if}
{foreachelse}
<tr><td colspan="2">No Items to list</td></tr>        
{/foreach}
</table>
</body>
</html>