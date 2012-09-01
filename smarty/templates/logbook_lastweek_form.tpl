<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Logbook Lookup{/t}</h1>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<table width="1000" align="center">
<tr><td>{t}Machine{/t}</td><td><input type="text" name="machine" value="{$department}"></td></tr>
<tr><td>{t}Back View{/t}</td><td><input type="text" size="3" name="preview" value="1"></td></tr>
<tr><td>{t}Static List{/t}</td><td><input type="checkbox" name="STATIC" checked="checked"></td></tr>
<tr><td colspan="2"><input type="submit" name="check" value="Logboek"></td></tr>
</table>
</form>
<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
</body>
</html>