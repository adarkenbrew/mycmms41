<table>
<tr><th>WO</th>
    <th>EQNUM</th>
    <th>COMPLETIONDATE</th>
    <th>Comment</th></tr>
{foreach item=wo1 from=$wo}
<tr><td>{$wo1.CT}</td>
    <td>{$wo1.EQNUM}</td>
    <td>{$wo1.COMPLETIONDATE}</td>
    <td>{$wo1.TEXTS_B|nl2br}</td>
</tr>
{/foreach}
</table>