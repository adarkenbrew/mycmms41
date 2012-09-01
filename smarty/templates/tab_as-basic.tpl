<html>
<head>
<title></title>
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
<body onload="setFocus()">
{if $new}
<p>Search Clients</p>
<hr>
{/if}
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="WOPREV" value="0" />
<input type="hidden" name="EXPENSE" value="MAINT" />
<input type="hidden" name="WOTYPE" value="REPAIR" />
<table width="800">
<tr><th>Call_ID</th><th>Report</th><th>Report_AX</th></tr>
<tr><td align="center"><input name="WONUM" size="8" value="{$data.WONUM}"></td>
    <td align="center"><input name="REPORT" size="6" value="{$data.REPORT}"></td>
    <td align="center"><input name="REPORT_AX" size="5" value="{$data.REPORT_AX}"></td></tr>

<tr><td align="right">{t}DBFLD_REQUESTDATE{/t}</td>
    <td align="left">{include file="_combobox.tpl" options=$clients NAME="ORIGINATOR" SELECTEDITEM=$data.ORIGINATOR}</td>
    <td align="center">{$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</td></tr>
<tr><td align="right">{t}DBFLD_EQNUM{/t}</td>
    <td colspan="2" align="left">{include file="_combobox.tpl" options=$client_machines NAME="EQNUM" SELECTEDITEM=$data.EQNUM}</td></tr>        
    
<tr><td align="right">{t}DBFLD_SCHEDSTARTDATE{/t}</td>
    <td align="left">{include file="_combobox.tpl" options=$technicians NAME="ASSIGNEDTECH" SELECTEDITEM=$data.ASSIGNEDTECH}</td>
    <td align="center">{include file="_calendar.tpl" NAME="SCHEDSTARTDATE" VALUE=$data.SCHEDSTARTDATE}</td></tr>

<tr><td align="right">{t}DBFLD_WOSTATUS{/t}</td>
    <td colspan="2" align="left">{include file="_combobox.tpl" options=$wostates NAME="WOSTATUS" SELECTEDITEM=$data.WOSTATUS}</td></tr>
    
<tr><td align="right">{t}DBFLD_WOTYPE{/t}</td>
    <td colspan="2" align="left">{include file="_combobox.tpl" options=$wotypes NAME="WOTYPE" SELECTEDITEM=$data.WOTYPE}</td></tr>
    
    
<tr><td align="right">{t}Description{/t}</td>
    <td colspan="2"><textarea name="TASKDESC" id="TASKDESC" cols="100" rows="2">{$data.TASKDESC}</textarea></td></tr>
<tr><td align="right">{t}Preparation{/t}</td>
    <td colspan="2"><textarea name="TEXTS_A" id="TEXTS_A" cols="100" rows="4">{$data.TEXTS_A}</textarea></td></tr>
<tr><td align="right">{t}Report{/t}</td>
    <td colspan="2"><textarea name="TEXTS_B" id="TEXTS_B" cols="100" rows="4">{$data.TEXTS_B}</textarea></td></tr>
    
<tr><td colspan="2"><input type="submit" value="{t}Save{/t}" name="form_save">
                    <input type="submit" value="{t}Save & Close{/t}" name="close"></td></tr>
</table>
</form>
