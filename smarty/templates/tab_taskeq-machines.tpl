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
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="800">
<tr><th>{t}DBFLD_EQNUM{/t}</th><th>{t}DBFLD_NUMOFDATE{/t}</th><th>{t}DBFLD_LASTPERFDATE{/t}</th><th>{t}Action{/t}</th></tr>
{foreach item=data from=$taskeq}
<tr  bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
{if $actual_id ne $data.ID}
<form action="{$SCRIPT_NAME}" name="EDIT" method="get">
<input type="hidden" name="ACTION" value="EDIT">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$data.ID}">
<td>{$data.EQNUM}:{$data.DESCRIPTION}</td><td>{$data.NUMOFDATE}</td><td>{$data.LASTPERFDATE}</td><td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="EDIT"></a></td>
</form>
</tr>
{else}
<tr  bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
<form action="{$SCRIPT_NAME}" name="treeform" method="post">  
<input type="hidden" name="ACTION" value="UPDATE">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="{$data.ID}">
<td><input type="text" name="EQNUM" size="25" value="{$data.EQNUM}"><a href="javascript://" onClick="treewindow_2('../actions/tree2/index.php?tree=EQUIP2','EQNUM')">{t}Change{/t}</a><br><input type="text" name="DESCRIPTION" size="35" value="{$data.DESCRIPTION}"></td>
<td><input type="text" name="NUMOFDATE" size="10" value="{$data.NUMOFDATE}"></td>
<td><input type="text" class="text" id="LASTPERFDATE" name="LASTPERFDATE" value="{$data.LASTPERFDATE}"/>
    <img src='../images/calendar.gif' id="trigger_LASTPERFDATE" style="cursor: pointer; border: 2px solid red;" title="Date selector" onmouseover="this.style.background='red';" onmouseout="this.style.background='green';"/>
<script type="text/javascript"> 
Calendar.setup ({   
    inputField: 'LASTPERFDATE',
    ifFormat : '%Y-%m-%d',
    button : 'trigger_LASTPERFDATE',
    align : 'Tl', 
    singleClick : true,
    showsTime : false });
</script></td>
<td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="UPDATE"></a></td>
</form>
</tr>
{/if}
{/foreach}
{* INSERT *}
<form action="{$SCRIPT_NAME}" name="withtree" method="post"> 
<input type="hidden" name="ACTION" value="INSERT">
<input type="hidden" name="form_save" value="SET">
<tr  bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}"><td><input type="text" name="EQNUM" size="25"><a href="javascript://" onClick="treewindow_2('../actions/tree2/index.php?tree=EQUIP3','EQNUM')">{t}Add{/t}</a><br><input type="text" name="DESCRIPTION" size="35"></td>
<td><input type="text" name="NUMOFDATE" size="10"></td>
 <td><input type="text" class="text" id="LASTPERFDATE" name="LASTPERFDATE" value="{$data.LASTPERFDATE}"/>
    <img src='../images/calendar.gif' id="trigger2_LASTPERFDATE" style="cursor: pointer; border: 2px solid red;" title="Date selector" onmouseover="this.style.background='red';" onmouseout="this.style.background='green';"/>
<script type="text/javascript"> 
Calendar.setup ({   
    inputField: 'LASTPERFDATE',
    ifFormat : '%Y-%m-%d',
    button : 'trigger2_LASTPERFDATE',
    align : 'Tl', 
    singleClick : true,
    showsTime : false });
</script></td>
 <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/INSERT.jpg" width="20" alt="UPDATE"></a></td></tr>
</form>
</table>
</body>
</html>
{* End of SMARTY*}
