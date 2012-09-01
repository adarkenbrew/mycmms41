<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>{$labels.HEADER}</h1>
<table width="800" align="center">
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<tr><td>sys_queries.name</td><td><input type="text" name="NAME" size="15"></td></tr>
<tr><td>sys_queries.caption/title</td><td><input type="text" name="CAPTION" size="30"></td></tr>
<tr><td>sys_queries.mysql<td><textarea name="MYSQL" cols="80" rows="10"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" name="check" value="{$labels.command}"></td></tr>
</form>
</table>
</body>
</html>