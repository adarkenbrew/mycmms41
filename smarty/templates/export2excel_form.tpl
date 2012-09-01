<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO8859-1" />
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Exporting myCMMS data to EXCEL{/t}</h1>
<table width="700" align="center">
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<tr><td>{t}myCMMS to EXCEL definitions{/t}</td>
    <td>{include file="_combobox.tpl" options=$predefined_exports NAME="ID" SELECTEDITEM=""}</td></tr>
<tr><td colspan="2"><input type="submit" name="check" value="{t}Select data to export{/t}"></td></tr>
</form>
</table>
</body>
</html>