<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JWTAuth;
use App\User;
use DB;
use Hash;

class StateController extends Controller
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

        $lists = DB::table('m_state')
                ->where('name','like','%'.$input['q'].'%')
                ->orderBy($input['column'],$input['orderby'])
                ->paginate(10);        
       
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
        $data['name'] = $input_data['name'];
        $data['short_code'] = $input_data['short_code'];
        
        $checkData = DB::table('m_state')
            ->where('name','=',$input_data['name'])
            ->orwhere('short_code','=',$input_data['short_code'])
            ->select('*')
            ->first();

        // print_r($checkData);

        // print($checkData->name);

        if($checkData){
            if($checkData->name == $input_data['name']){
                $ret_msg = "Name is already exists";
                return response()->json(['error'=>$ret_msg],401);
            }else if($checkData->short_code == $input_data['short_code']){
                $ret_msg = "Short code is already exists";
                return response()->json(['error'=>$ret_msg],401);
            }
        }
        
        $listId = DB::table('m_state')->insertGetId($data);
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
        $data['short_code'] = $input_data['short_code'];

        if(isset($input_data['id']) && $input_data['id'] != '' ){
                $checkData = DB::table('m_state')
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
        
        $listId = DB::table('m_state')
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
                 
        $o_id = DB::table('m_state')
                ->where('id','=',$id)
                ->delete();  
        
        if($o_id){
            $result['info']['msg'] = 'Your record has been removed successfully';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your record has been coud not removed!'],401);
        
    }
}
