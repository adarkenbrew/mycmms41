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
<body onload="setFocus()">
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="id1" value="{$data.EQNUM}">
<table width="800">
<tr><td align="right">{t}ROOT{/t}</td>
    <td><input type="text" name="EQNUM" size="25" value="{$data.EQNUM}">
        <input type="text" name="DESCRIPTION" size="35" value="{$data.DESCRIPTION}">
        <a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=EQUIP2','EQNUM')">{t}LIST{/t}</a></td></tr>
<tr><td align="right">{t}Object Type{/t}</td>
    <td><select name="EQTYPE">
    {foreach item=eqtype from=$eqtypes}
        {if $eqtype[0] eq $data.EQTYPE}
            {$selected="SELECTED"}
        {else}
            {$selected=""}
        {/if}
                <option value="{$eqtype[0]}" {$selected}>{$eqtype[1]}</option>
        {/foreach}    
        </select></td></tr>
<tr><td align="right">{t}Cost Center{/t}</td>
    <td><select name="COSTCENTER">
    {foreach item=cc from=$ccs}
        {if $cc[0] eq $data.COSTCENTER}
            {$selected="SELECTED"}
        {else}
            {$selected=""}
        {/if}
                <option value="{$cc[0]}" {$selected}>{$cc[1]}</option>
        {/foreach}    
        </select></td></tr>
<tr><td align="right">{t}BOM{/t}</td><td><input type="text" name="SPARECODE" size="25" value="{$data.SPARECODE}"></td></tr>
<tr><td align="right">{t}Safety Note{/t}</td>
    <td><textarea name="SAFETYNOTE" cols="60" rows="10">{$data.SAFETYNOTE}</textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="{t}Save{/t}" name="form_save">
                    <input type="submit" value="{t}Close{/t}" name="close"></td></tr>
</form>
</table>
