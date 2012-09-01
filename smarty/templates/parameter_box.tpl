<html>
<head>
<title>Parameter Box</title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="query_name" value="{$query_name}">
<table align="center" width="600">
<tr><th colspan="2">{$title}</th></tr>
<tr><td align="right">{$param1}</td><td align="center"><input type="text" size="25" name="param1"/></td></tr>
<tr><td align="right">{$param2}</td><td align="center"><input type="text" size="25" name="param2"/></td></tr>
<tr><td align="right">{$param3}</td><td align="center"><input type="text" size="25" name="param3"/></td></tr>
<tr><td colspan=2 align="center"><input type="submit" value="Submit query with Parameters"></td></tr>
</table>
</form>
</body>
</html>