<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Auth;
use Redirect;
use App\Models\Module;
use App\Models\Access;
class TenantAuth 
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {   
        if (!Auth::check()){
            return redirect::route('login');
        }
        else
        {
            $module_name = $request->segment(1);
            $access_column = "access_view";
            $module_action = $request->segment(2);

            if ($request->segment(2)) {
                switch ($module_action) {
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
            $module_check = Module::select('module_id')->where('module_name',$module_name)->get()->first();

            if (!empty($module_check)) {
                $module_id =  !empty($module_check['module_id']) ? $module_check['module_id'] :'';
                
                $user_id = Auth::user()->id;
                $role_id = Auth::user()->role_id;

                if(Access::where('role_id',$role_id)->where('module_id',$module_id)->where($access_column,1)->get()->count() == 0){
                    abort(401, 'This action is unauthorized.');
                }
            }  
           
           return $next($request);
        }
    }
}
