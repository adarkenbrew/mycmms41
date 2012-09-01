<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>No title</title>
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript"> 
function RefreshList() {
    window.location.reload(true);
}
function ShowOption(id) {
    document.getElementById(id).style.display="block";
}
function HideOption(id) {
    document.getElementById(id).style.display="none";
}    
function setTitle() {
    parent.title.document.getElementById('title').innerHTML='{$title}';
}
</script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_specific}" rel="stylesheet" type="text/css" />
</head>
<body onLoad="setTitle();" />
<img src="../images/refresh.png" width="15" onclick="RefreshList();" />{$navbar}
<table border="0" cellpadding="5">
<tr>
{* Standard Header : 1 column/1column replaced with Custom Header *}
    <th><a href={$SCRIPT_NAME}?order_by={$headers[0][0]}>{$headers[0][1]}</a></th>
    <th>Beschrijving</th>
    <th>Magazijn</th>
    <th><a href={$SCRIPT_NAME}?order_by={$headers[6][0]}>Leverancier</th>
    <th><a href={$SCRIPT_NAME}?order_by={$headers[5][0]}>Type</a></th>
{* EO Standard Header *}
</tr>
{foreach item=record from=$records}
<tr bgcolor="{cycle values="#CCCCCC,#DDDDDD"}" onmouseover="setPointer(this, 1,'over','#DDDDDD','#CCFFCC','#FFCC99');" onmouseout="setPointer(this, 1, 'out', '#DDDDDD', '#CCFFCC', '#FFCC99');" onmousedown="setPointer(this, 1, 'click', '#DDDDDD', '#CCFFCC', '#FFCC99');" onclick="ShowOption('{$record[0]}/{$record[1]}');" ondblclick="HideOption('{$record[0]}/{$record[1]}');">
    <td>{$record[0]}
    <div id="{$record[0]}/{$record[1]}" class="hidden">
    <FORM>
    <SELECT NAME="STEP">
    {foreach item=action from=$actions}
        <OPTION VALUE="{$action[0]}">{$action[1]}</OPTION>
    {/foreach}
    </SELECT>
    <INPUT TYPE="button" value="DO" onClick="openwindow2('{$record[0]}','{$record[1]}',this.form.STEP.value)">
    </FORM>
    </div></td>
{* User changes as of here *}    
    <td><b>{$record[1]}</b><br>{$record[2]|nl2br}<br></td>
    <td>{$record[3]}-Qty:&nbsp<b>{$record[4]}</b></td>
    <td>{$record[6]}<br>{$record[7]}</td>
    <td>{$record[5]}</td>
{* User changes until here *}    
</tr>
{/foreach}
</table>
</table>
<b>Diagnostic information</b><BR>
<b>Session_data: </b>{$session_data}<BR><B>Server</B> http://localhost/myCMMS/_main/list.php<BR>
<b>Server: </b>{$server_data}<br>
<b>Query_data: </b>{$query_sql}<BR>
<p><a href="http://localhost/myCMMS_MEDIAWIKI/index.php/mycmms_interface:{$wikipage}" target="new">{$SCRIPT_NAME}</a></p>
