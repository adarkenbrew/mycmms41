<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Pre-Select Equipment{/t}</h1>
<table width="700" align="center">
<form action="{$SCRIPT_NAME}" method="post">
<input type="hidden" name="STEP" value="1">
<tr><td>{t}DBFLD_WONUM{/t}</td>
    <td>{include file="_combobox.tpl" options=$wos NAME="WONUM" SELECTEDITEM=""}</td></tr>
<tr><td colspan="2"><input type="submit" name="check" value="{t}Launch Conversion{/t}"></td></tr>
</form>
</table>
</body>
</html>