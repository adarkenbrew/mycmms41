<html>
<head>
<title></title>
<script type="text/javascript">
function setFocus() {
    window.focus();
}
</script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body onload="setFocus()">

<table width="600">
<tr><th>{t}DBFLD_VENDORID{/t}</th><th>{t}DBFLD_NAME{/t}</th><th>{t}DBFLD_UNITCOST{/t}</th><th>{t}DBFLD_UOP{/t}</th><th>{t}DBFLD_PRIMARYVENDOR{/t}</th></tr>
{foreach from=$vendors item=vendor}
<tr><td>{$vendor.VENDORID}</td><td>{$vendor.NAME}</td><td>{$vendor.UNITCOST}</td><td>{$vendor.UOP}</td><td>{$vendor.PRIMARYVENDOR}</td></tr>
{/foreach}
</table>

<table width="600">
<tr><th>{t}DBFLD_ITEMNUM{/t}</th><th>{t}DBFLD_ITEMDESCRIPTION{/t}</th><th>{t}DBFLD_LOCATION{/t}</th><th>{t}DBFLD_QTYONHAND{/t}</th><th>{t}Stock Value{/t}</th></tr>
{foreach from=$stock item=stock_item}
<tr><td>{$stock_item.ITEMNUM}</td><td>{$stock_item.DESCRIPTION}</td><td>{$stock_item.LOCATION}</td><td>{$stock_item.QTYONHAND}</td><td>{$stock_item.STOCKVALUE}</td></tr>
{/foreach}
</table>

<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="id1" value="{$data.ITEMNUM}">
<input type="hidden" name="VENDOR_OLD" value="{$data.VENDORID}">
<table width="600">
<tr><th>{t}Vendor Information{/t}</th>
    <td align="center">{include file="_combobox.tpl" options=$vendorlist NAME="VENDORID" SELECTEDITEM=$data.VENDORID}</td></tr>
<tr><th align="right">{t}Manufacturing Reference{/t}</th>
    <th align="left">{t}OEM Reference{/t}</th></tr>
<tr><td align="right"><B>{$data.OEMMFG}</b></td>
    <td align="left"><input type="text" name="MANUFACTID" size="50" value="{$data.MANUFACTID}"></td></tr>
<tr><td align="right">{t}Unit cost{/t}</td>
    <td><input type="text" name="UNITCOST" size="8" value="{$data.UNITCOST}"></td></tr>
<tr><td align="right">{t}Unit Quantity{/t}</td>
    <td><input type="text" name="UNITQTY" size="8" value="{$data.UNITQTY}"></td></tr>
<tr><td align="right">{t}Unit of Purchase{/t}</td>
    <td><input type="text" name="UOP" size="8" value="{$data.UOP}"></td></tr>
<tr><td align="right">{t}Min.order quantity{/t}</td>
    <td><input type="text" name="MINORDERQTY" size="50" value="{$data.MINORDERQTY}"></td></tr>

{foreach from=$suppliers item=supplier}    
{if $supplier.VENDORID eq $data.VENDORID}
<tr><td align="left"><input type="radio" name="vendorswitch" checked>
{else}
<tr><td align="left"><input type="radio" name="vendorswitch" checked>
{/if}
    &nbsp<b>{$supplier.VENDORID}</b></td><td>{t}UnitCost{/t}&nbsp:&nbsp{$supplier.UNITCOST}&nbsp(Reference{$supplier.MANUFACTID})</td></tr>    
{/foreach}

<tr><td>
    <input type="submit" class="submit" value="{t}Change{/t}" name="form_save"></td></tr>
</table>
</form>
</body>
</html>


