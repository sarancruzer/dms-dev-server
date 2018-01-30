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

	//Master modules
	Route::post('getRole', 'RoleController@index');
	Route::post('addRole', 'RoleController@create');
	Route::post('updateRole/{id}', 'RoleController@update');		
	Route::post('deleteRole/{id}', 'RoleController@destroy');

	//Master modules
	Route::post('getProjectType', 'ProjectTypeController@index');
	Route::post('addProjectType', 'ProjectTypeController@create');
	Route::post('updateProjectType/{id}', 'ProjectTypeController@update');		
	Route::post('deleteProjectType/{id}', 'ProjectTypeController@destroy');
	

	//Master modules
	Route::post('getBuildingClass', 'BuildingClassController@index');
	Route::post('addBuildingClass', 'BuildingClassController@create');
	Route::post('updateBuildingClass/{id}', 'BuildingClassController@update');		
	Route::post('deleteBuildingClass/{id}', 'BuildingClassController@destroy');

	//Master modules
	Route::post('getItems', 'ItemsController@index');
	Route::post('addItems', 'ItemsController@create');
	Route::post('updateItems/{id}', 'ItemsController@update');		
	Route::post('deleteItems/{id}', 'ItemsController@destroy');

	//Master modules
	Route::post('getProjectScope', 'ProjectScopeController@index');
	Route::post('addProjectScope', 'ProjectScopeController@create');
	Route::post('updateProjectScope/{id}', 'ProjectScopeController@update');		
	Route::post('deleteProjectScope/{id}', 'ProjectScopeController@destroy');
	
	Route::post('getBuildingClassItems/{id}', 'ProjectScopeController@getBuildingClassItems');		
	Route::post('updateBuildingClassItems/{id}', 'ProjectScopeController@updateBuildingClassItems');		
	Route::post('getBuildingClassLists', 'ProjectScopeController@getBuildingClassLists');		

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

	//Manage License
	Route::post('getLicense', 'LicenseController@index');
	Route::post('addLicense', 'LicenseController@create');
	Route::post('getLicenseById/{id}', 'LicenseController@edit');
	Route::post('updateLicense/{id}', 'LicenseController@update');		
	Route::post('deleteLicense/{id}', 'LicenseController@destroy');	

	//Manage Clients
	Route::post('getClient', 'ClientController@index');
	Route::post('addClient', 'ClientController@create');
	Route::post('getClientById/{id}', 'ClientController@edit');
	Route::post('updateClient/{id}', 'ClientController@update');		
	Route::post('deleteClient/{id}', 'ClientController@destroy');

	//Manage Project
	Route::post('getProject', 'ProjectController@index');
	Route::post('addProject', 'ProjectController@create');
	Route::post('getProjectById/{id}', 'ProjectController@edit');
	Route::post('updateProject/{id}', 'ProjectController@update');		
	Route::post('deleteProject/{id}', 'ProjectController@destroy');	

	Route::post('getConfigureProjectById/{id}', 'ProjectController@getConfigureProjectById');
	Route::post('updateConfigureProject/{id}', 'ProjectController@updateConfigureProject');	
	Route::post('getIsConfigureProjectById/{id}', 'ProjectController@getIsConfigureProjectById');	

	Route::post('getProjectTeamById/{id}', 'ProjectController@getProjectTeamById');
	Route::post('updateProjectTeam/{id}', 'ProjectController@updateProjectTeam');		

	Route::post('getProjectScopeMasterDataById/{id}', 'ProjectController@getProjectScopeMasterDataById');
	Route::post('getProjectScopeDetailById/{id}', 'ProjectController@getProjectScopeDetailById');
	Route::post('updateProjectScopeDetail/{id}', 'ProjectController@updateProjectScopeDetail');		
	
	Route::post('getProjectScopeMaster', 'ProjectController@getProjectScopeMaster');

	Route::post('getSupplyItemsById/{id}', 'ProjectController@getSupplyItemsById');
	Route::post('updateSupplyItemsById/{id}', 'ProjectController@updateSupplyItems');

	Route::post('getProjectDocs', 'ProjectDocsController@index');
	Route::post('addProjectDocs', 'ProjectDocsController@create');
	Route::post('editProjectDocs/{id}', 'ProjectDocsController@edit');
	Route::post('updateProjectDocs/{id}', 'ProjectDocsController@update');		
	Route::post('deleteProjectDocs/{id}', 'ProjectDocsController@destroy');	
	Route::post('getProjectsDocsReferenceId/{id}', 'ProjectDocsController@getProjectsDocsReferenceId');	

	
	Route::post('getAdditionalInfoById/{id}', 'ProjectNoteController@getAdditionalInfoById');
	Route::post('updateAdditionalInfoById/{id}', 'ProjectNoteController@updateAdditionalInfoById');
	Route::post('getProjectNoteById/{id}', 'ProjectNoteController@getProjectNoteById');
	Route::post('updateProjectNoteById/{id}', 'ProjectNoteController@updateProjectNoteById');
	
		

	//get all Masters
	Route::post('getMasters', 'MasterController@getMasterDetails');		
	Route::post('getContacts', 'MasterController@getContactDetails');		

	Route::post('getClientReport','ReportController@getClientReport');
	
	
	
		

});

Route::post('getProjects', 'MasterController@getProjectDetails');		

});