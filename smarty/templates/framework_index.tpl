<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<title>{$page_title}</title>
<meta http-equiv="Content-Type" content="text/html;" />
</head>
<frameset cols="*" rows="65px,*" framespacing="0" border="0"  bordercolor="#000000" >
<frame class="title" src="_main/{$title}?nav={$settings.nav}" name="title" scrolling="no" frameborder="0" bgcolor="5961a0">

<frameset cols="200,*" rows="*" framespacing="0" border="0" bordercolor="#000000">
<frame src="./_main/nav.php" name="nav" frameborder="0" border="0"  marginwidth="5" marginheight="20"/>
<frame src="./_main/list.php?query_name={$query}" name="maintmain" marginwidth="5"  marginheight="20" frameborder="0"/>
</frameset>

</frameset>
</html>