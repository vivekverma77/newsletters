<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Access;

class DashboardController extends Controller
{
    public function __construct()
    {           
        $this->middleware('tenantAuth');
    }
    /**
     * Show company dashboard
    */
    public function index()
    {  
        return view('company.dashboard');
    }
}
