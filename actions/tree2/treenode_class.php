<?php
/** 
* TreeNode Class
* @author  Werner Huysmans 
* @access  public
* @package mycmms40
* @subpackage framework
* @filesource
*/
class treenode {
    public $id;
    public $m_title;
    public $m_poster;
    public $type;
    public $m_posted;
    public $m_children;
    public $m_childlist;
    public $m_depth;

public function __construct($id,$title,$poster,$type,$posted,$children,$expand,$depth,$expanded,$sublist) {
        global $tree_table;
        $this->id = $id;
        $this->m_title = $title;
        $this->m_poster = $poster;
        $this->type = $type;
        $this->m_posted = $posted;
        $this->m_children =$children;
        $this->m_childlist = array();
        $this->m_depth = $depth;
        if(($sublist || $expand) && $children) {
                $DB=DBC::get();
                $result=$DB->query("select * from $tree_table where parent='".$id."' ORDER BY EQORDER");
                for ($count=0; $row=$result->fetch(PDO::FETCH_ASSOC); $count++)  {
                        if($sublist || $expanded[$row['postid']] == true) {
                                $expand = true;
                        } else {
                                $expand = false;
                        }
                        $this->m_childlist[$count]= new treenode($row['postid'],$row['EQNUM'],$row['DESCRIPTION'],$row['EQFL'],$row['posted'],$row['children'], $expand,$depth+1,$expanded, $sublist);
                } // EO for
        } // EO if
} // End of _construct
function display($row) {
global $myfunction;
$settings=array(
    "depth"=>$this->m_depth,
    "children"=>$this->m_children,
    "childlist"=>sizeof($this->m_childlist),
    "subexpand"=>false,
    "subnoexpand"=>false
);
$data=array(
    "ID"=>$this->id,
//    "tree"=>"equip",
    "function"=>$myfunction."?id1=".$this->m_title."&id2=".$this->m_poster,
    "KEY"=>$this->m_title,
    "KEY_DESCRIPTION"=>$this->m_poster,
    "KEY_TYPE"=>$this->type
);
if ($this->m_children && sizeof($this->m_childlist)) { 
    $settings['subexpand']=true; 
} else if ($this->m_children) { 
    $settings['subnoexpand']=true; }

$tpl=new smarty_mycmms();    
$tpl->caching=false;
$tpl->assign('settings',$settings);
$tpl->assign('data',$data);
$tpl->display("treewindow_tree.tpl");
$row++;
    
$num_children=sizeof($this->m_childlist);
for($i = 0; $i<$num_children; $i++) {
    $row=$this->m_childlist[$i]->display($row, $sublist);
}
return $row;
} // EO display
}
?>
