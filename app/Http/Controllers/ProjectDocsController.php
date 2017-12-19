<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JWTAuth;
use App\User;
use DB;
use Hash;

class ProjectDocsController extends Controller
{
   /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getToken($request)
    {
        $token = null; 
        foreach (getallheaders() as $name => $value) {
            if($name == "Authorization")
            {
                return $token = str_replace("Bearer ", "", $value);
            }
        }
        return response()->json(['error' => "Authentication Not Provided"],401);
   }

   public function index(Request $request)
   {
       $token = $this->getToken($request);
       $user = JWTAuth::toUser($token);
       $input = $request->all();

       $project_id = $input['project_id'];

       $lists = DB::table('project_docs')
               ->orderBy($input['column'],$input['orderby'])
               ->where('project_id','=',$project_id)
               ->paginate(5);        
      
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
       //
       $token = $this->getToken($request);
       $user = JWTAuth::toUser($token);
       $input = $request->all();
       
       $count = count($input["info"]);
       if(!$count){
           return response()->json(['error'=>"Invalid Entry"],401);
       }

       $input_data = $input['info'];
       
       
       $listId = DB::table('m_client_type')->insertGetId($data);
       $res_msg = "Your record has been inserted sucessfully";
       
       $result = array();
       if(count($listId) > 0){
               $result['info']['msg'] = $res_msg;
               return response()->json(["result" => $result]);   
       }
       return response()->json(['error'=>"No records found!"],401);
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
   public function edit(Request $request,$id)
   {
       //
       $token = $this->getToken($request);
       $user = JWTAuth::toUser($token);
       $input = $request->all();

       if($id == null){
           return response()->json(['error'=>'invalid entry!'],401);    
       }
       
       $lists = DB::table('project_docs')->where('id','=',$id)->first();
       
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
       //
       $token = $this->getToken($request);
       $user = JWTAuth::toUser($token);
       $input = $request->all();
       
       $count = count($input["info"]);
       if(!$count){
           return response()->json(['error'=>"Invalid Entry"],401);
       }
       $input_data = $input["info"];
       
       $listId = DB::table('project_docs')
                    ->where('id','=',$id)
                    ->update($input_data);

       $res_msg = "Your record has been updated sucessfully";
       $result = array();
       if(count($listId) > 0){
               $result['info']['msg'] = $res_msg;
               return response()->json(["result" => $result]);   
       }
       
   }

   /**
    * Remove the specified resource from storage.
    *
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
   public function destroy(Request $request , $id)
   {
       
       $token = $this->getToken($request);
       $user = JWTAuth::toUser($token);
       $input = $request->all();
                
       $o_id = DB::table('project_docs')
               ->where('id','=',$id)
               ->delete();  
       
       if($o_id){
           $result['info']['msg'] = 'Your record has been removed successfully';
           return response()->json(['result'=>$result]);
       }
       return response()->json(['result'=>'Your record has been coud not removed!'],401);
       
   }


   
}
