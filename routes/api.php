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

	// Route::post('getTerritory', 'TerritoryController@index');
	// Route::post('addTerritory', 'TerritoryController@create');
	// Route::post('updateTerritory/{id}', 'TerritoryController@update');		
	// Route::post('deleteTerritory/{id}', 'TerritoryController@destroy');	

	// Route::post('getTerritory', 'TerritoryController@index');
	// Route::post('addTerritory', 'TerritoryController@create');
	// Route::post('updateTerritory/{id}', 'TerritoryController@update');		
	// Route::post('deleteTerritory/{id}', 'TerritoryController@destroy');	

	// Route::post('getTerritory', 'TerritoryController@index');
	// Route::post('addTerritory', 'TerritoryController@create');
	// Route::post('updateTerritory/{id}', 'TerritoryController@update');		
	// Route::post('deleteTerritory/{id}', 'TerritoryController@destroy');	

	// Route::post('getTerritory', 'TerritoryController@index');
	// Route::post('addTerritory', 'TerritoryController@create');
	// Route::post('updateTerritory/{id}', 'TerritoryController@update');		
	// Route::post('deleteTerritory/{id}', 'TerritoryController@destroy');	

	// Route::post('getTerritory', 'TerritoryController@index');
	// Route::post('addTerritory', 'TerritoryController@create');
	// Route::post('updateTerritory/{id}', 'TerritoryController@update');		
	// Route::post('deleteTerritory/{id}', 'TerritoryController@destroy');	
		
});

});