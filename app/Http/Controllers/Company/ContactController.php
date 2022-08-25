<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Contact;
use App\Models\Contact_email;
use DataTables;
use Hash;
use Response;

class ContactController extends Controller
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
        return view('company.contact.index');
    }
  
    /**
     * Get json of users list.
    */
    public function get(Request $request)
    {
        if ($request->ajax()) {
            $data = Contact::select('contacts.*')
                    ->get();
            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('emails', function($row){
                    $emails =  Contact_email::select('email')->where('contact_id',$row->id)->get();
                    $emails = json_decode($emails);
                    if(!empty($emails)){
                        $emailsList = '<ul class="list-group">';
                        $emailsList = '';
                        foreach ($emails as $key => $email) {
                             $emailsList .= '<li class="list-group-item">'.$email->email.'</li>';
                        }
                        $emailsList .= '</ul>';
                      return $emailsList;
                    }
                })
                
                ->editColumn('created_at', function ($request) {
                    return date('m-d-Y h:i a',strtotime($request->created_at)); // human readable format
                 })
                ->addColumn('action', function($row){
                    $actionBtn = '';
                    if(access_check('contacts','edit')){
                      $actionBtn .= '<a href="'.route('contact.edit', ['id' => $row->id]).'" class="edit btn btn-success btn-sm">Edit</a>';
                    }
                    if(access_check('contacts','delete')){
                      $actionBtn .= ' <a href="javascript:void(0)" class="delete btn btn-danger btn-sm" onclick="rowDelete('.$row->id.')">Delete</a>';
                     } 
                    return $actionBtn;
                })
                ->rawColumns(['action','emails'])
                ->make(true);
        }
    }
     /**
     * Add new user form.
    */
    public function create()
    {
        return view('company.contact.create');
    }
    /**
     * Save new user data.
    */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'emails' => 'required',
            'address' => 'nullable',
        ]);
           
        $contactData = [
            'first_name' => $request->input('first_name'),
            'last_name' => $request->input('last_name'),
            'tel' => $request->input('tel'),
            'address' => $request->input('address'),
            'street_num' => $request->input('street_num'),
            'city' => $request->input('city'),
            'postcode' => $request->input('postcode'),
            'province' => $request->input('province'),
            'country' => $request->input('country')
        ];

        $data = Contact::create($contactData);

        $emails = $request->input('emails');
        if(!empty($emails)){
            $emailsArr = explode(',', $emails);
            foreach ($emailsArr as $key => $email) {
                Contact_email::create(['contact_id'=>$data->id,'email'=>$email]);
            }
        }

        $response = array(
            'status' => 'success',
            'message' => 'Contact created successfully.',
            'redirect_url' => route('contacts')
        );
        return Response::json($response);
    }
    /**
     * Edit user data form.
    */
    public function edit($contact_id)
    {
        $data = ['contactData' => Contact::where('id',$contact_id)->get()->first()];
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
