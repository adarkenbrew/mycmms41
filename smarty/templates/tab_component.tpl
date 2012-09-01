<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function setFocus() {
    window.focus();
}
</script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="800">
<tr><th>{t}DBFLD_EQNUM{/t}</th><th>{t}DBFLD_EQTYPE{/t}</th><th>{t}DBFLD_DESCRIPTION{/t}</th><th>{t}Action{/t}</th></tr>
{foreach item=component from=$components}
<tr>
{if $actual_id ne $component.EQNUM}
<form action="{$SCRIPT_NAME}" name="EDIT" method="get">
<input type="hidden" name="ACTION" value="EDIT">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$component.EQNUM}">
<td>{$component.EQNUM}</td><td>{$component.EQTYPE}</td><td>{$component.DESCRIPTION}</td><td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="EDIT"></a></td>
</form>
</tr>
{else}
<tr>
<form action="{$SCRIPT_NAME}" name="EDIT" method="post">  
<input type="hidden" name="ACTION" value="UPDATE">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$component.EQNUM}">
<td><input type="text" name="EQNUM"  size="30" value="{$component.EQNUM}"></td>
<td>{include file="_combobox.tpl" options=$eqtypes NAME="EQTYPE" SELECTEDITEM=$component.EQTYPE}</td>
<td><input type="text" name="DESCRIPTION" size="35" value="{$component.DESCRIPTION}"></td>
<td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="UPDATE"></a></td>
</form>
</tr>
{/if}
{/foreach}
{* INSERT part of the form *}
<form action="{$SCRIPT_NAME}" name="INSERT" method="post"> 
<input type="hidden" name="ACTION" value="INSERT">
<input type="hidden" name="form_save" value="SET">
<td><input type="text" name="EQNUM"  size="30" value=""></td>
<td>{include file="_combobox.tpl" options=$eqtypes NAME="EQTYPE" SELECTEDITEM=""}</td>
<td><input type="text" name="DESCRIPTION" size="35" value=""></td>
 <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/INSERT.jpg" width="20" alt="UPDATE"></a></td></tr>
</form>
</table>
</body>
</html>