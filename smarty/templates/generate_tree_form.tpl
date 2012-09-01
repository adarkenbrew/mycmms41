<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">{t}Generate Tree (equip, RFF, myCMMS){/t}</h1>    
<h3><u>STEP 0:</u> Select the Table</h3>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
Give Table:&nbsp;{include file="_combobox_num.tpl" options=$tables NAME="TABLE" SELECTEDITEM=""}
<input type="submit" name="launch" value="Base Table">
</form>
<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
</body>
</html>
