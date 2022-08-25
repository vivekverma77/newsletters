<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('tenantAuth');

    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        
       // $users =\App\Models\User::all()->toArray(); 
        //print_r($users);   
        return view('company.home');
    }
}
