<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use JWTAuth;
use App\User;
use DB;
use Hash;
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();

        $searchValue = $input['q'];
        $lists = DB::table('users')
                ->where(function($query) use ($searchValue)
                {
                    if(!empty($searchValue)):
                        $query->where('name','LIKE',DB::raw("'%$searchValue%'"));
                        $query->orWhere('email','LIKE',DB::raw("'%$searchValue%'"));
                    endif;
                })
                ->where('status','=',1)
                ->orderBy($input['column'],$input['orderby'])
                ->paginate(5);        
                //->toSql();        
       
        $result = array();
        if(count($lists) > 0){
             $result["info"] = $lists;
             return response()->json(["result" => $result]);   
        }
        return response()->json(['error'=>"No records found!"],401);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();
        
        $count = count($input["info"]);
        if(!$count){
            return response()->json(['error'=>"Invalid Entry"],401);
        }

        $input_data = $input['info'];
        $data['first_name'] = $input_data['first_name'];
        $data['last_name'] = $input_data['last_name'];
        $data['email'] = $input_data['email'];
        $data['mobile'] = $input_data['mobile'];
        $data['role_id'] = $input_data['role_id'];
        
        $checkData = DB::table('users')
                    ->where('email','=',$input_data['email'])
                    ->select('email')
                    ->first();
        if($checkData){
                return response()->json(['error'=>"Email Already exists!"],401);
        }
        
        $listId = DB::table('users')->insertGetId($data);
        $res_msg = "Your record has been inserted sucessfully";
        
        $result = array();
        if(count($listId) > 0){
                $result['info']['msg'] = $res_msg;
                return response()->json(["result" => $result]);   
        }
        return response()->json(['error'=>"Your record has been coud not added!"],401);
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request , $id)
    {   
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        
        $lists = DB::table('listings')->where('id','=',$id)->first();
        
        if(count($lists)>0){
            $result['info']['lists'] = $lists;
            return response()->json(['result'=>$result]);
        }
        return response()->json(['error'=>'Your listing has been coud not added!'],401);
                            
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
    
        $input_data = $input['info'];
        $data['first_name'] = $input_data['first_name'];
        $data['last_name'] = $input_data['last_name'];
        $data['email'] = $input_data['email'];
        $data['mobile'] = $input_data['mobile'];
        $data['role_id'] = $input_data['role_id'];

        $checkData = DB::table('users')
                    ->where('email','=',$input_data['email'])
                    ->where('id','!=',$id)
                    ->select('email')
                    ->first();
        if($checkData){
            return response()->json(['error'=>"Email Already exists!"],401);
        }
       
        $listId = DB::table('users')->where('id','=',$id)->update($data);
        if($listId){
            $result['result'] = 'Your record has been updated successfully! ';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['error'=>'Your record update failed!!'],401);
    }

    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request ,$id)
    {
        //
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();
        
        $data['status'] = 0;
        $listId = DB::table('users')
                ->where('id','=',$id)
                ->update($data);  
        
        if($listId){
            $result['info']['msg'] = 'Your record has been removed successfully';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your record coud not removed!'],401);
    }


    public function changePassword(Request $request)
    {
        //
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
    	$data = $request->all();
    	
    	$id = $user->id;
        $d = $input['info'];
    	$current_password_db = $user->password;
    	$current_password = $d['current_password'];
    	$new_password = $d['new_password'];
    	$confirm_password = $d['confirm_password'];
    	
    	if(!Hash::check($current_password, $user->password)){
    		return response()->json(['error'=>'Incorrect Current Password'], 401);
    	}
    	if($new_password != $confirm_password){
    		return response()->json(['error'=>'Confirm Password and New Password did not match'],401);
    	}

    	$new_password = Hash::make($new_password);
    	User::where('id', $id)->update(['password' => $new_password]);
        
    	return response()->json(["result"=>"Password Changed Successfully","user"=>$user,"pwd"=>$user->password]);
    }

    public function profile(Request $request){
        $input = $request->all();
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
    
        $lists = DB::table('users')
                    ->where('id','=',$user['id'])
                    ->get();
          
          $result = array();      
          if(count($lists) > 0){
            $result['info'] = $lists;
              return response()->json(['result' => $result]);
          }
    
          return response()->json(['error'=>'No Results Found'],401);
    
      }
}
