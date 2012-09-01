<?php
/** edit_query.php
* Help function used to save changes made by the administrator to the queries
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @access  public
* @package mycmms40
* @version 4.0
* @subpackage framework
* @filesource
* @todo Not well integrated in list.php, this is the original code from FreeCMMS
* ::: ../myCMMS/_main/edit_query.php , v 3.2 2011/01/27 09:29:41 (huysmans) :::
*/
require("../includes/config_mycmms.inc.php");
/**
* Formatting is handled via the sys.queries.template and sys_queries.template_section
*/
/**
$DB=DBC::get();
for($i = 0; $i < $_REQUEST['cols']; $i++) {
    $col_attr[$i] = array();
    $key = "key" . $i;
    $value = "value" . $i;
    for($j = 0; $j < count($_REQUEST[$key]); $j++) {
        if(!empty($_REQUEST[$key][$j])) {
	        $col_attr[$i][$_REQUEST[$key][$j]] = $_REQUEST[$value][$j];
	    }
    }
}
$cereal=serialize($col_attr);
**/
DBC::execute("UPDATE sys_queries SET mysql=:mysql WHERE name LIKE :query_name",array("mysql"=>$_REQUEST['sql_query'],"query_name"=>$_REQUEST['qry_name']));
header("location: list.php?query_name=".$_REQUEST['qry_name']);
?>

