<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use JWTAuth;
use App\User;
use DB;
use Hash;

class ProjectController extends Controller
{
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
        $lists = DB::table('project as p')
                ->leftjoin('m_state as s','s.id','=','p.state')
                ->leftjoin('clients as c','c.id','=','p.client_name')
                ->select('p.*','s.name as state','c.client_business as client_name')
                ->where(function($query) use ($searchValue)
                {
                    if(!empty($searchValue)):
                        $query->where('c.client_business','LIKE',DB::raw("'%$searchValue%'"));
                        $query->orWhere('c.abn','LIKE',DB::raw("'%$searchValue%'"));
                    endif;
                })
                ->where('p.status','=',1)
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
        $data = $input_data;
        
        $checkData = DB::table('project')
                    ->where('project_name','=',$input_data['project_name'])
                    ->select('project_name')
                    ->first();
        if($checkData){
                return response()->json(['error'=>"Project Name Already exists!"],401);
        }
        
        $listId = DB::table('project')->insertGetId($data);
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
        
        $lists = DB::table('project')->where('id','=',$id)->first();
        
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
        $data = $input_data;
        
        $checkData = DB::table('project as p')
                    ->where('p.project_name','=',$input_data['project_name'])
                    ->where('id','!=',$id)
                    ->select('project_name')
                    ->first();
        if($checkData){
            return response()->json(['error'=>"Project Name Already exists!"],401);
        }
       
        $listId = DB::table('project')->where('id','=',$id)->update($data);
        $res_msg = "Your record has been updated sucessfully";
        $result = array();
        if($listId){
            $result['info']['msg'] = $res_msg;
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
        $listId = DB::table('project')
                ->where('id','=',$id)
                ->update($data);  
        
        if($listId){
            $result['info']['msg'] = 'Your record has been removed successfully';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your record coud not removed!'],401);
    }


}