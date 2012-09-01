<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Select Workorder{/t}</h1>
<table width="600">
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<tr><td>{t}DBFLD_WONUM{/t}</td>
    <td><input type="text" name="WONUM"></td></tr>
<tr><td colspan="2" align="left"><input type="submit" name="STEP1" value="{t}Select WO nr{/t}"></td></tr>
</table>
</form>
<div class="information"><p><a href="{$wiki}" target="new">WIKI documentation for module {$smarty.server.SCRIPT_NAME}</a></p></div>
</body>
</html>