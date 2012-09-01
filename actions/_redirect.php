<?php
/** 
* Redirecting to Action
* 
* @author  Werner Huysmans
* @access  public
* @package mycmms40
* @subpackage framework
* @filesource
*/ 
?>
<script type="text/javascript">
    parent.title.document.getElementById('title').innerHTML='<?PHP echo $_REQUEST['title']; ?>';
    top.maintmain.location='<?PHP echo "../actions/".$_REQUEST['action']; ?>';
</script>