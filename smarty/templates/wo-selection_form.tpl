<html>
<head>
<title>Printout Workorders#WO_FINISHED</title>
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function setFocus() {
window.focus();}
</script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body onload="setFocus()">
<h1 class="title">{t}Printout Workorders{/t}#{t}{$session.query_name}{/t}</h1>        
<form method="post" class="form" name="treeform" action="wo_print2pdf.php">
<table>
<tr><th>{t}DBFLD_WONUM{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>{t}DBFLD_TASKDESC{/t}</th><th>{t}Print PDF{/t}</th></tr>
{foreach item=wo from=$data}
<tr bgcolor="{cycle values="#FFFFFF,#DDDDDD"}">
    <td>{$wo.WONUM}</td><td>{$wo.EQNUM}</td><td>{$wo.TASKDESC}</td>
    <td><input type='checkbox' name='wonum[]' value='{$wo.WONUM}' checked/></td></tr>
{/foreach}
<tr><td colspan="3">{include file="_combobox_num.tpl" options=$reports NAME="REPORT" SELECTEDITEM=""}</td></tr>
</table>
<input type="submit" class="submit" value="Printout PDF" name="form_save">
</form>
{include file="_wikilink.tpl" WIKIPage=$wikipage}
</body>
</html>
