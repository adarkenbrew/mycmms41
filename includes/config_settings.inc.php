<?php
/** Configuration file for myCMMS
* -- Customizable --
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @changed:   2010
* @access  public
* @version: 4.0
* @package mycmms40
* @subpackage framework
* @filesource
*/
define("SERVER_ADDRESS","localhost");   # Change to IP address
define("MYCMMS_ROOTDIR","/_github_local/mycmms41");   # Check !!!
define("DOC_PATH","/common/documents_TEST/");  # Check !!!
define("CMMS_DB","GIT");
define("WAMP_DIR","c:/wamp/www");   # Standard for WAMP, do not change
define("MYCMMS_PEAR_PATH","/common/pear/PEAR"); # Standard
define("SMARTY",WAMP_DIR.MYCMMS_ROOTDIR."/smarty/");    # Standard    
define("PEAR_PATH",WAMP_DIR.MYCMMS_PEAR_PATH);  # Standard
define("CMMS_STYLESHEET","myCMMS40_styles");    # Standard
define("CMMS_LIB","myCMMS40_lib");  // Standard for myCMMS 4.*
# Translations via GetText
define("CMMS_LOCALE_PATH","c:\wamp\www\common\locale"); # Standard 
define("CMMS_LOCALE","mycmms40");   # Standard
bindtextdomain(CMMS_LOCALE,CMMS_LOCALE_PATH);
textdomain(CMMS_LOCALE);
if (isset($_SESSION['locale'])) {
    $language=$_SESSION['locale'];  // Set during login
    putenv("LC_ALL=$language");
}
/**
* URL Settings
*/
define("CMMS_VERSION",4.1);
define("CMMS_TITLE","myCMMS-V4.1 Build 20120310");
define("CMMS_SERVER","http://".SERVER_ADDRESS.MYCMMS_ROOTDIR);  // Used by Images
define("DOC_LINK","http://".SERVER_ADDRESS.DOC_PATH);   // URL for documents
define("DOC_PATHS",WAMP_DIR.DOC_PATH);
define("STYLE_PATH","http://".SERVER_ADDRESS.MYCMMS_PEAR_PATH); // Used by SMARTY
define("WIKI","http://".SERVER_ADDRESS."/_documentation/myCMMS_MEDIAWIKI/index.php/mycmms_interface:");
define("WIKIDOC","http://".SERVER_ADDRESS."/myCMMS40_WIKI/index.php/");
/** 
* DOC_LINK: URL where the documents are stored
*/
// Settings
define("ITEMS_PER_PAGE",30);
define("DEBUG",true);
// Stylesheets
define("CSS_LISTS",CMMS_STYLESHEET."/lists.css");
define("CSS_LOGIN",CMMS_STYLESHEET."/exc_login.css");
define("CSS_EMPTY",CMMS_STYLESHEET."/empty.css");
define("CSS_LIST_TD",CMMS_STYLESHEET."/exc_prod_td_list.css");
define("CSS_LIST_PROD",CMMS_STYLESHEET."/exc_productionlist.css");    // Only used exceptionally
define("CSS_NAVIGATION",CMMS_STYLESHEET."/nav.css");
define("CSS_TITLE",CMMS_STYLESHEET."/title.css");
define("CSS_INPUT",CMMS_STYLESHEET."/inputscreen.css");
define("CSS_UPLOAD",CMMS_STYLESHEET."/upload_style.css");
define("CSS_PRINTOUT",CMMS_STYLESHEET."/printout.css");
define("CSS_SMARTY",CMMS_STYLESHEET."/smarty_base.css");
define("CSS_CALENDAR",CMMS_STYLESHEET."/calendar-win2K-1.css");
// Export files
define("EVENT_LOG","../document_links/EventWO.txt");
define("LAUNCH_LOG","../document_links/PPM_launched.txt");
define("MO_FILE","../documents/gettext_queries.php");
define("MO_FILE2","../documents/gettext_mysql.php");
define("MO_FILE3","../documents/gettext_DB_fields.php");
define("MO_FILE4","../document/gettext_smarty.php");
define("PDO_ERRORLOG","../documents/PDO_errorlog.txt");
// Logo
define("LOGO_TD",CMMS_SERVER."/images/mycmms.png");
//define("LOGO_TD",CMMS_SERVER."/images/logo_myCMMS_4_0_Smarty.png");
//define("LOGO_PROD",CMMS_SERVER."/images/logo_mycmms_4_0.png");
#define("LOGO_OEE",CMMS_SERVER."/images/logo_mycmms_3_2.png");
#define("LOGO_PMS",CMMS_SERVER."/images/logo_mycmms_3_2.png");
#define("LOGO_HOME",CMMS_SERVER."/images/logo_homenet.jpg");
define("LOGO_MYSQL",CMMS_SERVER."/images/mysql.png");  // MySQL logo displayed
define("LOGO_SF",CMMS_SERVER."/images/sf.png"); // SourceForge displayed
// Special extensions
define("OEE",false);  // OEE inactive
define("OEE_SERVER","http://192.168.1.3");
define("OEE_UID","root");
define("OEE_PWD","ibmhuy");
define("OEE_DB","mycmms_rt");
define("OEE_TABLE","beckhoff_free");
/**
* WEBCAL interface supposes you have the WebCalendar application on a Server
* All settings must be set manually
*/
define("WEBCAL",false);
define("WEBCAL_SERVER","http://backup/internet/webcalendar/login.php?login=admin&password=admin");
/**
* myCMMS uses warehouse functionality:
* - registration of IN/OUT
*/
define("WAREHOUSE",false);
define("WITH_8D",true);

/** $doc_links=array(
    "warehouse"=>DOC_LINK."warehouse/",
    "task"=>DOC_LINK."workorders/",
    "workorders"=>DOC_LINK."workorders/",
    "purchasing"=>DOC_LINK."purchasing/",
    "equipment"=>DOC_LINK."equipments/",
    "projects"=>DOC_LINK."projects/",
    "temp"=>DOC_LINK."temporary/",
    "import"=>DOC_LINK."import/",
    "export"=>DOC_LINK."export/",
    "maintenance"=>DOC_LINK."maintenance/",
    "mycmms"=>DOC_LINK."mycmms/"
    );
**/
$doc_paths=array(
    "warehouse"=>DOC_PATHS."warehouse/",
    "workorders"=>DOC_PATHS."workorders/",
    "purchasing"=>DOC_PATHS."purchasing/",
    "equipment"=>DOC_PATHS."equipments/",
    "projects"=>DOC_PATHS."projects/",
    "temp"=>DOC_PATHS."temporary/",
    "import"=>DOC_PATHS."import/",
    "export"=>DOC_PATHS."export/",
);
$rootdirs=array (
    'wo'=>'../workorders/',
    'pt'=>'../projects/',
    'wh'=>'../warehouse/',
    'object'=>'../objects/',
    'oee'=>'../oee/',
    'po'=>'../purchasing/',
    'ppm'=>'../ppm/',
    'system'=>'../system/',
    'admin'=>'../_mycmms/',
    'mgt'=>'../management/',
    'production'=>'../production/'
    );
?>
