{include file="printout_header.tpl"}
<body>
<table>
<tr><td colspan="3" bgcolor="red">{$wo_main_data.WONUM}</td></tr>
<tr><td colspan="3"><B>{t}DBFLD_TASKDESC{/t} : </B>{$wo_main_data.TASKDESC}</td></tr>
<tr><td colspan="3"><B>{t}DBFLD_EQNUM{/t}</B> : {$wo_main_data.DESCRIPTION} (CLMCHID:{$wo_main_data.EQNUM})</td></tr>
<tr><td colspan="3"><B>{t}DBFLD_ORIGINATOR{/t}</B>(CLID){$wo_main_data.ORIGINATOR}</td></tr>
<tr><td colspan="3" align="center">
{$wo_main_data.NAME}<br>
{$wo_main_data.ADDRESS}<br>
{$wo_main_data.POSTCODE} {$wo_main_data.CITY}<br>
{$wo_main_data.PHONE}</td></tr>
<tr><td><B>Interventie/Intervention</B></td><td colspan="2">{$wo_main_data.DELIVERY}</td></tr>
</table>
{* Preparation Text and Technical comments *}
<table>
<tr><th>{t}DBFLD_TEXTS_B{/t}</th></tr>
<tr><td>{$wo_main_data.TEXTS_B|nl2br}</td></tr>
</table>

{* Spares *}
<table>
<tr><th>{t}DBFLD_ITEMNUM{/t}</th><th>Code AX</th><th>{t}DBFLD_DESCRIPTION{/t}</th><th>{t}DBFLD_QTYREQD{/t}</th><th>{t}DBFLD_QTYUSED{/t}</th></tr>
{foreach item=spare from=$spares}
<tr><td>{$spare.ITEMNUM}</td>
    <td>{$spare.MAPICS}</td>
    <td>{$spare.DESCRIPTION}</td>
    <td>{$spare.QTYREQD}</td>
    <td>{$spare.QTYUSED}</td></tr>
{/foreach}
</table>

</body>
</html>