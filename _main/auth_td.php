<?PHP
/**  
* Authorisation TD: Check if the logged user is allowed to use this program 
* - Check if the user is known in the database
* - Save user relevant data in the Session
* - Reloads LIST 
* @author  Werner Huysmans <werner.huysmans@skynet.be>
* @access  public
* @package mycmms40
* @version 4.0
* @subpackage framework
* @filesource
* @DONE 0 -o HUYSMANS -c authorisation task: changes to work with integer profile
* @DONE 1 -o HUYSMANS -c query->fetch flow
*/
$nosecurity_check=true;
include("../includes/config_mycmms.inc.php");
$return_url=$HTTP_REFERER;
/** User must provide a valid login and password. We'll check these against the sys_groups table
*/
if(!empty($_POST['uid']) && !empty($_POST['passwd']))
{	$DB=DBC::get();
    $sql="SELECT profile AS 'profile',uname,longname,last_login,approver,dept,locale FROM sys_groups WHERE uname='".$_POST["uid"]."' AND passwd='".$_POST["passwd"]."'";
    $valid_user=$DB->query($sql)->fetch();
    if($valid_user) //if the login matched 1 user...
    {	$_SESSION['last_login'] =$valid_user['last_login'];
      	$_SESSION['group']      ="binary";  //  $valid_user['grp']; 
        $_SESSION['profile']    =$valid_user['profile'];
      	$_SESSION['user']       =$valid_user['uname'];
        $_SESSION['username']   =$valid_user['longname'];
		$_SESSION['APPROVER']	=$valid_user['approver'];
        $_SESSION['dept']       =$valid_user['dept'];
		$_SESSION['db']         =DBC::getDatabase();
        $_SESSION['locale']     =$valid_user['locale'];
        // $_SESSION['system']="td";
      	$verified = "Login Succesful";
	    // Record the login time in the database. This is used for showing new WOs
	    try {
            DBC::execute("UPDATE sys_groups SET last_login = NOW()+0 WHERE uname LIKE :username",array("username"=>$valid_user->uname));
        } catch (Exception $e) {
            $DB->rollBack();
            PDO_log("Transaction ".__FILE__." failed".$e->getMessage());        
        }
	} else {    
/** If the login failed... return page
* @var mixed
*/
		$verified = "<HTML><BODY>Login Failed<br><a href=\"./list.php\">Go Back</a></BODY></html>";
      	exit; 
    }
} else {    
/** Normally, there must always be some $_POST values when accessing this file
*/
    session_destroy();	
}
/**
* Redirect to default tab
*/
?>
<script type=text/javascript>
function reload()
{	top.location = "../index.php?nav=work_orders"; 
} 
setTimeout("reload();", 500)
</script>

