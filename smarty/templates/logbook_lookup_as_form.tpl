<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Lookup Work Orders{/t}</h1>
<h1 class="action">{t}Select criteria (tick to activate){/t}</h1>
<form action="{$SCRIPT_NAME}" name="treeform" method="post">
<input type="hidden" name="STEP" value="1">
<table width="1000" align="center">
<!-- Date Ranges -->
<tr><td><input type="checkbox" name="LOOK_DT1_2">{t}Intervention Date{/t}</td>
    <td>{t}From{/t} : {include file="_calendar.tpl" NAME="DT1" VALUE=$data.QBE.DT1} {t}Until{/t} : {include file="_calendar.tpl" NAME="DT2" VALUE=$data.QBE.DT2}</td></tr>
<tr><td><input type="checkbox" name="LOOK_TECHNICIAN">{t}Assigned Technician{/t}</td>
    <td>{include file="_combobox_multiple.tpl" options=$assignedtechs NAME="ASSIGNEDTECH[]" SELECTEDITEM=""}</td></tr>
<tr><td><input type="checkbox" name="LOOK_TEXT">{t}Text Search{/t}</td>
    <td align="left"><input type="text" name="TEXT" size="80" value="{$data.QBE.TEXT}"></td></tr>
<tr><td><input type="checkbox" name="LOOK_ORIGINATOR">{t}Customer{/t}</td>
    <td>{include file="_combobox_multiple.tpl" options=$originators NAME="ORIGINATOR[]" SELECTEDITEM=""}</td></tr>
<tr><td><input type="checkbox" name="LOOK_EQNUM" checked>{t}EQNUM - refining search{/t}</td>
    <td><input type="text" name="EQNUM" size="30" value="{$data.QBE.EQNUM}">
        <a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=EQUIP_CLID_RETURN','EQNUM')">{t}Select equipment{/t}</a><input type="text" name="DESCRIPTION" size="50"></td></tr>
<tr><td>{t}Static List{/t}</td><td><input type="checkbox" name="STATIC" checked=""></td></tr>
<tr><td colspan="2"><input type="submit" name="check" value="Logboek"></td></tr>
</table>
</form>
<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
</body>
</html>