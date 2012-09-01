<html>
<head>
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
<link href="calendar-win2K-1.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="800">
<tr><th>{t}DBFLD_ITEMNUM{/t}</th><th>{t}DBFLD_ITEMDESCRIPTION{/t}</th><th>{t}DBFLD_DATEUSED{/t}</th><th>{t}DBFLD_QTYUSED{/t}</th><th>{t}DBFLD_WAREHOUSEID{/t}</th><th>{t}Action{/t}</th></tr>
{foreach item=usedspare from=$usedspares}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}"><td {if $usedspare.QTYONHAND gt 0} bgcolor='lightgreen' {else} bgcolor='red' {/if}>
{if $actual_id ne $usedspare.ID}
<form action="{$SCRIPT_NAME}" name="EDIT" method="get">
<input type="hidden" name="ACTION" value="EDIT">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$usedspare.ID}"><b>{$usedspare.MAPICS}</b></td>        
    <td>{$usedspare.ITEMDESCRIPTION}</td>
    <td>{$usedspare.DATEUSED}</td>
    <td>{$usedspare.QTYUSED}</td>
    <td>{$usedspare.WAREHOUSEID}</td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/edit2.png" width="20" alt="EDIT"></a></td>
</form>
</tr>
{else}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}"><td>
<form action="{$SCRIPT_NAME}" name="EDIT" method="post">  
<input type="hidden" name="ACTION" value="UPDATE">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$usedspare.ID}">
        {$usedspare.ITEMNUM}</td>
    <td>{$usedspare.ITEMDESCRIPTION}</td>
    <td>{$usedspare.DATEUSED}</td>
    <td><input type="text" name="QTYUSED" size="5" value="{$usedspare.QTYUSED}"></td>
    <td><input type="text" name="WAREHOUSEID" size="5" value="{$usedspare.WAREHOUSEID}"></td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/refresh2.png" width="20" alt="UPDATE"></a></td>
</form>
</tr>
{/if}
{if $usedspare.ITEMNUM eq '999999'}
<form action="{$SCRIPT_NAME}" name="FREE" method="post">  
<input type="hidden" name="ACTION" value="FREE">
<input type="hidden" name="form_save" value="SET">
<tr><td colspan="5"><textarea cols="120" rows="5" name="FREE_TEXT">{$FREE_TEXT}</textarea></td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/refresh2.png" width="20" alt="FREE"></a></td></tr>
</form>    
{/if}
{/foreach}
{* INSERT *}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}"><td>
<form action="{$SCRIPT_NAME}" name="INSERT" method="post"> 
<input type="hidden" name="ACTION" value="INSERT">
<input type="hidden" name="form_save" value="SET">
        <input type="text" name="ITEMNUM" size="7"></td>
    <td>-</td>
    <td><input type="text" name="DATEUSED" size="10" value="{$WH_OUT}"></td>
    <td><input type="text" name="QTYUSED" size="5" value="{$usedspare.QTYUSED}"></td>
    <td><input type="text" name="WAREHOUSEID" size="5" value="{$TECH_WH}"></td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/add2.png" width="20" alt="UPDATE"></a></td></tr>
</form>
{* SEARCH *}
<tr bgcolor="{cycle values="ORANGE,WHITE"}"><td>
<form action="{$SCRIPT_NAME}" name="SEARCH" method="post"> 
<input type="hidden" name="ACTION" value="SEARCH">
<input type="hidden" name="form_save" value="SET">
        <input type="text" name="ITEMNUM" size="7" value="{$smarty.session.ITEMNUM}"></td>
    <td><input type="text" name="DESCRIPTION" size="20" value="{$smarty.session.DESCRIPTION}"></td>
    <td>-</td>
    <td>-</td>
    <td>-</td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/view-edit.png" width="20" alt="UPDATE"></a></td></tr>
</form>
{foreach item=found from=$search_results}
<tr bgcolor="{cycle values="WHITE,ORANGE"}"><td><b>{$found.0}</b><br>{$found.1}</td><td>{$found.2}</td><td>-</td><td>{$found.3}</td><td>{$found.4}</td><td>-</td></tr>    
{/foreach}
</table>

</body>
</html>