<style type="text/css">
  table.edit_access .access-check-box {display: block;width: 20px;height: 20px;}
</style>
<form action="{{ route('access.update') }}" method="POST" id="accessEditForm">
  <div class="table-responsive">
   <table class="edit_access table">
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
     <?php if(!empty($accessEdit)){
        foreach ($accessEdit as $key => $accessData) { 
          $access_id = !empty($accessData['access_id']) ? $accessData['access_id']: 0;        
     ?> 
     <tr>
        <td><?php echo !empty($accessData['module_name']) ? ucfirst($accessData['module_name']):'';?>
           <input type="hidden" class="module_id" name="module_id" value="<?php echo !empty($accessData['module_id']) ? $accessData['module_id']: 0 ;?>">
           <input type="hidden" class="access_id" name="access_id" value="<?php echo !empty($accessData['access_id']) ? $accessData['access_id']: 0 ;?>">
        </td>
        <td class="access_view">
          <input type="checkbox" class="access-check-box check_view" value="1" name="access_checkbox" <?php echo !empty($accessData['access_view']) && $accessData['access_view'] == 1 ? "checked":'';?> >
        </td>
        <td class="access_insert">
         <input type="checkbox" class="access-check-box check_insert" value="1" name="insert_checkbox" <?php echo !empty($accessData['access_insert']) && $accessData['access_insert'] == 1 ? "checked":'';?> >
       </td>
        <td class="access_update"> 
           <input type="checkbox" class="access-check-box" value="1" name="update_checkbox" <?php echo !empty($accessData['access_update']) && $accessData['access_update'] == 1 ? "checked":'';?> >
        </td>
        <td class="access_delete"> 
           <input type="checkbox" class="access-check-box" value="1" name="delete_checkbox"  <?php echo !empty($accessData['access_delete']) && $accessData['access_delete'] == 1 ? "checked":'';?> >
        </td>
        
     </tr>
    <?php }
   }?> 
   </table>
 </div>
</form>
  