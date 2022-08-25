<?php 

Route::get('/company/regsiter', 'RegisterController@index');
Route::get('/company/test', 'RegisterController@test');

Route::post('/company/checkDomain', 'RegisterController@checkDomain');
Route::post('/company/checkEmail', 'RegisterController@checkEmail');
Route::post('/company/insert', 'RegisterController@store')->name('company.insert');

Route::get('/companies', 'CompanyController@index')->name('companies');
Route::get('/companies/get', 'CompanyController@get')->name('companies.get');
?>