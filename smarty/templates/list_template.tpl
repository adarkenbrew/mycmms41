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
<img src="../images/refresh.png" width="15" onclick="RefreshList();" />
<table border="0" cellpadding="5">
<tr>
{foreach item=header from=$headers}
    <th><a href={$SCRIPT_NAME}?order_by={$header}>{$header}</a></th>
{/foreach}
</tr>
{foreach item=record from=$records}
<tr onmouseover="setPointer(this, 1,'over','#DDDDDD','#CCFFCC','#FFCC99');" onmouseout="setPointer(this, 1, 'out', '#DDDDDD', '#CCFFCC', '#FFCC99');" onmousedown="setPointer(this, 1, 'click', '#DDDDDD', '#CCFFCC', '#FFCC99');" onclick="ShowOption('{$record[0]}/{$record[1]}');" ondblclick="HideOption('{$record[0]}/{$record[1]}');">
    <td bgcolor="#DDDDDD" valign="top">{$record[0]}
    <div id="{$record[0]}/{$record[1]}" class="hidden">
        <FORM>
        <SELECT NAME="STEP"><OPTION VALUE="../workorders/tabmenu_wo2.php">FEEDBACK</OPTION><OPTION VALUE="../workorders/tabmenu_wo.php">PREPARATION</OPTION><OPTION VALUE="../workorders/wo_print.php">PRINT</OPTION><OPTION VALUE="../workorders/wo-selection.php">PRINTALL</OPTION><OPTION VALUE="../workorders/wo_print_smarty.php">PRINTNEW</OPTION>
        </SELECT>
        <INPUT TYPE="button" value="DO" onClick="openwindow2('100001','M1-Electrical',this.form.STEP.value)">
        </FORM>
        </div></td>
        <td bgcolor="#DDDDDD" valign="top">{$record[1]}</td>
        <td bgcolor="#DDDDDD" valign="top">{$record[2]}</td>
        <td bgcolor="#DDDDDD" valign="top">{$record[3]}</td>
        <td class="SPEC_{$record[8]}">{$record[4]}</td>
        <td bgcolor="#DDDDDD" valign="top">{$record[5]}</td>
        <td bgcolor="#DDDDDD" valign="top">{$record[6]}</td>
        <td bgcolor="#DDDDDD" valign="top">{$record[7]}</td>
        <td class="SPEC_{$record[8]}">{$record[8]}</td>
        <td class="SPEC_{$record[9]}">{$record[9]}</td>
</tr>
{/foreach}
</table>
</table>
<b>Diagnostic information</b><BR>
<b>Session_data: </b>{$session_data}<BR><B>Server</B> http://localhost/myCMMS/_main/list.php<BR>
<b>Server: </b>{$server_data}<br>
<b>Query WO_APPROVED=</b>{$query_sql}<BR>
<p><a href="http://localhost/myCMMS_MEDIAWIKI/index.php/mycmms_interface:{$wikipage}" target="new">documentation</a></p>
