<style type="text/css">
  .access-check-box {display: none;}
</style>
<table class="access_view_table table text-center"  class="table table-bordered table-hover">
    <tr class="row-span">
      <td rowspan="2"> <b>Module Name</b></td>
      <td colspan="5"> <b>Access</b> </td>
    </tr>
    <tr class="row-span">
      <td>View</td>
      <td>Add</td>
      <td>Update</td>
      <td>Delete</td>
      <td></td>
   </tr>
   <?php 
   if(!empty($access)){
      foreach ($access as $key => $accessData) { 
        /*print_r($accessData);*/
        $access_id = !empty($accessData['access_id']) ? $accessData['access_id']: 0
         ?> 
   <tr>  
      <td><?php echo !empty($accessData['module_name']) ? ucfirst($accessData['module_name']):'';?>
         <input type="hidden" class="access_module_id" name="module_id" value="<?php echo !empty($accessData['module_id']) ? $accessData['module_id']: 0 ;?>">
         <input type="hidden" class="access_id" name="access_id" value="<?php echo !empty($accessData['access_id']) ? $accessData['access_id']: 0 ;?>">
      </td>
      <td class="access_view">
        <input type="checkbox" class="access-check-box check_view" value="<?php echo $accessData['access_view']?>" name="" <?php echo !empty($accessData['access_view']) && $accessData['access_view'] == 1 ? "checked":'';?> >
        <?php echo !empty($accessData['access_view']) && $accessData['access_view'] == 1 ? '<img src="'.asset("images/green.png").'">':'<img src="'.asset("images/red.png").'">';?>
      </td>
      <td class="access_insert">
       <input type="checkbox" class="access-check-box check_insert" value="<?php echo $accessData['access_insert']?>" name="" <?php echo !empty($accessData['access_insert']) && $accessData['access_insert'] == 1 ? "checked":'';?> >
        <?php echo !empty($accessData['access_insert']) && $accessData['access_insert'] == 1 ? '<img src="'.asset("images/green.png").'">':'<img src="'.asset("images/red.png").'">';?>
     </td>
      <td class="access_update"> 
         <input type="checkbox" class="access-check-box" value="<?php echo $accessData['access_update']?>" name="" <?php echo !empty($accessData['access_update']) && $accessData['access_update'] == 1 ? "checked":'';?> >
          <?php echo !empty($accessData['access_update']) && $accessData['access_update'] == 1 ? '<img src="'.asset("images/green.png").'">':'<img src="'.asset("images/red.png").'">';?>
      </td>
      <td class="access_delete"> 
         <input type="checkbox" class="access-check-box" value="<?php echo $accessData['access_delete']?>" name=""  <?php echo !empty($accessData['access_delete']) && $accessData['access_delete'] == 1 ? "checked":'';?> >
          <?php echo !empty($accessData['access_delete']) && $accessData['access_delete'] == 1 ? '<img src="'.asset("images/green.png").'">':'<img src="'.asset("images/red.png").'">';?>
     </td>
     <td>   
         <a href="javascript:void(0)" data-toggle="modal" data-target="#modal-info" class="change_access btn btn-danger btn-sm" style="float: none;margin: 0;padding: 5px 10px 6px;">Change Permission</a>
           
      </td>
   </tr>
  <?php }
 }?> 
 </table>