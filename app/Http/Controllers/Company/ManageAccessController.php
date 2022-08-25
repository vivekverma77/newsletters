<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Access;
use App\Models\Role;
use Response;
class ManageAccessController extends Controller
{
    //
    public function __construct()
    {           
        $this->middleware('tenantAuth');
    }

    /**
     * Show list of All User Role Permissions
    */
    public function index()
    {  
        if(!Auth::user()->role_id == 1){
              abort(401, 'This action is unauthorized.');
        }
        
        $roles = Role::all();                  
        $data = ['userRoles'=>$roles];
        return view('company.access.index',$data);
    }
    /**
     * Get the list of All User Role Permissions
    */
    public function get(Request $request)
    {   
        if(!Auth::user()->role_id == 1){
              abort(401, 'This action is unauthorized.');
        }

        $role_id = $request->get('role_id') ? $request->get('role_id') : 1;

        $access = Access::select('access.*','modules.*','roles.*')
                          ->join('modules','modules.module_id', '=', 'access.module_id','left')
                          ->join('roles','roles.role_id', '=', 'access.role_id','left')
                          ->where('access.role_id',$role_id)
                          ->get();
      $data = ['access'=>$access];                   
      $view = view("company.access.table",$data)->render();
      return response()->json(['status' => 'success','html'=>$view]);
    }
    /**
     * Edit/Update access data.
    */
    public function edit($id)
    {
     if(!Auth::user()->role_id == 1){
              abort(401, 'This action is unauthorized.');
      }   
     $access = Access::select('access.*','modules.*','roles.*')
                          ->join('modules','modules.module_id', '=', 'access.module_id','left')
                          ->join('roles','roles.role_id', '=', 'access.role_id','left')
                          ->where('access.access_id',$id)
                          ->get();
      $data = ['accessEdit'=>$access];
      $view = view("company.access.modal",$data)->render();
      return response()->json(['status' => 'success','html'=>$view]);
    }

     /**
     * Update user access .
    */
    public function update(Request $request)
    {   
        if(!Auth::user()->role_id == 1){
              abort(401, 'This action is unauthorized.');
        }
         $validated = $request->validate([
            'access_id' => 'required',
        ]);
        $id = $request->input('access_id');
        $access_view = $request->input('access_checkbox') ?  $request->input('access_checkbox') : 0;
        $access_insert = $request->input('insert_checkbox') ? $request->input('insert_checkbox') : 0;
        $access_update = $request->input('update_checkbox') ? $request->input('update_checkbox') : 0;
        $access_delete = $request->input('delete_checkbox') ? $request->input('delete_checkbox') : 0;
        Access::where('access_id', $id)->update(['access_view' => $access_view,'access_insert'=>$access_insert,'access_update'=>$access_update,'access_delete'=>$access_delete]);
        $response = array(
            'status' => 'success',
            'message' => 'User Role Access Successfully.',
        );
        return Response::json($response);
    }  
}
