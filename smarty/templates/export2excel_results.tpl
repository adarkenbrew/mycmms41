<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO8859-1" />
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 class="action">{t}Export Action{/t}</h1>
<table width="700" align="center">
<tr><th>Time</th><th>Step Description</th></tr>
{foreach item=step from=$steps}
<tr><td>{$step[0]}</td><td>{$step[1]}</td></tr>
{/foreach}
</table>
</body>
</html>