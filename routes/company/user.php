<?php

Route::get('/users', 'UserController@index')->name('users');
Route::get('/users/view', 'UserController@get')->name('users.get');
Route::get('/user/add', 'UserController@create')->name('user.create');
Route::get('/user/edit/{id}', 'UserController@edit')->name('user.edit');

Route::post('/user/add', 'UserController@store')->name('users.store');
Route::post('/user/delete', 'UserController@delete')->name('users.delete');
Route::post('/user/update/{id}', 'UserController@update' )->name('user.update');
?>