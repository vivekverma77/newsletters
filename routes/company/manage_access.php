<?php

Route::get('/access', 'ManageAccessController@index')->name('access');
Route::get('/access/edit/{id}', 'ManageAccessController@edit')->name('access.edit');

Route::post('/access/get', 'ManageAccessController@get')->name('access.get');
Route::post('/access/update', 'ManageAccessController@update')->name('access.update');

?>