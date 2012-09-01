<?php
/**
* Retrieve the WIKI HELP Page
* 
* @var string SCRIPT_NAME
*/
function get_wiki_help($script) {
    $DB=DBC::get();
    $basename=basename($script);
    $wiki_locale="wiki_".$_SESSION['locale'];
    $wiki_HELP_Page=DBC::fetchcolumn("SELECT $wiki_locale FROM sys_security WHERE functionality='$basename'",0);      
    return WIKI.$wiki_HELP_Page;
}
?>
