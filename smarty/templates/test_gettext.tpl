<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="{$stylesheet}" rel="stylesheet" type="text/css" />
<script type="text/javascript">
parent.resizeTo(1200,800);
</script>
<style type="text/css">
div.NT {
    color= white;
    background-color= red;
}
</style>    
</head>
<body>
<table>
<tr><th>SOURCE</th>
{foreach item=language from=$languages}
<th>{$language}</th>
{/foreach}
</tr>
{foreach item=translation from=$data}
<tr><td>{$translation.source}</td>
    <td>{$translation.en_GB}</td>
    <td>{$translation.nl_NL}</td>
    <td>{$translation.fr_FR}</td>
    <td>{$translation.gr_GR}</td>
    <td>{$translation.es_ES}</td></tr>
{/foreach}
</table>
</body>
</html>