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

    
    public function getConfigureProjectById(Request $request , $id)
    {   
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        
        $project_types = DB::table('c_project_hdr as cph')
                    ->leftjoin('m_project_type as mpt','mpt.id','=','cph.project_type_id')
                    ->select('cph.id','cph.project_type_id','mpt.name as project_type')
                    ->where('project_id','=',$id)
                    ->get();

        foreach ($project_types as $key => $value) {            
            $building_class = DB::table('c_project_child')
            ->where('c_project_hdr_id','=',$value->id)
            ->get();

        $project_types[$key]->building_class = $building_class;
        }                 
        
        $projectLists = DB::table('project')->where('id','=',$id)->first();
        
        if(count($project_types)>0){
            $result['info']['lists'] = $project_types;
            $result['info']['project_name'] = $projectLists->project_name;
            return response()->json(['result'=>$result]);
        }else{
            $result['info']['project_name'] = $projectLists->project_name;
            $result['error']= 'No results found!';
            return response()->json(['error'=>$result],401);
        }
        return response()->json(['error'=>'No results found!'],401);
                            
        
    }

    public function getIsConfigureProjectById(Request $request , $id)
    {   
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }

        $projectConfiguredLists = DB::table('c_project_hdr')
                    ->where('project_id','=',$id)
                    ->get();

        if(count($projectConfiguredLists)>0){
            $result['info']['flag'] = true;
            return response()->json(['result'=>$result]);
        }
        $result['info']['flag'] = false;
        $result['error'] = "Without configure project you can't access project scope!";
        return response()->json(['error'=>$result],401);
        
    }

    public function updateConfigureProject(Request $request, $id)
    {
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        
    
        $input_data = $input['info']['project_details'];
        $data = $input_data;

        DB::table('c_project_hdr')->where('project_id','=',$id)->delete();
        DB::table('c_project_child')->where('project_id','=',$id)->delete();
        
        
        foreach ($data as $key => $value) {
            $p_hdr_data['project_id'] = $id;
            $p_hdr_data['project_type_id'] = $value['project_type'];
           
            $hdrId = DB::table('c_project_hdr')->insertGetId($p_hdr_data);

            foreach ($value['building_details'] as $k => $val) {            
                $p_chld_data['c_project_hdr_id'] = $hdrId;
                $p_chld_data['project_id'] = $id;
                $p_chld_data['building_class_id'] = $val['building_class'];
                $p_chld_data['building_units'] = $val['building_units'];
                
                $childId = DB::table('c_project_child')->insertGetId($p_chld_data);                    
            }
        }

        $res_msg = "Your record has been updated sucessfully";
        $result = array();
        if($hdrId){

            DB::table('project')->where('id',$id)->update(['is_configured'=>1]);                    

            $result['info']['msg'] = $res_msg;
            return response()->json(['result'=>$result]);
        }
        return response()->json(['error'=>'Your record update failed!!'],401);
    }



    public function getProjectTeamById(Request $request , $id)
    {   
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        
        $lists = DB::table('project_team')->where('project_id','=',$id)->first();
        $projectLists = DB::table('project')->where('id','=',$id)->first();

        //print_r($lists);

        if(count($lists)>0){
            $result['info']['lists'] = $lists;
            $result['info']['project_name'] = $projectLists->project_name;
            return response()->json(['result'=>$result]);
        }
        
        $result['project_name'] = $projectLists->project_name;
        $result['error'] = 'Your listing has been coud not added!';
        return response()->json(['result'=>$result],401);
        
                            
        
    }

    public function updateProjectTeam(Request $request, $id)
    {
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
    
        $input_data = $input['info'];
        $data = $input_data;
        $data['project_id'] = $id;

        $check_data = DB::table('project_team')->where('project_id','=',$id)->first();
        if(empty($check_data)){
            $listId = DB::table('project_team')->insertGetId($data);
            $res_msg = "Your record has been inserted sucessfully";
        }else{
            $listId = DB::table('project_team')->where('project_id','=',$id)->update($data);
            $res_msg = "Your record has been updated sucessfully";
        }        
        
        $result = array();
        if($listId){
            $result['info']['msg'] = $res_msg;
            return response()->json(['result'=>$result]);
        }
        return response()->json(['error'=>'Your record update failed!!'],401);
    }


    public function getProjectScopeMasterDataById($id)
    {   
        // $token = $this->getToken($request);
    	// $user = JWTAuth::toUser($token);
        // $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        
        $project_hdr = DB::table('c_project_hdr as ph')
                            ->leftjoin('m_project_type as mpt','mpt.id','=','ph.project_type_id')
                            ->select('mpt.name as project_type','ph.id','ph.project_type_id')
                            ->where('ph.project_id','=',$id)
                            ->get();
        
        $cart = array();  
        $i=0;      
        foreach ($project_hdr as $key => $value) {

            $project_child = DB::table('c_project_child as pc')
                            ->leftjoin('m_building_class as mbc','mbc.id','=','pc.building_class_id')
                            ->select('mbc.name as building_class','pc.building_units','pc.building_class_id')
                            ->where('pc.c_project_hdr_id','=',$value->id)
                            ->get();

            foreach ($project_child as $k => $val) {
                $i++;
                $cart[$i]['project_type'] = $value->project_type;  
                $cart[$i]['building_class'] = $val->building_class;  
                $cart[$i]['building_units'] = $val->building_units;  
                $cart[$i]['project_type_id'] = $value->project_type_id;  
                $cart[$i]['building_class_id'] = $val->building_class_id;
            }
        }   
        
        $lists = DB::table('m_items')->get();        
        $newArr = [];
        
        foreach ($cart as $key => $value) {            
            foreach ($lists as $k => $val) {
                 $kk = $key-1;
                 $newArr[$kk]['project_type'] = $value['project_type'];
                 $newArr[$kk]['building_class'] = $value['building_class'];
                 $newArr[$kk]['building_units'] = $value['building_units'];
                 $newArr[$kk]['project_type_id'] = $value['project_type_id'];
                 $newArr[$kk]['building_class_id'] = $value['building_class_id'];
                 $newArr[$kk][$val->db_name] = '';
                 $newArr[$kk]['project_id'] = $id;
                 
                 $priceLists = DB::table('m_project_scope')
                            ->where('building_class_id','=',$value['building_class_id'])
                            ->where('items_id','=',$val->id)
                            ->first();
                 $newArr[$kk][$val->db_name."_price"] = $priceLists->price;   
                 //$newArr[$kk]['items'][$k]['item'] = $val->db_name;
                 //$newArr[$kk]['items'][$k]['price'] = $priceLists->price;                 
            }
        }
     
        return $newArr;
        // if(count($newArr)>0){
        //     $result['info']['lists'] = $newArr;
        //     return response()->json(['result'=>$result]);
        // }
        // return response()->json(['error'=>'Your listing has been coud not added!'],401);
                            
        
    }

    public function getProjectScopeDetailById(Request $request , $id)
    {   
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
        
        $lists = DB::table('project_scope')
                     ->select('project_id','building_class_id','project_type_id','project_type','building_class','building_units','aluminium_windows','aluminium_doors','curtain_wall','aluminium_louvres','kitchens','kitchenettes','bedrooms','laundries','bathrooms','ensuites','balconies','storage','study','garages','other','aluminium_windows_price','aluminium_doors_price','curtain_wall_price','aluminium_louvres_price','kitchens_price','kitchenettes_price','bedrooms_price','laundries_price','bathrooms_price','ensuites_price','balconies_price','storage_price','study_price','garages_price','other_price')
                     //->select('*')
                    ->where('project_id','=',$id)->get();
       
        
        $project_quote_data = DB::table('project_scope_quote')->where('project_id','=',$id)->first(); 
        
        $projectLists = DB::table('project')->where('id','=',$id)->first();

        if(count($lists)>0){
            //echo "ALREADY  EXISTS";
            $result['info']['lists'] = $lists;
            $result['info']['quote'] = $project_quote_data->quote;
            $result['info']['project_name'] = $projectLists->project_name;
            return response()->json(['result'=>$result]);
        }else{
            //echo "NOT EXISTS";
           $res =  $this->getProjectScopeMasterDataById($id);
           $result['info']['lists'] = $res;
           $result['info']['quote'] = "";
           $result['info']['project_name'] = $projectLists->project_name;

           return response()->json(['result'=>$result]);
        }
        return response()->json(['error'=>'Your listing has been coud not added!'],401);
                            
        
    }

    public function updateProjectScopeDetail(Request $request, $id)
    {
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        
        if($id == null){
            return response()->json(['error'=>'invalid entry!'],401);    
        }
    
        $input_data = $input['info']['project_details'];
        $data = $input_data;
        

        DB::table('project_scope')->where('project_id','=',$id)->delete();
        foreach ($data as $key => $value) {
            $value['project_id'] = $id;  
            
            $listId = DB::table('project_scope')->insertGetId($value);
        }


        $check_data = DB::table('project_scope_quote')->where('project_id','=',$id)->get();
        
       // print_r($check_data);
        
        if(count($check_data)>0){
            // echo "already exists";
            $res_msg = "Your record has been updated sucessfully";
            $quote_data['quote'] = $input['info']['quote'];              
            $check_data = DB::table('project_scope_quote')->where('project_id','=',$id)->update($quote_data);
                                            
        }else{
            // echo "not exists";
            $res_msg = "Your record has been inserted sucessfully";
            $quote_data['project_id'] = $id;
            $quote_data['quote'] = $input['info']['quote'];        
            $check_data = DB::table('project_scope_quote')->insertGetId($quote_data);    
            
        }   

         $result = array();
         if($listId){

             //$this->insertSupplyItems($input_data);   

             $result['info']['msg'] = $res_msg;
             return response()->json(['result'=>$result]);
         }
         return response()->json(['error'=>'Your record update failed!!'],401);
    }

    
    public function getProjectScopeMaster(Request $request){
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();
      
        $lists = DB::table('m_project_scope as ps')
                    ->leftjoin('m_building_class as bc','bc.id','=','ps.building_class_id')
                    ->leftjoin('m_items as i','i.id','=','ps.items_id')
                    ->select('ps.*','bc.name as building_class',DB::raw('LOWER(i.name) as item_name'))
                    ->orderBy('ps.id','desc')
                    ->get();       

        $result = array();
        if(count($lists) > 0){
             $result["info"] = $lists;
             return response()->json(["result" => $result]);   
        }
        return response()->json(['error'=>"No records found!"],401);


   }
    

   public function insertSupplyItems($data)
   {
    
    foreach ($data as $key => $value) {
        $value['project_id'] = $id;
        $listId = DB::table('supply_items')->insertGetId($value);
    }
   }

   public function updateSupplyItems(Request $request,$id)
   {
    $token = $this->getToken($request);
    $user = JWTAuth::toUser($token);
    $input = $request->all();

    DB::table('supply_items')->where('project_id','=',$id)->delete();

    foreach ($data as $key => $value) {
        $value['project_id'] = $id;
        $listId = DB::table('supply_items')->insertGetId($value);
    }

   }


   public function getSupplyItemsById(Request $request , $id)
   {   
       $token = $this->getToken($request);
       $user = JWTAuth::toUser($token);
       $input = $request->all();

       if($id == null){
           return response()->json(['error'=>'invalid entry!'],401);    
       }
       
    //    $lists = DB::table('supply_items_new as si')
    //                 ->leftjoin('m_items as i','i.id','=','si.items_id')
    //                 ->select('si.*','i.name','i.db_name')
    //                 ->where('project_id','=',$id)->get();

    $ps_lists = DB::table('project_scope as ps')
                    ->where('project_id','=',$id)->get();

    //print_r($ps_lists);
    

    $arr = [];
    
    $arr['aluminium_windows'] = 0;
    $arr['aluminium_doors'] = 0;
    $arr['curtain_wall'] = 0;
    $arr['aluminium_louvres'] = 0;
    $arr['kitchens'] = 0;
    $arr['kitchenettes'] = 0;
    $arr['bedrooms'] = 0;
    $arr['laundries'] = 0;
    $arr['bathrooms'] = 0;
    $arr['ensuites'] = 0;
    $arr['balconies'] = 0;
    $arr['storage'] = 0;
    $arr['study'] = 0;
    $arr['garages'] = 0;
    $arr['other'] = 0;
  

    foreach ($ps_lists as $key => $value) {
       // print_r($value);
       
        if($arr['aluminium_windows'] == 0){
            $arr['aluminium_windows'] = ["interest"=>($value->aluminium_windows >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>1]; 
        }

        if($arr['aluminium_doors'] == 0){
            $arr['aluminium_doors'] = ["interest"=>($value->aluminium_doors >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['curtain_wall'] == 0){
            $arr['curtain_wall'] = ["interest"=>($value->curtain_wall >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['aluminium_louvres'] == 0){
            $arr['aluminium_louvres'] = ["interest"=>($value->aluminium_louvres >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['kitchens'] == 0){
            $arr['kitchens'] = ["interest"=>($value->kitchens >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['kitchenettes'] == 0){
            $arr['kitchenettes'] = ["interest"=>($value->kitchenettes >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['bedrooms'] == 0){
            $arr['bedrooms'] = ["interest"=>($value->bedrooms >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['laundries'] == 0){
            $arr['laundries'] = ["interest"=>($value->laundries >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['bathrooms'] == 0){
            $arr['bathrooms'] = ["interest"=>($value->bathrooms >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['ensuites'] == 0){
            $arr['ensuites'] = ["interest"=>($value->ensuites >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['balconies'] == 0){
            $arr['balconies'] = ["interest"=>($value->balconies >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['storage'] == 0){
            $arr['storage'] = ["interest"=>($value->storage >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['study'] == 0){
            $arr['study'] = ["interest"=>($value->study >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['garages'] == 0){
            $arr['garages'] = ["interest"=>($value->garages >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }

        if($arr['other'] == 0){
            $arr['other'] = ["interest"=>($value->other >= 1 ? 1 : 0),"estimated_date"=>"2017-12-25","quoted_date"=>"2017-12-25","status"=>2];
        }       

        // $arr['aluminium_windows'] = 1;
        // $arr['aluminium_doors'] = 1; 
        // $arr['curtain_wall'] = 1; 
        // $arr['aluminium_louvres'] = 1; 
        // $arr['kitchens'] = 1; 
        // $arr['kitchenettes'] = 1; 
        // $arr['bedrooms'] = 1; 
        // $arr['laundries'] = 1; 
        // $arr['bathrooms'] = 1; 
        // $arr['ensuites'] = 1; 
        // $arr['balconies'] = 1; 
        // $arr['storage'] = 1; 
        // $arr['study'] = 1; 
        // $arr['garages'] = 1; 
        // $arr['other'] = 1; 
        
    }

    
    //print_r($arr);

    //  $select_str = "aluminium_windows,aluminium_doors,curtain_wall,aluminium_louvres,kitchens,kitchenettes,bedrooms,laundries,bathrooms,ensuites,balconies,storage,study,garages,other";

    //  $lists = DB::table('supply_items_new')
    //                  ->select(DB::raw($select_str))
    //                  ->where('project_id','=',$id)->first();
                        
    
    //    $lists = DB::table('supply_items_new as si')
    //                 ->leftjoin('m_items as i','i.id','=','si.items_id')
    //                 ->select('si.*','i.name','i.db_name')
    //                 ->where('project_id','=',$id)->get();

       //print_r($lists);

       if(count($arr)>0){
           $result['info']['lists'] = [$arr];
           return response()->json(['result'=>$result]);
       }
       
       $result['error'] = 'Your listing has been coud not added!';
       return response()->json(['result'=>$result],401);
       
                           
       
   }

   


}
