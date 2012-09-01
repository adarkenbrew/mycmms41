<!-- Ending the standard form -->
<table class='list'>
<tr><th class="th"><?PHP echo _("Employee"); ?></th> 
    <th class="th"><?PHP echo _("Work date"); ?></th>   
    <th class="th"><?PHP echo _("Planned"); ?></th></tr>
<?PHP
    foreach($result->fetchAll(PDO::FETCH_OBJ) as $row) {
        $this->data_sql="SELECT ID,EMPCODE,WODATE,ESTHRS FROM woe WHERE WONUM={$this->input1} AND ID='{$row->ID}'";
        $data=$this->get_data($this->input1,$row->ID);    
        if ($_REQUEST['ID']!=$data->ID) {
?>
<!-- Activate Edit screen -->
<tr><td>
<form action="<?PHP echo $_SERVER['SCRIPT_NAME']; ?>" name="EDIT" method="get">
<input type="hidden" name="ACTION" value="EDIT">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="<?PHP echo $data->ID; ?>">
        <?PHP echo $data->EMPCODE; ?></td>
    <td><?PHP echo $data->WODATE; ?></td>
    <td><?PHP echo $data->ESTHRS; ?></td> 
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="EDIT"></a></td></tr>
</form>
<?PHP            
        } else {
?>
<tr><td>
<form action="<?PHP echo $_SERVER['SCRIPT_NAME']; ?>" name="EDIT" method="post">  
<input type="hidden" name="ACTION" value="UPDATE">
<input type="hidden" name="form_save" value="SET">
<input type="hidden" name="ID" value="<?PHP echo $data->ID; ?>">
        <?PHP echo create_combo("SELECT uname AS 'id',uname AS 'text' FROM sys_groups","EMPCODE",$data->EMPCODE,""); ?></td>
    <td><?PHP echo create_date_box("WODATE","WODATE",15,$data->WODATE); ?></td>
    <td><?PHP echo create_text("ESTHRS",3,$data->ESTHRS); ?></td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/UPDATE.png" width="20" alt="UPDATE"></a></td>
</tr></form>
<?PHP
        } //EO Update
} 
?>
<tr><td>
<form action="<?PHP echo $_SERVER['SCRIPT_NAME']; ?>" name="INSERT" method="post"> 
<input type="hidden" name="ACTION" value="INSERT">
<input type="hidden" name="form_save" value="SET">
        <?PHP echo create_combo("SELECT uname AS 'id',uname AS 'text' FROM sys_groups","EMPCODE","",""); ?></td>
    <td><?PHP echo create_date_box("WODATE","WODATE",15,""); ?></td>
    <td><?PHP echo create_text("ESTHRS",3,"0"); ?></td>
    <td align="center"><a href="javascript:document.EDIT.submit()"><input type="image" src="../images/INSERT.jpg" width="20" alt="UPDATE"></a></td></tr>
</form>
</table>
<!-- Avoiding problems with standard form -->
<form>
<?PHP               