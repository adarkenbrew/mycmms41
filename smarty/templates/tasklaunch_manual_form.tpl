<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Task launching Sub-System</h1>    
<h3><u>STEP 0:</u> Extending the Forecast</h3>
<form action="" method="post">
<input type="hidden" name="STEP" value="1">
{t}Limit Days ahead:{/t}&nbsp;<input type="text" class="text" name="LIMIT" id="LIMIT" size="5" value="0">
<input type="submit" name="launch" value="{t}Forecast in days{/t}">
</form>
<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
</body>
</html>
 
