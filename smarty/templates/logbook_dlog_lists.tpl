{include file="printout_header_wo.tpl"}
<body>
<table border="0px">
<tr><th>{t}DBFLD_WONUM{/t}</th><th>{t}DBFLD_ID{/t}</th><th>{t}DBFLD_EQNUM{/t}</th><th>DBFLD_TASKDESC</th><th>{t}DBFLD_REQUESTDATE{/t}</th><th>{t}DBFLD_DURATION{/t}</th><th>{t}State{/t}</th></tr>
{foreach item=dlog from=$data_dlog}
<tr bgcolor="{cycle values="#CCCCCC,#DDDDDD"}">
<form action="{$SCRIPT_NAME}" name="EDIT" method="get">
<input type="hidden" name="STEP" value="2">
<input type="hidden" name="DURATION" value="{$dlog.DURATION}">
<input type="hidden" name="ID" value="{$dlog.ID}">
{if $dlog.ID ne 0}
    <td><input type="text" name="WONUM" size="7" value="{$dlog.WONUM}"></td>
{else}
    <td>{$dlog.WONUM}</td>
{/if}    
    <td>{$dlog.ID}</td>
    <td>{$dlog.EQNUM}</td>
    <td>{$dlog.TASKDESC}</td>
    <td>{$dlog.REQUESTDATE}</td>
    <td align="right">{$dlog.DT_DURATION}</td>
    <td>{$dlog.STATE}</td>
    <td><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="EDIT"></a></td>
</form>    
    </tr>
{foreachelse}
<tr><td colspan="2">No Items to list</td></tr>        
{/foreach}
</table>

</body>
</html>