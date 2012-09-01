<?php
/** 
* Printout WeekPlanning
* 
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @changed:   20081201
* @access  public
* @package mycmms40
* @subpackage REMACLE
* @filesource
*/
require("../includes/config_mycmms.inc.php");
require(CMMS_LIB."/class_actionPage.php");
function date2string ($time_MyDate) {
    $array_MyDate=getdate($time_MyDate);
    return $array_MyDate["year"]."-".$array_MyDate['mon']."-".$array_MyDate['mday'];
}
$action=new actionPage();
$action->calendar=true;
$action->HeaderPage("Show Weekplanning");
?>
<form action="<?PHP echo $_SERVER['SCRIPT NAME']; ?>" method="post">
<table>
<tr><td><?PHP echo create_date_box("VAN","VAN",10,""); ?></td></tr>
<tr><td><input type="submit" value="convert"></td></tr>
</table>
</form>
<?php
if (!empty($_REQUEST['VAN'])) {
    $filename=$doc_paths['export'].'weekplan.xml';
    $filelink=$export_path.'weekplan.xml';
    $DB=DBC::get();
    $StartWeek=$_REQUEST['VAN'];
    $tVAN=strtotime($_REQUEST['VAN']);
    $tTOT=strtotime("+6 days",$tVAN);
    $EndWeek=date2string($tTOT);
    // Let's make sure the file exists and is writable first.
    if (is_writable($filename)) {
        if (!$handle = fopen($filename, 'w+')) {
             echo "Cannot open file ($filename)";
             exit;
        }
        $header="<?xml version='1.0' encoding='iso8859-1'?>
    <?xml:stylesheet type='text/xsl' href='weekplan.xsl' ?> 
    <mycmms3>\n<employees>\n";

        if (fwrite($handle, $header) == FALSE) {
            echo "Cannot write to file ($filename)";
            exit;
        }
        $sql = "SELECT woe.EMPCODE,wo.WONUM,wo.TASKDESC,WEEKDAY(woe.WODATE) AS WEEKDAG,woe.WODATE,woe.ESTHRS,wo.PRIORITY FROM woe 
            LEFT JOIN wo ON woe.WONUM=wo.WONUM WHERE woe.ESTHRS IS NOT NULL AND woe.ESTHRS >0 
            AND WODATE BETWEEN '{$StartWeek}' AND '{$EndWeek}'  
            ORDER BY EMPCODE";
        $result=$DB->query($sql);
        echo "Starting creation of $filename ...";
        $employee="";
        foreach ($result->fetchAll(PDO::FETCH_OBJ) as $row) {
            if ($employee != $row->EMPCODE) {
                if ($employee != "") {
                    fwrite($handle,"</jobs>\n</employee>\n");
                }
                $EMPLine = "<employee>\n<name>{$row->EMPCODE}</name>\n<jobs>\n";
                fwrite($handle,$EMPLine);
                $employee = $row->EMPCODE;
            } 
            $JobLine = "<job{$row->WEEKDAG}>\n";
            $JobLine .= "<jobname>{$row->WONUM}</jobname>\n";
            $JobLine .= "<jobtext>".htmlspecialchars($row->TASKDESC)."</jobtext>\n";
            $JobLine .= "<weekday>{$row->WEEKDAG}</weekday>\n";
            // $JobLine .= "<jobtime>{$row->ESTHRS}</jobtime>\n";
            // $JobLine .= "<prio>{$row->PRIORITY}</prio>\n";
            $JobLine .= "</job{$row->WEEKDAG}>\n";
            fwrite($handle,$JobLine."\n");
        }
        $footer="</jobs>\n</employee>\n</employees>\n</mycmms3>";
        fwrite($handle,$footer);
        fclose($handle);
    } else {
        echo "The file $filename is not writable<BR>";
    }
?>
<P>Creation of <a href="<?PHP echo $filelink; ?>">WEEKPLAN</a> is finished!</P>
<?php
}
?>

