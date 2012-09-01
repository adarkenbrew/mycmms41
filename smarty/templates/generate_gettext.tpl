<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head> 
<body>
<h1 class="action">Reading table sys_queries: capturing caption and title</h1>
{foreach from=$messages1 item=message1}
<div style="color: darkgreen;">{$message1}</div>
{/foreach}
{foreach from=$errors1 item=error1}
<div style="color: red;">{$error1}</div>
{/foreach}

<h1 class="action">Reading table sys_queries: converting DB fields to DBFLD_ names</h1>
{foreach from=$messages2 item=message2}
<div style="color: darkgreen;">{$message2}</div>
{/foreach}
<ul>
{foreach from=$tables item=table}
<li>{$table}</li>
{/foreach}
</ul>
{foreach from=$errors2 item=error2}
<div style="color: red;">{$error2}</div>
{/foreach}

<h1 class="action">Reading Smarty Templates</h1>
{foreach from=$messages3 item=message3}
<div style="color: darkgreen;">{$message3}</div>
{/foreach}
{foreach from=$errors3 item=error3}
<div style="color: red;">{$error3}</div>
{/foreach}
<ul>
{foreach from=$smarties item=template_file}
<li>{$template_file}</li>
{/foreach}
</ul>

</body>
</html>
