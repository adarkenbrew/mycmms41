{include file="printout_header.tpl"}
<body>
<table>
<tr><td colspan="3" bgcolor="red">{$wo_main_data.WONUM} - <B>REPORT: {$wo_main_data.REPORT} ({$wo_main_data.ASSIGNEDTECH})</B> - <i>{$wo_main_data.REPORT_AX}</i></td></tr>
<tr><td colspan="3"><B>{t}DBFLD_TASKDESC{/t} : </B>{$wo_main_data.TASKDESC}</td></tr>
<tr><td colspan="3"><B>{t}DBFLD_EQNUM{/t}</B> : {$wo_main_data.DESCRIPTION} (CLMCHID:{$wo_main_data.EQNUM})</td></tr>
<tr><td><B>{t}DBFLD_ORIGINATOR{/t}</B></td><td>(CLID){$wo_main_data.ORIGINATOR} - </td></tr>
<tr><td colspan="2" align="center">
{$client_data.NAME}<br>
{$client_data.ADDRESS}<br>
{$client_data.POSTCODE} {$client_data.CITY}<br>
{$client_data.PHONE}
</td></tr>
<tr><td><B>Interventie/Intervention</B></td><td colspan="2">{$wo_main_data.SCHEDSTARTDATE}</td></tr>

{if $wo_main_data.TASKNUM neq 'NONE'}
<tr><td colspan="3" bgcolor="red">{$wo_main_data.TASKNUM}</td></tr>
{/if}

<tr><td><B>{t}DBFLD_COMPLETIONDATE{/t}</B></td><td colspan="2">{$wo_main_data.COMPLETIONDATE}<B>STATUS ({$wo_main_data.WOSTATUS})</B></td></tr>
</table>
{* Preparation Text and Technical comments *}
<table>
<tr><th>Opmerkingen/Remarques</th><th>{t}DBFLD_TEXTS_B{/t}</th></tr>
<tr><td>{$wo_main_data.TEXTS_A|nl2br}</td><td>{$wo_main_data.TEXTS_B|nl2br}</td></tr>
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

{* Documentation *}
<table>
<tr><th>{t}DBFLD_FILENAME{/t}</th><th>{t}DBFLD_FILEDESC{/t}</th></tr>
{foreach item=wodocu from=$wo_docs}
<tr><td><a href="{$doc_path}{$wodocu.FILENAME}">{$wodocu.FILENAME}</a></td><td>{$wodocu.FILEDESCRIPTION}</td></tr>
{/foreach}
{foreach item=eqdocu from=$eq_docs}
<tr><td><a href="{$doc_path}{$eqdocu.FILENAME}">{$eqdocu.FILENAME}</a></td><td>{$eqdocu.FILEDESCRIPTION}</td></tr>
{/foreach}
</table>
<hr>
<h2>Send EMail to Technician</h2>
<a href="./wo_mail.php?WONUM={$wo_main_data.WONUM}&ASSIGNEDTECH={$wo_main_data.ASSIGNEDTECH}">Send EMail</a>
</body>
</html>