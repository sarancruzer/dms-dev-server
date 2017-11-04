<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:api');



Route::group(["middleware"=>"cors"], function(){
	Route::post('authenticate', 'AuthenticateController@authenticate');
	Route::post('userRegister', 'UserController@create');

Route::group(["middleware"=>"jwt.auth"], function(){

	//Master modules
	Route::post('getTerritory', 'TerritoryController@index');
	Route::post('addTerritory', 'TerritoryController@create');
	Route::post('updateTerritory/{id}', 'TerritoryController@update');		
	Route::post('deleteTerritory/{id}', 'TerritoryController@destroy');	

	//Master modules
	Route::post('getState', 'StateController@index');
	Route::post('addState', 'StateController@create');
	Route::post('updateState/{id}', 'StateController@update');		
	Route::post('deleteState/{id}', 'StateController@destroy');	

	//Master modules
	Route::post('getClientType', 'ClientTypeController@index');
	Route::post('addClientType', 'ClientTypeController@create');
	Route::post('updateClientType/{id}', 'ClientTypeController@update');		
	Route::post('deleteClientType/{id}', 'ClientTypeController@destroy');	

	//Master modules
	Route::post('getTitle', 'TitleController@index');
	Route::post('addTitle', 'TitleController@create');
	Route::post('updateTitle/{id}', 'TitleController@update');		
	Route::post('deleteTitle/{id}', 'TitleController@destroy');	

	// Route::post('getTerritory', 'TerritoryController@index');
	// Route::post('addTerritory', 'TerritoryController@create');
	// Route::post('updateTerritory/{id}', 'TerritoryController@update');		
	// Route::post('deleteTerritory/{id}', 'TerritoryController@destroy');	

	//Manage Users
	Route::post('getUser', 'UserController@index');
	Route::post('addUser', 'UserController@create');
	Route::post('getUserById/{id}', 'UserController@edit');
	Route::post('updateUser/{id}', 'UserController@update');		
	Route::post('deleteUser/{id}', 'UserController@destroy');	
		
});

});