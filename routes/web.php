<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Auth\LoginController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
   if($_SERVER['SERVER_NAME'] == 'newsletters2.localhost'){
     return redirect("admin/login");
   }else{
     return redirect("/login");
   }
});

Route::get('/admin/login', [LoginController::class, 'index'])->name('admin.login');
Route::get('/admin/signout', [LoginController::class, 'signOut'])->name('admin.signout');
Route::post('/admin/login', [LoginController::class, 'authenticate'])->name('login');
Route::post('/admin/signout', [LoginController::class, 'signOut'])->name('admin.signout');

Route::get('/home', [HomeController::class, 'index'])->name('home');
Route::get('/test', [TestController::class, 'index'])->name('test');
