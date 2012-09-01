<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">    
<table width="800">
<tr>
    <th>{t}DBFLD_ITEMNUM{/t}</th>
    <th>{t}DBFLD_ITEMDESCRIPTION{/t}</th>
    <th>{t}NEEDED{/t}</th>
    <th>{t}DBFLD_QTYREQD{/t}</th></tr>
{foreach item=bom_part from=$data}    
<tr>
    <td>{$bom_part.ITEMNUM}</td>
    <td>{$bom_part.DESCRIPTION}</td>
    <td><input type='checkbox' name='itemnum[]' value='{$bom_part.ITEMNUM}'/></td>
    <td><input type='text' name='itemnum_needed_{$bom_part.ITEMNUM}'></td>
</tr>
{/foreach}
</table>  
<input type="submit" name="pick" value="Pick Material">
</form>
