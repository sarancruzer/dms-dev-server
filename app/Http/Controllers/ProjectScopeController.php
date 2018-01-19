<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JWTAuth;
use App\User;
use DB;
use Hash;

class ProjectScopeController extends Controller
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

       $lists = DB::table('m_project_scope as mps')
               ->leftjoin('m_items as i','i.id','=','mps.items_id')         
               ->leftjoin('m_building_class as bc','bc.id','=','mps.building_class_id')         
               ->select('i.name as item_name','bc.name as building_class','mps.*')
               ->where('i.name','like','%'.$input['q'].'%')
               ->orderBy('i.'.$input['column'],$input['orderby'])
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
       $data['building_class_id'] = $input_data['building_class_id'];
       $data['items_id'] = $input_data['items_id'];
       $data['price'] = $input_data['price'];



       
    //    $checkData = DB::table('m_project_scope')
    //        ->where('name','=',$input_data['name'])
    //        ->select('name')
    //        ->first($data);
    //        if($checkData){
    //                return response()->json(['error'=>"Already exists!"],401);
    //        }
       
       $listId = DB::table('m_project_scope')->insertGetId($data);
       $res_msg = "Your record has been inserted sucessfully";
       
       $result = array();
       if(count($listId) > 0){
               $result['info']['msg'] = $res_msg;
               return response()->json(["result" => $result]);   
       }
       return response()->json(['error'=>"No records found!"],401);
   }


   /**
    * Get all items for created and updated.
    *
    * @param  \Illuminate\Http\Request  $request
    * @return \Illuminate\Http\Response
    */
    public function getBuildingClassItems(Request $request,$id)
    {
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();
 
        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        //$id = 2;
        $lists = DB::table('m_project_scope_new as psn')
                    ->leftjoin('m_items as i','i.id','=','psn.items_id')
                    ->where('building_class_id','=',$id)
                    ->select('i.name as item_name','items_id','price')
                    ->get();

        //print_r($lists);                    
        if(count($lists)>0){
        //print("EXISTING ");
            $result['info']['lists'] = $lists;
            return response()->json(['result'=>$result]);
        }else{
        //print("NEW ");
            $arr = $this->getNewBuildingItems($id);
            $result['info']['lists'] = $arr;
            return response()->json(['result'=>$result]);
        }
        $result['error'] = 'Your listing has been coud not added!';
        return response()->json(['result'=>$result],401);
    }


    public function getNewBuildingItems($id)
    {
        $lists = DB::table('m_items as i')
                    ->select('i.name as item_name','i.id as items_id')
                    ->get();
        
        foreach ($lists as $key => $value) {
            $lists[$key]->price = 0;
        }            
        return $lists;
    }

    public function updateBuildingClassItems(Request $request ,$id){
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();
 
        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        $data = $input['info'];
        $delId = DB::table('m_project_scope_new')->where('building_class_id','=',$id)->delete();
        
        foreach ($data as $key => $value) {
           $value['building_class_id'] = $id;
           $insertId =  DB::table('m_project_scope_new')->insert($value);
        }      
        $res_msg = "Your record has been inserted sucessfully";
        if(count($insertId)>0){            $result['info']['msg'] = $res_msg;
            return response()->json(['result'=>$result]);
        }
        $result['error'] = 'Your record has been could not added!';
        return response()->json(['result'=>$result],401);
        

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
   public function edit($id)
   {
       //
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
       $data['name'] = $input_data['name'];
       $data['building_class_id'] = $input_data['building_class_id'];
       $data['price'] = $input_data['price'];

       if(isset($input_data['id']) && $input_data['id'] != '' ){
               $checkData = DB::table('m_project_scope')
               ->where('id','!=',$input_data['id'])
               ->where('name','=',$input_data['name'])
               ->select('name')
               ->first($data);
       
               if($checkData){
                       return response()->json(['error'=>"Already exists!"],401);
               }
       }else{
           return response()->json(['error'=>"Invalid Entry!"],401);
       }
       
       $listId = DB::table('m_project_scope')
           ->where('id','=',$input_data['id'])
           ->update($data);

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
                
       $o_id = DB::table('m_project_scope')
               ->where('id','=',$id)
               ->delete();  
       
       if($o_id){
           $result['info']['msg'] = 'Your record has been removed successfully';
           return response()->json(['result'=>$result]);
       }
       return response()->json(['result'=>'Your record has been coud not removed!'],401);
       
   }
}