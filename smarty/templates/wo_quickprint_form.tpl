<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO8859-1" />
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<script type="text/javascript">
function toggle(source) {
  checkboxes = document.getElementsByName('uname[]');
  for(var i in checkboxes)
    checkboxes[i].checked = source.checked;
  return true;
}
</script>
</head>
<body>
<h1 class="action">{t}Printout Worksheets{/t}</h1>
<h2 class="action">{t}Indicate WO for week planning{/t}</h2>

<form action="{$SCRIPT_NAME}" name="checkform" method="post">
<input type="hidden" name="STEP" value="1">
<table width="800" align="center">
<tr><th>{t}Name{/t}</th>
    <th>{t}Longname{/t}</th>
    <th>{t}Print{/t}</th></tr>
{foreach item=tech from=$techs}
<tr><td>{$tech.uname}</td>
    <td>{$tech.longname}</td>
    <td><input type='checkbox' name='uname[]' value='{$tech.uname}' /></td></tr>
{/foreach}
</table>
<p>{t}Worksheet day{/t} - {include file="_calendar.tpl" NAME="WORKDAY" VALUE="{$smarty.now|date_format:"%Y-%m-%d"}"}</p>
<p>Toggle <input type='checkbox' onClick="toggle(this)"/>
<input type="submit" class="submit" value="{t}Printout PDF{/t}" name="form_save">
</form>
</table>

</body>
</html>