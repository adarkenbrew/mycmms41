<?php
/**
* Linking Documents using PHPVC filesystem
* 
* @package mycmms40
* @subpackage linking
* @filesource
*/
require("../includes/config_mycmms.inc.php");
require("setup.php");
define('PROJECT_DIR','../../common/documents_AF');

function getFileType($filename) {
    $ext = substr(strrchr($filename, "."), 1);
    return file_exists('img/'.$ext.'.gif') ? $ext.'.gif' : 'txt.gif';
}
function translatePath($path) {
    if(substr($path, strlen($path)-2, 2) == '//')
        $path = substr($path, 0, strlen($path)-2);
    if(substr($path, strlen($path)-1, 1) == '/')
        $path = substr($path, 0, strlen($path)-1);
    
        if(substr($path, strlen($path)-2, 2) == '..')
        {
            $path = substr($path, 0, (strlen($path)-3));
            $path = substr($path, 0, strrpos($path, '/'));
        }
    return $path;
} // EO translatePath
function createLink($file,$docu_system) {
    switch($_SESSION['DOCTYPE']) {
    case 'WONUM':
        $sql_unique="SELECT COUNT(*) FROM document_links WHERE WONUM='{$_SESSION['Ident_1']}' AND FILENAME='{$file}'";
        $sql_insert="INSERT INTO document_links (WONUM,FILENAME) VALUES (:type,:filename)";
        break;
    case 'EQNUM':
        $sql_unique="SELECT COUNT(*) AS 'QTY' FROM document_links WHERE EQNUM='{$_SESSION['Ident_1']}' AND FILENAME='{$file}'";
        $sql_insert="INSERT INTO document_links (EQNUM,FILENAME) VALUES (:type,:filename)";
        break;
    case 'TASKNUM':
        $sql_unique="SELECT COUNT(*) AS 'QTY' FROM document_links WHERE TASKNUM='{$_SESSION['Ident_1']}' AND FILENAME='{$file}'";
        $sql_insert="INSERT INTO document_links (TASKNUM,FILENAME) VALUES (:type,:filename)";
        break;
    case 'ITEMNUM':
        $sql_unique="SELECT COUNT(*) AS 'QTY' FROM document_links WHERE ITEMNUM='{$_SESSION['Ident_1']}' AND FILENAME='{$file}'";
        $sql_insert="INSERT INTO document_links (ITEMNUM,FILENAME) VALUES (:type,:filename)";
        break;
    }
    // Sanity check - do not add twice the same file...
    $exists=DBC::fetchcolumn($sql_unique,0);
    if ($exists!=0) { exit(); }
    $DB=DBC::get();
    DBC::execute($sql_insert,array("type"=>$_SESSION['Ident_1'],"filename"=>$file));
};

if (isset($_REQUEST['DOCTYPE'])) {  $_SESSION['DOCTYPE']=$_REQUEST['DOCTYPE']; }
switch($_SESSION['DOCTYPE']) {
    case 'WONUM':
        $sql_select="SELECT dl.FILENAME, dd.FILEDESCRIPTION FROM document_links dl LEFT JOIN document_descriptions dd ON dl.FILENAME=dd.FILENAME WHERE WONUM='{$_SESSION['Ident_1']}'";
        break;
    case 'EQNUM':
        $sql_select="SELECT dl.FILENAME, dd.FILEDESCRIPTION FROM document_links dl LEFT JOIN document_descriptions dd ON dl.FILENAME=dd.FILENAME WHERE EQNUM='{$_SESSION['Ident_1']}'";
        break;
    case 'TASKNUM':
        $sql_select="SELECT dl.FILENAME,dd.FILEDESCRIPTION FROM document_links dl LEFT JOIN document_descriptions dd ON dl.FILENAME=dd.FILENAME WHERE TASKNUM='{$_SESSION['Ident_1']}'";
        break;
    case 'ITEMNUM':
        $sql_select="SELECT dl.FILENAME,dd.FILEDESCRIPTION FROM document_links dl LEFT JOIN document_descriptions dd ON dl.FILENAME=dd.FILENAME WHERE ITEMNUM='{$_SESSION['Ident_1']}'";
        break;
}

$tpl = new smarty_mycmms();
if (is_file(PROJECT_DIR.translatePath($_REQUEST['file']))) {
    if(isset($_REQUEST['setlink'])) {
       createLink($_REQUEST['file'],DOCU);
    }
    $d=dir(PROJECT_DIR);
    $_REQUEST['file']=NULL;
} else { 
    $d=dir(PROJECT_DIR.translatePath($_REQUEST['file']));
}
for($i=0,$j=0,$files=array(),$directories=array(); $entry=$d->read(); ) {
    switch(strrchr($entry, ".")):
        case '.': 
        case '..':                                                                
            break;
        case '':        
            $directories[$j++]=array(0 => $entry, 1 => 'folder.gif'); 
            break;
        default: {
            $files[$i++] = array(
                0 => $entry,
                1 => getFileType($entry)
            );
        }
        break;
    endswitch;
    } // EO if
$d->close();

$tpl->assign('stylesheet',STYLE_PATH."/".CSS_UPLOAD);
$tpl->assign('index',"linking_documents.php");
$tpl->assign('object',$_SESSION['Ident_1']);
$tpl->assign('path', translatePath($_REQUEST['file']).'/');
$tpl->assign('files', $files);
$tpl->assign('directories', $directories);
$DB=DBC::get();
$result=$DB->query($sql_select);
$taskdocs=$result->fetchAll(PDO::FETCH_ASSOC);
$tpl->assign('rootdir',PROJECT_DIR);
$tpl->assign('taskdocs',$taskdocs);
$tpl->display('upload.tpl');
?>
