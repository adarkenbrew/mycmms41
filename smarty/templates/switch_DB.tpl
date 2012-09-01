<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Switch Database</h1>    
<table>
<tr><td>Select new Database</td>
    <td><form action="{$SCRIPT_NAME}" method="post">
        <input type="hidden" name="STEP" value="1">
        {include file="_combobox_num.tpl" options=$databases NAME="DATABASE_SWITCH" SELECTEDITEM=""}</td></tr>
<tr><td colspan="2"><input type="submit" name="Switch" value="Switch"></td></tr>
</form>
</table>
 

