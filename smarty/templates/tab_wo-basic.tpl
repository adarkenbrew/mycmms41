<html>
<head>
<title></title>
<script src="../libraries/functions.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
function setFocus() {
    window.focus();
}
</script>
<script type="text/javascript">
function getXMLHTTPRequest() {
   var req =  false;
   try {
      /* for Firefox */
      req = new XMLHttpRequest(); 
   } catch (err) {
      try {
         /* for some versions of IE */
         req = new ActiveXObject("Msxml2.XMLHTTP");
      } catch (err) {
         try {
            /* for some other versions of IE */
            req = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (err) {
            req = false;
         }
     }
   }
   
   return req;
}

function query_tasks() {
  var theEqnum = document.getElementById('EQNUM').value;
  var thePage = 'ajax_eqnum_tasks.php';
  myRand = parseInt(Math.random()*999999999999999);
  var theURL = thePage +"?rand="+myRand+"&EQNUM="+theEqnum;
  myReq.open("GET", theURL, true);
  myReq.onreadystatechange = getTasks;
  myReq.send(null);
}
function getTasks() {
  if (myReq.readyState == 4) {
    if(myReq.status == 200) {
       result = myReq.responseText;
       document.getElementById('tasks').innerHTML = result;
    }
  } else {
    document.getElementById('tasks').innerHTML = '<img src="../images/ajax-loader.gif"/>';
  }
} // EO theTasks
function query_components() {
  var theEqnum = document.getElementById('EQNUM').value;
  var thePage = 'ajax_eqnum_components.php';
  myRand = parseInt(Math.random()*999999999999999);
  var theURL = thePage +"?rand="+myRand+"&EQNUM="+theEqnum;
  myReq.open("GET", theURL, true);
  myReq.onreadystatechange = getComponents;
  myReq.send(null);
}
function getComponents() {
  if (myReq.readyState == 4) {
    if(myReq.status == 200) {
       result = myReq.responseText;
       document.getElementById('components').innerHTML = result;
    }
  } else {
    document.getElementById('components').innerHTML = '<img src="../images/ajax-loader.gif"/>';
  }
}

var myReq = getXMLHTTPRequest(); 
</script>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body onload="setFocus()">
<form method="post" class="form" name="treeform" action="{$SCRIPT_NAME}">
<input type="hidden" name="id1" value="{$data.WONUM}">
<input type="hidden" name="OLD" value="{$data.OLD}"/>
<input type="hidden" name="OLD_COMP" value="{$data.COMPONENT}"/>
<table width="800">
<tr><th colspan="2">{t}Workorder Request Information{/t}</td></tr>
<tr><td align="right">{t}Work Requestor{/t}</td><td align="center"><B>{$data.ORIGINATOR}</B></td></tr>
<tr><td align="right">{t}Workorder Requestdate{/t}</td><td align="center"><B>{$data.REQUESTDATE}</B></td></tr>
<tr><td valign ="top" align="right">{t}Workorder Task Description{/t}</td>
    <td><textarea name="TASKDESC" cols="70" rows="3">{$data.TASKDESC}</textarea></td></tr>
<tr><th colspan="2">{t}Workorder classification{/t}</td></tr>
<tr><td align="right">{t}Workorder Priority{/t}</td>
    <td>{include file="_combobox.tpl" options=$priorities NAME="PRIORITY" SELECTEDITEM=$data.PRIORITY}</td></tr>
<tr><td align="right">{t}Workorder Type{/t}</td>
    <td>{include file="_combobox.tpl" options=$wotypes NAME="WOTYPE" SELECTEDITEM=$data.WOTYPE}</td></tr>
<tr><td align="right">{t}Workorder Budget{/t}</td>
    <td>{include file="_combobox.tpl" options=$budgets NAME="EXPENSE" SELECTEDITEM=$data.EXPENSE}</td></tr>
<tr><td align="right">{t}Projects{/t}</td>
    <td>{include file="_combobox.tpl" options=$projects NAME="PROJECTID" SELECTEDITEM=$data.PROJECTID}</td></tr>
<tr><td align="right">{t}Work is based on Standard Procedure{/t}</td><td align="center"><B>{$data.TASKNUM}</B></td></tr>
<tr><th colspan="2">{t}Workorder Object{/t}</td></tr>
<tr><td align="right"><a href="javascript://" onClick="treewindow('../actions/tree2/index.php?tree=EQUIP2','EQNUM')">{t}Select equipment{/t}</a></td>
    <td><input type="text" name="EQNUM" id="EQNUM" value="{$data.EQNUM}"><input type="text" name="DESCRIPTION" value="{$data.DESCRIPTION}"></td></tr>
<tr><td align="right">{t}Sub-Component{/t}</td>
    <td><input type="text" name="COMPONENT2" value="{$data.COMPONENT}"></td></tr>                
<tr><td align="right">{t}Previous Workorder{/t}</td>
    <td>{include file="_combobox.tpl" options=$previous_wos NAME="WOPREV" SELECTEDITEM=$data.PREVWO}</td></tr>
<tr><td align="right" onclick="javascript:query_components();">{t}Components in Machine{/t}</td>
    <td><div id="components"></div></td></tr>    
<tr><td align="right" onclick="javascript:query_tasks();">{t}Available Standard Tasks{/t}</td>
    <td><div id="tasks"></div></td></tr>    
<!-- Save or Close -->
<tr><td colspan="2">
    <input type="submit" class="submit" value="{t}Save{/t}" name="form_save">
    <input type="submit" class="submit" value="{t}Close{/t}"  name="close"></td></tr>
</table>
</form>

