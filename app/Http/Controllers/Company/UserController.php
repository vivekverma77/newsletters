<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Role;
use DataTables;
use Hash;
use Response;

class UserController extends Controller
{
    //
    function __construct(){

        $this->middleware('tenantAuth');
    }

    /**
     * Show the company users list.
     */
    public function index()
    {
        return view('company.user.index');
    }
  
    /**
     * Get json of users list.
    */
    public function get(Request $request)
    {
        if ($request->ajax()) {
            $data = User::select('users.*','roles.role_name')
                    ->join('roles', 'users.role_id', '=', 'roles.role_id','left')
                    ->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->editColumn('created_at', function ($request) {
                    return date('m-d-Y h:i a',strtotime($request->created_at)); // human readable format
                 })
                ->addColumn('action', function($row){
                    $actionBtn = '';
                    if(access_check('users','edit')){
                        $actionBtn .= '<a href="'.route('user.edit', ['id' => $row->id]).'" class="edit btn btn-success btn-sm">Edit</a> ';
                    }
                    if(access_check('users','delete')){
                        $actionBtn .= '<a href="javascript:void(0)" class="delete btn btn-danger btn-sm" onclick="rowDelete('.$row->id.')">Delete</a>';
                      }
                    return $actionBtn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    }
     /**
     * Add new user form.
    */
    public function create()
    {
        $data = ['userRoles' => Role::all()];
        return view('company.user.create',$data);
    }
    /**
     * Save new user data.
    */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required',
            'email' => 'required|unique:users',
            'role_id' => 'required',
            'password' => 'required|min:5',
        ]);
        $name = $request->input('name');
        $email = $request->input('email');
        $role_id = $request->input('role_id');
        $password = $request->input('password');
        User::create(['name' => $name,'email'=>$email,'password'=>hash::make($password),'role_id'=>$role_id]);
        $response = array(
            'status' => 'success',
            'message' => 'User created successfully.',
            'redirect_url' => route('users')
        );
        return Response::json($response);
    }
    /**
     * Edit user data form.
    */
    public function edit($user_id)
    {
        $data = ['userRoles' => Role::all(),'userData' => User::where('id',$user_id)->get()->first()];
        return view('company.user.edit',$data);
    }
    /**
     * Update user data.
    */
    public function update(Request $request, $id)
    {
         $validated = $request->validate([
            'name' => 'required',
            'email' => 'required',
            'role_id' => 'required',
        ]);
        $name = $request->input('name');
        $email = $request->input('email');
        $role_id = $request->input('role_id');
        User::where('id', $id)->update(['name' => $name,'email'=>$email,'role_id'=>$role_id]);
        $response = array(
            'status' => 'success',
            'message' => 'User updated successfully.',
            'redirect_url' => route('users')
        );
        return Response::json($response);
    }
    /*
        Delete user
    */
    public function delete(Request $request)
    {
       $validated = $request->validate(['id'=>'required']);
       User::where('id',$request->input('id'))->delete();
       $response = array(
            'status' => 'success',
            'message' => 'User delete successfully.',
        );
       return Response::json($response);    
    }

}
