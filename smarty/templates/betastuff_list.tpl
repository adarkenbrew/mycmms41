{config_load file="betastuff.conf"}
<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>{$labels.HEADER}</h1>
<table width="800">
<tr><th>{$labels.DBFLD_name}</th><th>{$labels.DBFLD_MENUORDER}</th><th>{$labels.DBFLD_caption}</th><th>{$labels.DBFLD_mysql}</th></tr>
{foreach item=action from=$actions}
<tr bgcolor="{cycle values="{#LINECOLOR_ODD#},{#LINECOLOR_EVEN#}"}"><td><b>{$action.LINK}</b></td><td>{$action.MENUORDER}</td><td align="right">{$action.caption}</td><td>{$action.mysql}</td></tr>
{/foreach}
</table>

</body>
</html>