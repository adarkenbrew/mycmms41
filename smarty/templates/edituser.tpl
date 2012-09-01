<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="600">
<tr><td valign ="top">{t}Long name{/t}</td>
    <td><input type="hidden" name="uname" value="{$data.uname}">{$data.longname} - {$data.uname}</td></tr>
<tr><td>{t}New username{/t}</td>
    <td><input type="text" name="uname" size="10" value="{$data.uname}"></td></tr>
<tr><td>{t}Long name{/t}</td>
    <td><input type="text" name="longname" size="35" value="{$data.longname}">
        <input type="text" name="dummy" size="5" value="{$profile}"></td></tr>
<tr><td>{t}Password{/t}</td>
    <td><input type="password" name="passwd" size="10" value="{$data.passwd}"></td></tr>
<tr><td>{t}Roles{/t}</td>
    <td><span class="colouredCB">
        <input type="checkbox" name="DEVELOPMENT" {$profiles.DEVELOPMENT}>{t} Developper{/t}<BR>
        <input type="checkbox" name="MANAGER" {$profiles.MANAGER}>{t} Manager{/t}<BR>
        <input type="checkbox" name="SUPERVISOR" {$profiles.SUPERVISOR}>{t} Supervisor{/t}<BR>
        <input type="checkbox" name="PREPARATION" {$profiles.PREPARATION}>{t} Preparation{/t}<BR>
        <input type="checkbox" name="TECHNICIAN" {$profiles.TECHNICIAN}>{t} Technician{/t}<BR>
        <input type="checkbox" name="PRODUCTION" {$profiles.PRODUCTION}>{t} Production Operator{/t}
        </span></td></tr>
<tr><td>{t}Production Department{/t}</td>
    <td>{include file="_combobox_num.tpl" options=$depts NAME="dept" SELECTEDITEM=$data.dept}</td></tr>
<tr><td>{t}Work Team{/t}</td>
    <td>{include file="_combobox_num.tpl" options=$teams NAME="team" SELECTEDITEM=$data.team}</td></tr>
<tr><td>{t}Value-Stream VS{/t}</td>
    <td>{include file="_combobox_num.tpl" options=$vs NAME="vs" SELECTEDITEM=$data.vs}</td></tr>
<tr><td></td><td><span class="colouredCB"><input type="radio" name="action" value="new"></span>{t} New User{/t}</td></tr>    
<tr><td>Action</td><td><span class="colouredCB"><input type="radio" name="action" value="edit" checked></span>{t} Edit User{/t}</td></tr>    
<tr><td></td><td><span class="colouredCB"><input type="radio" name="action" value="delete"></span>{t}Delete User{/t}</td></tr>    
<tr><td colspan="2"><input type="submit" class="submit" value="{t}Make a choice{/t}" name="close"></td></tr>
</table>
<hr>
<table width="600">
<tr><td colspan="2">Category</td><td>{$data.ROLE}</td></tr>
<tr><td>Date Start ASCO</td><td>{$data.DATE_ASCO}</td><td>{$data.CARREER}</td></tr>
<tr><td>Birthday</td><td>{$data.DATE_BIRTH}</td><td>{$data.AGE}</td></tr>
</table>
Information: {$smarty.now|date_format:"%Y-%m-%d"}<br>
</body>
</html>