<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\CompanyRequest;
use App\Models\Tenant;
use App\Models\Domains;
use App\Models\User;
use App\Models\Role;
use Session;
use Redirect;
use Validator;
use Response;
use Hash;

class RegisterController extends Controller
{
    //

    public function __construct()
    {

    }
  
    /**
     * Show new company registration form
    */
    public function index()
    {
        return view('admin.company.register');
    }
    /**
     * Save company resgiter data
    */
    public function store(Request $request)
    {     //echo var_dump($_POST); 

        $validated = $request->validate([
            'company' => 'required',
            'full_name' => 'required',
            'domain' => 'required|unique:domains',
            'email' => 'required',
            'password' => 'required'
        ]);

         //$requestData = $request->validated();
         // echo '<pre>';print_r($request); echo '</pre>';
         $_token = $request->input('_token');
         $company = $request->input('company');
         $full_name = $request->input('full_name');
         $domain = $request->input('domain');
         $email = $request->input('email');
         $password = $request->input('password');
        
         // Specifying a default value...
         $company_arr = ['full_name'=>$full_name, 'password'=>$password];
         Session::put('company_request',$company_arr);
         
         // php artisan tinker
        //$tenant1 = App\Models\Tenant::create(['id' => 'foo']);
        //$tenant1->domains()->create(['domain' => 'foo.localhost']);
         
         $validated = $request->validate([
            'company' => 'required',
            'full_name' => 'required',
            'email' => 'required|unique:tenants',
         ]);

         $tenant = Tenant::create([ 'id' => $domain, 'company_name'=>$company,'email' => $email ]);
        
         $tenant->domains()->create(['domain' => $domain.'.'.$_SERVER['SERVER_NAME'] ]);
         
         $tenant->run(function ($tenant) {

          if(Session::has('company_request')){
                $company_arr = Session::get('company_request');
                $user_data = array(
                    'name'=> $company_arr['full_name'],
                    "email"=> $tenant->email,
                    'role_id'=> 1 ,// company account admin
                    "password"=>hash::make($company_arr['password']),
                );
                User::create($user_data);
                Session::forget('company_request');

                // Seed data in tenant DB
                $rolesSeeder = new \Database\Seeders\RolesTableSeeder();
                $rolesSeeder->run();
                $modulesSeeder = new \Database\Seeders\ModulesSeeder();
                $modulesSeeder->run();
                $AccessSeeder = new \Database\Seeders\AccessSeeder();
                $AccessSeeder->run();
            }
        });
        
        $response = array(
            'status' => 'success',
            'message' => 'Your account registered successfully. Please login to continue...',
            'redirect_url' => 'http://'.$domain.'.'.$_SERVER['SERVER_NAME']
        );
        return Response::json($response);
    }
    /**
     * Check company domain availability
    */
    public function checkDomain(Request $request)
    {   
        
        $domain = Domains::where('domain', $request->input('domain').'.'.$_SERVER['SERVER_NAME'])->get()->count();
        if ($domain) {
            return Response::json(false);
        } else {
            return Response::json(true);
        }
    }

    /**
     * Check company email availability
    */
    public function checkEmail(Request $request)
    {   
        
        $email = Tenant::where('email', $request->input('email'))->get()->count();
        if ($email) {
            return Response::json(false);
        } else {
            return Response::json(true);
        }
    }
   
}
