<?php

Route::get('/contacts', 'ContactController@index')->name('contacts');
Route::get('/contact/add', 'ContactController@create')->name('contact.create');
Route::get('/contacts/view', 'ContactController@get')->name('contacts.get');
Route::get('/contact/edit/{id}', 'ContactController@edit')->name('contact.edit');

Route::post('/contact/add', 'ContactController@store')->name('contact.store');
Route::post('/contact/update', 'ContactController@update')->name('contacts.update');
?>