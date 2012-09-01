<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">{t}Result of Generating Tree{/t}</h1>
<table>
<tr><th>{t}DBFLD_EQROOT{/t}</th><th>{t}Result{/t}</th></tr>
{foreach from=$tree_report item=eqroot}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}"><td>MCH&nbsp;{$eqroot.MCH}</td><td>has&nbsp;{$eqroot.CHILDREN}&nbsp;children</td></tr>
{/foreach}
</table>    
</body>
</html>
