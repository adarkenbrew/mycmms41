<html>
<head>
<title></title>
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function setFocus() {
    window.focus();
}
</script>
<script src="../libraries/calendar.js" type="text/javascript"></script>
<script src="../libraries/calendar-en.js" type="text/javascript"></script>
<script src="../libraries/calendar-setup.js" type="text/javascript"></script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<link href="{$stylesheet_calendar}" rel="stylesheet" type="text/css" />
<!--
    "IS_LASTCOUNTER"=>_(""),
    "IS_COUNTER"=>_(""),
    "HDR_TASKACTIVATION"=>_("Setting Task ACTIVE"),
    "IS_TASKACTIVE"=>_("Is Task activated?"),
    "IS_SETFREQUENCY"=>_("Adapt Frequency")
    -->
</head>
<body onload="setFocus()">
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="id1" value="{$data.TASKNUM}">
<input type="hidden" name="EQNUM" value="{$data.EQNUM}">
<table width="800">
<tr><td valign="top" align="right">{t}Task Reference{/t}</td><td><b>{$data.TASKNUM}</b></td></tr>
<tr><td align="right">{t}Task Type{/t}</td><td><b>{$data.WOTYPE}</b></td></tr>
<tr><td align="right">{t}Task Description{/t}</td><td><b>{$data.DESCRIPTION}</b></td></tr>
<tr><td align="right">{t}Task Object{/t}</td><td><b>{$data.EQNUM} : {$data.EQDESC}</b></td></tr>

{* Interval data for Time Based Maintenance *}
<tr><th colspan="2">{t}Time Based PPM{/t}</th></tr>
{if $data.SCHEDTYPE eq 'F'}{assign var="floating" value="checked"}{/if}
{if $data.SCHEDTYPE eq 'X'}{assign var="fixed" value="checked"}{/if}
<tr><td align="right">{t}Floating{/t}? / {t}Fixed{/t}?</td>
    <td>
    <input type="radio" name="SCHEDTYPE" value="F" {$floating}>{t}Floating{/t}<BR>
    <input type="radio" name="SCHEDTYPE" value="X" {$fixed}>{t}Fixed{/t}<BR>
</td></tr>
<tr><td align="right">{t}Task Frequency{/t}</td><td><input type="text" name="NUMOFDATE" size="10" align="center" value="{$data.NUMOFDATE}">{t}Days or Counter-ticks{/t}</td></tr>
<tr><td align="center">{t}Last Performed{/t}</td><td align="center">{t}Next Due Date{/t}</td></tr>
<tr><td align="center">{include file="_calendar.tpl" NAME="LASTPERFDATE" VALUE="{$data.LASTPERFDATE}"}</td>
    <td align="center">{include file="_calendar.tpl" NAME="NEXTDUEDATE" VALUE="{$data.NEXTDUEDATE}"}</td></tr>
<tr><th colspan="2">{t}Counter Based PPM{/t}</th></tr>
{if $data.SCHEDTYPE eq 'T'}{assign var="counter" value="checked"}{/if}
<tr><td align="right">{t}Counter{/t}</td>
    <td><input type="radio" name="SCHEDTYPE" value="T" {$counter}>{t}Counter{/t}</td></tr>
<tr><th align="center">{t}Last Counter{/t}</th><th align="center">{t}Actual Counter{/t}</th></tr>
<tr><td align="center"><input type="text" name="LASTCOUNTER" size="10" value="{$data.LASTCOUNTER}"></td><td align="center"><input type="text" name="COUNTER" size="10" value="{$data.COUNTER}"></td></tr>

<tr><th colspan="2">{t}Setting Task ACTIVE{/t}</th></tr>
<tr><td align="right">{t}Is Task activated?{/t}</td>
    <td>
{if $data.ACTIVE eq "1"}{assign var="active" value="CHECKED"}{else}{assign var="active" value=""}{/if}    
<input type="checkbox" name="ACTIVATE" {$active}></td></tr>
<tr><td colspan="2"><input type="submit" class="submit" value="{t}Adapt Frequency{/t}" name="form_save"></td></tr>
</table>
</form>
