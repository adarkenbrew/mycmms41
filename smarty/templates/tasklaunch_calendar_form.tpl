<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Task launching Sub-System with PPM Calendar</h1>    
<h3><u>STEP 0:</u> Select EQNUM and Date-Ranges</h3>
<table>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<tr><td colspan="2">{include file="_combobox_num.tpl" NAME="EQNUM" options=$machines SELECTEDITEM=""}</td></tr>
<tr><td>{t}Start Date{/t}</td><td>{t}Until{/t}</td></tr>        
<tr><td>{include file="_calendar.tpl" NAME="START" VALUE=$smarty.now|date_format:"%Y-%m-%d"}</td>
    <td>{include file="_calendar.tpl" NAME="END" VALUE=$smarty.now|date_format:"%Y-%m-%d"}</td></tr>
<tr><td colspan="2"><input type="submit" name="launch" value="{t}Period to Launch{/t}"></td></tr>    
</form>
</table>
<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
</body>
</html>
 
