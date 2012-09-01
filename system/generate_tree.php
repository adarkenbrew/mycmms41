<?php
/** 
* Generate_tree
*
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @access  public
* @package mycmms40_objects
* @subpackage objects
* @filesource
**/
set_time_limit(0);
require("../includes/config_mycmms.inc.php");  
require("setup.php");

switch ($_REQUEST['STEP']) {
    case "1": { // Limit date set, calculating Next Due Dates
        $DB=DBC::get();
        $Table=$_REQUEST['TABLE'];
        switch ($Table) {
            case 'taskeq_tree':
                require("TXID_TASKEQ_TREE.php");
                break;
        }
        // Run through all records...
        $result=$DB->query("SELECT DISTINCT e1.EQROOT,e2.postid FROM $Table e1 LEFT JOIN $Table e2 ON e1.EQROOT=e2.EQNUM");
        foreach ($result->fetchAll(PDO::FETCH_NUM) as $row) {
            $st=$DB->prepare("UPDATE $Table SET parent=:parent WHERE EQROOT=:eqroot");
            $st->execute(array("parent"=>$row[1],"eqroot"=>$row[0]));
        } 
        $st=$DB->prepare("UPDATE $Table SET children=0");
        $st->execute();
        $result=$DB->query("SELECT e1.EQROOT,COUNT(*) AS 'Aantal' FROM $Table e1 LEFT JOIN $Table e2 ON e1.EQNUM=e2.EQROOT GROUP BY e1.EQROOT");
        $i=0;
        foreach ($result->fetchAll(PDO::FETCH_NUM) as $row) {
            $tree_report[$i]['MCH']=$row[0]; $tree_report[$i]['CHILDREN']=$row[1];
            $st=$DB->prepare("UPDATE $Table SET children=1 WHERE EQNUM=:eqnum");
            $st->execute(array("eqnum"=>$row[0]));
            $i++;
        } 
        $st=$DB->prepare("UPDATE $Table SET parent=0 WHERE EQROOT='ROOT'");
        $st->execute(); 
        
        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("tree_report",$tree_report);
        $tpl->display("generate_tree_end.tpl");
        break;
    }   // EO STEP1
    default: {
        require("../actions/_wikihelp.php");
        
        $tpl=new smarty_mycmms();
        $tpl->assign("stylesheet",STYLE_PATH."/".CSS_SMARTY);
        $tpl->assign("tables",array("equip","rff_tree","oee_tree","equip_clients"));
        $tpl->assign("wiki",get_wiki_help($_SERVER['SCRIPT_NAME']));
        $tpl->display("generate_tree_form.tpl");
    }
}
set_time_limit(30);
?>
