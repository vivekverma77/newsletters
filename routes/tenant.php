<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use Stancl\Tenancy\Middleware\InitializeTenancyByDomain;
use Stancl\Tenancy\Middleware\PreventAccessFromCentralDomains;
use App\Http\Controllers\Company\DashboardController;
use App\Http\Controllers\Company\UserController;
use App\Http\Controllers\Company\ManageAccessController;
use App\Http\Controllers\Company\ContactController;
/*
|--------------------------------------------------------------------------
| Tenant Routes
|--------------------------------------------------------------------------
|
| Here you can register the tenant routes for your application.
| These routes are loaded by the TenantRouteServiceProvider.
|
| Feel free to customize them however you want. Good luck!
|
*/

Route::middleware([
    'web',
    InitializeTenancyByDomain::class,
    PreventAccessFromCentralDomains::class,
])->group(function () {
    
   /* Route::get('/', function () { return redirect("/login"); });*/
   Auth::routes();
   Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

   // Users Routes
   Route::get('/users', [UserController::class, 'index'])->name('users');
   Route::get('/users/view', [UserController::class, 'get'])->name('users.get');
   Route::get('/user/add', [UserController::class, 'create'])->name('user.create');
   Route::get('/user/edit/{id}', [UserController::class, 'edit'])->name('user.edit');

   Route::post('/user/add', [UserController::class, 'store'])->name('user.store');
   Route::post('/user/update/{id}', [UserController::class, 'update'])->name('user.update');
   Route::post('/user/delete', [UserController::class, 'delete'])->name('user.delete');
   
   //Manage Access Routes
   Route::get('/access', [ManageAccessController::class, 'index'])->name('access');
   Route::get('/access/edit/{id}', [ManageAccessController::class, 'edit'])->name('access.edit');

   Route::post('/access/get', [ManageAccessController::class, 'get'])->name('access.get');
   Route::post('/access/update', [ManageAccessController::class, 'update'])->name('access.update');

   //Contact Routes
   Route::get('/contacts', [ContactController::class, 'index'])->name('contacts');
   Route::get('/contact/add', [ContactController::class, 'create'])->name('contact.create');
   Route::get('/contacts/view', [ContactController::class, 'get'])->name('contacts.get');
   Route::get('/contact/edit/{id}', [ContactController::class, 'edit'])->name('contact.edit');

   Route::post('/contact/add', [ContactController::class, 'store'])->name('contact.store');
   Route::post('/contact/update', [ContactController::class, 'update'])->name('contacts.update');
});
