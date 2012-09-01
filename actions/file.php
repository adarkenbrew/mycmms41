<?php
/**
*   Project : PHPVC (PHP Version Control)
*   Copyright (c) 2002, 2003  Bernhard Fröhlich
*   email             :   <frobez99@htl-kaindorf.ac.at>
*   icq#              :   <72971968>                                        
*   project homepage  :   <http://sourceforge.net/projects/phpvc>       
*
* @package  PHPVC
* @author Bernhard Fröhlich
* @filesource
* @license: This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details. 
*/
require('config.inc.php');
require('lib/funcs.lib.php');
require('lib/'.DBTYPE.'.class.php');
require('lib/Smarty.class.php');
require('lib/Smarty_Compiler.class.php');

$tpl = new Smarty;
#$tpl->compile_check = true;
#$tpl->debugging = true;

switch($do):
    case "delete":  deleteTodo($file_id, $todo_id); break;
    case "new":     createTodo($file_id, $user, $msg); break;
    case "dbaction": createDBA(); break;
endswitch;

$rev = $date = $user = $last_log = '';
$user='huysmans';
getDataOfFile(PROJECT_DIR.''.translatePath($file));

$files = array(1 => 'txt.gif');
if($rev != '&nbsp;')
{
    $files = array(
        0 => substr(strrchr($file, '/'), 1),
        1 => getFileType($file),
        2 => $rev,
        3 => $date,
        4 => $user,
    );
    
    $sql = "SELECT id FROM ".DBT_FILES." WHERE path = '".PROJECT_DIR.''.substr($file, 0, strpos($file, '/', 1))."' AND filename = '".substr(strrchr($file, '/'), 1)."'";
    $res = $db->FetchRow($db->Query($sql));
    $sql = "SELECT todo_id, time, user, msg FROM ".DBT_TODO." WHERE file_id = '".$res[0]."' ORDER BY time ASC";
    $todo = BuildArray($db->Query($sql));
}
# DB
$db_actions = BuildArray($db->Query("SELECT module,action,tablefield FROM pvc_data WHERE module='{$files[0]}'"));

$tpl->assign('userName', USER);
$tpl->assign('file_id', $res[0]);
$tpl->assign('todo', $todo);
$tpl->assign('db_actions',$db_actions);
$tpl->assign('return_path', substr($file, 0, strpos($file, '/', 1)));
$tpl->assign('include_path', PROJECT_DIR.''.translatePath($file));
$tpl->assign('path', translatePath($file));
$tpl->assign('files', $files);
$tpl->display('file.tpl');


$db->Disconnect();
?>