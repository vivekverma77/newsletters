<?php

use Illuminate\Support\Facades\Auth;
use App\Models\Access;
use App\Models\Module;
use App\Models\Role;


if(!function_exists('user_email')) {
	function user_email()
	{
		$user = Auth::user();

		return $user->email;
	}
}

if(!function_exists('access_check')) {
	function access_check($module_name,$action = 'view')
	{
		$module_check = Module::select('module_id')->where('module_name',$module_name)->get()->first();
		if (!empty($module_check)) {
            $module_id = !empty($module_check['module_id']) ? $module_check['module_id'] :'';
            
            $user_id = Auth::user()->id;
            $role_id = Auth::user()->role_id;

            if ($action) {
                switch ($action) {
                	  case "view":
                        $access_column = "access_view";
                        break;
                    case "add":
                        $access_column = "access_insert";
                        break;
                    case "edit":
                        $access_column = "access_update";
                        break;
                    case "delete":
                        $access_column = "access_delete";
                        break;
                }
            }

            if(Access::where('role_id',$role_id)->where('module_id',$module_id)->where($access_column,1)->get()->count() == 0){
                return false;
            }else{
               return true;
            }
        }  
	}
}