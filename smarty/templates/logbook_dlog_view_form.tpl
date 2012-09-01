<html>
<head>
<title></title>
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Logbook DLOG breakdowns{/t}</h1>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<table width="1000" align="center">
<tr><td><input type="checkbox" name="LOOK_EQNUM">{t}Machine{/t}</td><td><input type="text" name="EQNUM" value="{$EQNUM}"></td></tr>
<tr><td><input type="checkbox" name="LOOK_DATERANGE">{t}Date Range{/t}</td>
    <td>{t}From{/t} : {include file="_calendartime.tpl" NAME="START" VALUE=""} - {t}Until{/t} : {include file="_calendartime.tpl" NAME="UNTIL" VALUE=""}</td></tr>
<tr><td>{t}Static List{/t}</td><td><input type="checkbox" name="STATIC"></td></tr>
<tr><td colspan="2"><input type="submit" name="check" value="Logboek"></td></tr>
</table>
</form>
<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
</body>
</html>