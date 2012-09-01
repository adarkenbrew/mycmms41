<?PHP
/** 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage printout
* @filesource
*/
$nosecurity_check=true;
require("../includes/config_mycmms.inc.php");
require("setup.php");
$PrtScn=true;
$EQNUM=$_REQUEST['id1'];

# Data preparation
$DB=DBC::get();
$result=$DB->query("SELECT EQNUM,DESCRIPTION,EQTYPE,SPARECODE FROM equip WHERE equip.EQNUM='$EQNUM'");
$object_main_data=$result->fetch(PDO::FETCH_ASSOC);

$result=$DB->query("SELECT COMPONENT,DESC_COMP,COMPTYPE FROM equip_components ec WHERE ec.EQNUM='$EQNUM'");
$components=$result->fetchAll(PDO::FETCH_ASSOC);

$result=$DB->query("SELECT wo.WONUM,EQNUM,REQUESTDATE,TASKDESC FROM wo WHERE EQNUM like '$EQNUM' ORDER BY WONUM DESC LIMIT 0,25");
$workorders=$result->fetchAll(PDO::FETCH_ASSOC);

$sparecode=DBC::fetchcolumn("SELECT SPARECODE FROM equip WHERE EQNUM='$EQNUM'",0);
$result=$DB->query("SELECT spares.ITEMNUM,MAPICS,DESCRIPTION,NOTES,LOCATION,QTYONHAND FROM spares LEFT JOIN invy ON spares.ITEMNUM=invy.ITEMNUM LEFT JOIN stock ON spares.ITEMNUM=stock.ITEMNUM WHERE SPARECODE='$sparecode'");
$spares=$result->fetchAll(PDO::FETCH_ASSOC);

$result=$DB->query("SELECT * FROM equip_status WHERE EQNUM='$EQNUM'");
$status=$result->fetchAll(PDO::FETCH_ASSOC);

$doc_links["equipment"];
$result=$DB->query("SELECT dl.FILENAME, FILEDESCRIPTION FROM document_links dl LEFT JOIN document_descriptions dd ON dl.FILENAME=dd.FILENAME WHERE EQNUM='$EQNUM'");
$documents=$result->fetchAll(PDO::FETCH_ASSOC);

// $result=$DB->query("SELECT ID,STARTDATE,TITLE,WONUM FROM 8D d LEFT JOIN wo_8D_eqnum wd ON d.ID=wd.REF8D WHERE d.EQNUM='$EQNUM'");

# Printout
$tpl=new smarty_mycmms();
$tpl->debugging=false;
$tpl->caching=false;
$tpl->assign('stylesheet',STYLE_PATH."/".CSS_PRINTOUT);
$tpl->assign("doc_link",DOC_LINK);
$tpl->assign("object_main_data",$object_main_data);
$tpl->assign("components",$components);
$tpl->assign("workorders",$workorders);
$tpl->assign("spares",$spares);
$tpl->assign("documents",$documents);
$tpl->assign("status",$status);
$tpl->display('printout_object.tpl');
?>
