<?php
/** search_record.php: Relay function to transmit criteria to query. Transmits the query with its parameters back to the list function.
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @access  public
* @package mycmms40
* @version 4.0
* @subpackage framework
* @filesource
*/
require("../includes/config_mycmms.inc.php");
$_SESSION['criteria']=$_REQUEST['ID']; 
$QUERY_NAME=$_REQUEST['QUERY_NAME'];

switch ($_SESSION['system']) {
case 'td':
case 'oee':
case 'production':
case 'pms':
case 'home':
    $link="list.php?query_name=".$QUERY_NAME;
    break;
default:
    $link="list.php?query_name=".$QUERY_NAME;
    break; 
} // End of switch
?>
<html>
<script type="text/javascript">
<!--
function show_results()
{	top.maintmain.location='<?PHP echo $link; ?>';
}
//-->
setTimeout("show_results();", 500);
</script>
<body>
</body>
</html>
