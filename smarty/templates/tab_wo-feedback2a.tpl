<html>
<head>
<title></title>
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function setFocus() {
    document.treeform.COMMENT.style.background='lightblue'; 
    document.treeform.COMMENT.focus();
}
</script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body onload="setFocus()">
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="id1" value="{$data.WONUM}">
<input type="hidden" name="OLD" value="{$data.EQNUM}"><!-- To change the Object -->
<input type="hidden" name="TASKNUM" value="{$data.TASKNUM}"><!-- To reset the Task -->
<input type="hidden" name="ORIGINATOR" value="{$data.ORIGINATOR}">
<input type="hidden" name="ASSIGNEDTECH" value="{$ASSIGNEDTECH}"><!-- We've logged in, so... -->
<table width="800">
<tr><td align="right">{t}Workorder Feedback{/t} (OLD)</td>
    <td>{$data.TEXTS_B|nl2br}</td></tr>
<tr><td align="right">{t}Workorder Technician{/t}</td>
    <td align="center"><B>{$ASSIGNEDTECH}</B></td></tr>
<!-- Equipment Tree -->
<tr><td align="right"><a href="javascript://" onClick="treewindow('../actions/tree/index.php?tree=EQUIP','EQNUM')">Select equipment</a></td>
    <td><input type="text" class="text" name="EQNUM" id="EQNUM" size="25" value="{$data.EQNUM}"><input type="text" class="text" name="DESCRIPTION" id="DESCRIPTION" size="35" value="{$data.DESCRIPTION}"></td></tr>    
                        
<tr><td align="right">{t}Workorder Feedback{/t}</td>
    <td><textarea class="textarea" name="COMMENT" id="COMMENT" cols="80" rows="10"></textarea></td></tr>
<tr><td colspan="2">
<table width="800">
<tr><td colspan="2"><input type="radio" name="NEXTACTION" value="INTERMEDIATE" checked/>{t}Intermediate Work Status Report{/t}</td></tr>
<tr><td colspan="2"><input type="radio" name="NEXTACTION" value="END" />{t}Job is finished. Final Report{/t}</td></tr>
<tr><td><input type="radio" name="NEXTACTION" value="REVISION" />{t}Job is finished and machine is running, demand for Revision{/t}</td>
    <td><input type="text" class="text" name="NEXTWO" id="NEXTWO" size="60" value=""></td></tr>
</table></td></tr>    
<tr><td colspan="2"><input type="submit" class="submit" value="{t}Save{/t}" name="form_save">
                    <input type="submit" class="submit" value="{t}Save & Close{/t}" name="close"></td></tr>
</table>
</form>
