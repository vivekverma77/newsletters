<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Hash;
use Session;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
     * Handle an authentication attempt.
     *
     * @param  \Illuminate\Http\Request $request
     *
     * @return Response
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    
    public function index()
    {
        return view('admin.auth.login');
    }
    public function authenticate(Request $request)
    {
         $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);    
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            return redirect()->intended('dashboard')
                        ->withSuccess('Signed in');
        }
  
        return redirect("/admin/login")->withErrors('Login details are not valid');
    }
    public function signOut() {
        Session::flush();
        Auth::logout();
        return Redirect('admin/login');
    }
}