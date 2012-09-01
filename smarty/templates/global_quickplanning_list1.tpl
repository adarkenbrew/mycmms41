<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO8859-1" />
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<style type="text/css">
td.PL {
    color: white;
    background-color: darkgreen; }
td.P {
    color: white;
    background-color: orange; }
</style>
</head>
<body>
<h1 class="action">{t}Quick assignment of Resources{/t}</h1>
<h2>{t}Quick assignment of Resources{/t} -- {t}STEP 1: {/t}{t}Planned Work Orders{/t}</h2>

<table width="800" align="center">
<tr><th>{t}DBFLD_WOWNUM{/t}</th>
    <th>{t}DBFLD_EQNUM{/t}</th>
    <th>{t}DBFLD_TASKDESC{/t}</th>
    <th>{t}DBFLD_SCHEDSTARTDATE{/t}</th>
    <th>{t}DBFLD_ASSIGNEDTECH{/t}</th></tr>
{foreach item=wo from=$wos}
<tr bgcolor="{cycle values="#CCCCCC,#DDDDDD"}">
    <td>{$wo.WONUM}</td>
    <td>{$wo.EQNUM}</td>
    <td>{$wo.TASKDESC}</td>
    <td>{$wo.SCHEDSTARTDATE}</td>
    <td>{$wo.ASSIGNEDTECH}</td></tr>
{/foreach}

</table>
</body>
</html>