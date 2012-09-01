<html>
<head>
<title></title>
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="600">
<tr><th colspan="2">WO data</th></tr>
<tr><td>WONUM</td><td>{$wo_data.WONUM}</td></tr>
<tr><td>REPORT</td><td>{$wo_data.REPORT}</td></tr>
<tr><td>CLID</td><td>{$wo_data.ORIGINATOR}</td></tr>
<tr><td>TASKDESC</td><td>{$wo_data.TASKDESC}</td></tr>
<tr><td>TEXTS_B</td><td>{$wo_data.TEXTS_B}</td></tr>
<tr><td>AX</td><td>{$wo_data.REPORT_AX}</td></tr>
</table>
<hr>
<pr><b>{$webcal}</b></pr>
<table width="600">
<tr><th colspan="4">WEBCAL</th></tr>
{foreach item=entry from=$webcal_data}
<tr bgcolor="{cycle values="WHITE,LIGHTSTEELBLUE"}">
<td>{$entry.cal_id}</td><td>{$entry.cal_name}</td><td>{$entry.cal_location}</td><td>{$entry.cal_description}</td>
</tr>
{/foreach}
</table>
<hr>
<table width="600">
<tr><th colspan="4">WEBCAL update</th></tr>
<tr bgcolor="{cycle values="WHITE,CYAN"}">
<td>{$webcal_new.cal_id}</td><td>{$webcal_new.cal_name}</td><td>{$webcal_new.cal_location}</td><td>{$webcal_new.cal_description}</td>
</tr>
</table>


</body>
</html>