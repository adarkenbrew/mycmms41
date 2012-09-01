<?php
/**
* Smarty Setup
* 
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage framework
* @filesource
*/
require('config_settings.inc.php');
require('smarty/Smarty.class.php');
// require('smarty/Smarty_Compiler.class.php'); 

class smarty_mycmms extends Smarty { 
   function __construct() { 
        parent::__construct(); 
        $this->template_dir = SMARTY.'templates/'; 
        $this->compile_dir  = PEAR_PATH.'/temp/templates_c/'; 
        $this->config_dir   = SMARTY.'configs/'; 
        $this->cache_dir    = SMARTY.'cache/'; 

        $this->caching = Smarty::CACHING_OFF;
        $this->assign('app_name', 'mycmms'); 
   } 
} 
?>
