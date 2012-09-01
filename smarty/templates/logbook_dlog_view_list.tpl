{config_load file="colors.conf"}
<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<table border="0px">
<tr><th>{t}DBFLD_WONUM{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}DBFLD_TEXTS_B{/t}</th><th>{t}DBFLD_REQUESTDATE{/t}</th><th>{t}DT{/t}</th></tr>
{foreach item=log from=$data}
<tr bgcolor="{cycle values="`$smarty.config.LINECOLOR_ODD`,`$smarty.config.LINECOLOR_EVEN`"}">
    <td><a href="../workorders/wo_print.php?id1={$log.DBFLD_WONUM}" target="new">{$log.DBFLD_WONUM}</a></td>
    <td>{$log.DBFLD_EQNUM}</td>
    <td><b>{$log.DBFLD_TASKDESC}</b>{$log.DBFLD_TEXTS_B|nl2br}</td>
    <td>{$log.DBFLD_REQUESTDATE|date_format:"%A, %B %e, %Y %H:%M"}</td>
    <td>{$log.DBFLD_DT_DURATION}</td></tr>
{foreachelse}
<tr><td colspan="2">No Items to list</td></tr>        
{/foreach}
</table>
</body>
</html>