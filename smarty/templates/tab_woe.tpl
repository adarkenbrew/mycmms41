<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function setFocus() {
    window.focus();
}
</script>
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="800">
<tr><th class="th"><?PHP echo _("Employee"); ?></th> 
    <th class="th"><?PHP echo _("Work date"); ?></th>   
    <th class="th"><?PHP echo _("Planned"); ?></th></tr>
<tr><th>{t}DBFLD_EMPCODE{/t}</th><th>{t}DBFLD_WODATE{/t}</th><th>{t}DBFLD_ESTHRS{/t}</th><th>{t}Action{/t}</th></tr>
{foreach item=prestation from=$prestations}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
{if $actual_id ne $prestation.ID}
<form action="{$SCRIPT_NAME}" name="EDIT" method="get">
<input type="hidden" name="ACTION" value="EDIT">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$prestation.ID}">
    <td>{$prestation.EMPCODE}</td><td>{$prestation.WODATE|date_format:"%Y-%m-%d"}</td><td>{$prestation.ESTHRS}</td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="EDIT"></a></td>
</form>
</tr>
{else}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
<form action="{$SCRIPT_NAME}" name="EDIT" method="post">  
<input type="hidden" name="ACTION" value="UPDATE">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$prestation.ID}">
    <td>{include file="_combobox.tpl" options=$employees NAME="EMPCODE" SELECTEDITEM=$data.EMPCODE}</td>
    <td>{include file="_calendar.tpl" NAME="WODATE" VALUE=$prestation.WODATE|date_format:"%Y-%m-%d"}</td>
    <td><input type="text" name="ESTHRS" align="right" size="4" value="{$prestation.ESTHRS}"></td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="UPDATE"></a></td>
</form>
</tr>
{/if}
{/foreach}
{* INSERT *}
<form action="{$SCRIPT_NAME}" name="INSERT" method="post"> 
<input type="hidden" name="ACTION" value="INSERT">
<input type="hidden" name="form_save" value="SET">
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
    <td>{include file="_combobox.tpl" options=$employees NAME="EMPCODE" SELECTEDITEM=""}</td>
    <td>{include file="_calendar.tpl" NAME="WODATE" VALUE=$smarty.now|date_format:"%Y-%m-%d"}</td>
    <td><input type="text" name="ESTHRS" align="right" size="4" value=""></td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/INSERT.jpg" width="20" alt="UPDATE"></a></td></tr>
</form>
</table>
</body>
</html>