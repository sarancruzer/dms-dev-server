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
        $mainArr = [];
        $itemsArr = [];
        
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
                 
                 if($val->id != 17){
                    
                 $priceLists = DB::table('m_project_scope')
                            ->where('building_class_id','=',$value['building_class_id'])
                            ->where('items_id','=',$val->id)
                            ->first();
                //   print_r($priceLists);
                //   echo $priceLists->price;

                 $newArr[$kk][$val->db_name."_price"] = $priceLists->price;   
                 
                 $itemsArr[$kk]['project_type'] = $value['project_type'];
                 $itemsArr[$kk]['building_class'] = $value['building_class'];
                 $itemsArr[$kk]['building_units'] = $value['building_units'];
                 $itemsArr[$kk][$val->db_name] = '';

                }

                 //$newArr[$kk]['items'][$k]['item'] = $val->db_name;
                 //$newArr[$kk]['items'][$k]['price'] = $priceLists->price;                 
            }
        }

        $mainArr['lists'] = $newArr;
        $mainArr['items'] = $itemsArr;
     
        return $mainArr;
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

                
       // $items_lists = DB::table('m_items')->where('project_id','=',$id)->get();

        $ps_lists = DB::table('project_scope_new')->where('project_id','=',$id)->get();

        $arr=[];
        $arrr = [];

        foreach ($ps_lists as $key => $value) {

            $ps_child_items = DB::table('project_scope_child_new')->where('ps_id','=',$value->id)->get();

            foreach ($ps_child_items as $k => $val) {

                $item = DB::table('m_items')->where('id','=',$val->items_id)->first();

                $project_types = DB::table('m_project_type')->where('id','=',$value->project_type_id)->first();
                $building_classs = DB::table('m_building_class')->where('id','=',$value->building_class_id)->first();

                $arr[$key]['project_id'] = $value->project_id;
                $arr[$key]['project_type_id'] = $value->project_type_id;
                $arr[$key]['building_class_id'] = $value->building_class_id;
                
                $arr[$key]['project_type'] = $project_types->name;
                $arr[$key]['building_class'] = $building_classs->name;
                $arr[$key]['building_units'] = $value->building_units;

                $arr[$key][$item->db_name] = $val->qty;
                
                if($val->items_id != 17){

                $priceLists = DB::table('m_project_scope')
                            ->where('building_class_id','=',$value->building_class_id)
                            ->where('items_id','=',$val->items_id)
                            ->first();

                $arr[$key][$item->db_name.'_price'] = $priceLists->price;


                $arrr[$key]['project_type'] = $project_types->name;
                $arrr[$key]['building_class'] = $building_classs->name;
                $arrr[$key]['building_units'] = $value->building_units;

                $arrr[$key][$item->db_name] = $val->qty;

                }



               
                
            }  

        }

       // print_r($arr);
              

        $project_quote_data = DB::table('project_scope_quote')->where('project_id','=',$id)->first(); 
        
         $projectLists = DB::table('project')->where('id','=',$id)->first();
         

        if(count($ps_lists)>0){
            //echo "ALREADY  EXISTS";
            $result['info']['lists'] = $arr;
            $result['info']['items_lists'] = $arrr;
            $result['info']['quote'] = (int) $project_quote_data->quote;
            $result['info']['project_name'] = $projectLists->project_name;
            return response()->json(['result'=>$result]);
        }else{
            //echo "NOT EXISTS";
           $res =  $this->getProjectScopeMasterDataById($id);
           $result['info']['lists'] = $res['lists'];
           $result['info']['items_lists'] = $res['items'];
           $result['info']['quote'] = 0;
           $result['info']['project_name'] = $projectLists->project_name;

           return response()->json(['result'=>$result]);
        }
        return response()->json(['error'=>'Your listing has been coud not added!'],401);
                            
        
    }


    // public function getProjectScopeDetailById(Request $request , $id)
    // {   
    //     $token = $this->getToken($request);
    // 	$user = JWTAuth::toUser($token);
    //     $input = $request->all();

    //     if($id == null){
    //         return response()->json(['error'=>'invalid entry!'],401);    
    //     }
        
    //     $lists = DB::table('project_scope')
    //                  ->select('project_id','building_class_id','project_type_id','project_type','building_class','building_units','aluminium_windows','aluminium_doors','curtain_wall','aluminium_louvres','kitchens','kitchenettes','bedrooms','laundries','bathrooms','ensuites','balconies','storage','study','garages','other','aluminium_windows_price','aluminium_doors_price','curtain_wall_price','aluminium_louvres_price','kitchens_price','kitchenettes_price','bedrooms_price','laundries_price','bathrooms_price','ensuites_price','balconies_price','storage_price','study_price','garages_price','other_price')
    //                  //->select('*')
    //                 ->where('project_id','=',$id)->get();
       
        
    //     $project_quote_data = DB::table('project_scope_quote')->where('project_id','=',$id)->first(); 
        
    //     $projectLists = DB::table('project')->where('id','=',$id)->first();

    //     if(count($lists)>0){
    //         //echo "ALREADY  EXISTS";
    //         $result['info']['lists'] = $lists;
    //         $result['info']['quote'] = $project_quote_data->quote;
    //         $result['info']['project_name'] = $projectLists->project_name;
    //         return response()->json(['result'=>$result]);
    //     }else{
    //         //echo "NOT EXISTS";
    //        $res =  $this->getProjectScopeMasterDataById($id);
    //        $result['info']['lists'] = $res;
    //        $result['info']['quote'] = "";
    //        $result['info']['project_name'] = $projectLists->project_name;

    //        return response()->json(['result'=>$result]);
    //     }
    //     return response()->json(['error'=>'Your listing has been coud not added!'],401);
                            
        
    // }


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
        
        $items_lists = DB::table('m_items')->get();

        DB::table('project_scope_new')->where('project_id','=',$id)->delete();

        DB::table('project_scope_child_new')->where('project_id','=',$id)->delete();

        $arr = [];
        $arrr = [];
        foreach ($input_data as $key => $value) {
            $arr['project_id'] = $id;  
            $arr['project_type_id'] = $value['project_type_id'];  
            $arr['building_class_id'] = $value['building_class_id'];  
            $arr['building_units'] = $value['building_units'];    

            //print_r($arr);
            $listId = DB::table('project_scope_new')->insertGetId($arr);
            //$listId = 2;
            foreach ($items_lists as $k => $val) {
                
                $arrr['ps_id'] = $listId;    
                $arrr['project_id'] = $id;
                
                // $items = DB::table('m_items')->where('db_name','=',$$val->db_name])->first();

                //echo $value[$val->db_name];

                $arrr['items_id'] = $val->id;  
                if($val->db_name != 'all_joinery'){
                    $arrr['qty'] = $value[$val->db_name];        
                }                

              //  print_r($arrr);
                
                $listIdd = DB::table('project_scope_child_new')->insertGetId($arrr);

            }   
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

   public function getSupplyItemsById(Request $request , $id)
   {   
       $token = $this->getToken($request);
       $user = JWTAuth::toUser($token);
       $input = $request->all();

       if($id == null){
           return response()->json(['error'=>'invalid entry!'],401);    
       }
           
    $lists = DB::table('supply_items as si')
                ->where('project_id','=',$id)->get();

     $projectLists = DB::table('project')->where('id','=',$id)->first();
     $result['info']['project_name'] = $projectLists->project_name; 
     if(count($lists)>0){
         //print("EXISTING ");
           $arr = $this->getExistingSupplyItems($id);
           $result['info']['lists'] = [$arr];
           return response()->json(['result'=>$result]);
       }else{
        //print("NEW ");
            $arr = $this->getNewSupplyItems($id);
            $result['info']['lists'] = [$arr];
            return response()->json(['result'=>$result]);
       }
       
        $result['error'] = 'Your listing has been coud not added!';
        return response()->json(['result'=>$result],401);
       
   }


   public function getNewSupplyItems($id){
    
    //print_r($ps_lists);
    $arr = [];
    
    $app= [];
    $ps_lists = DB::table('project_scope_new as psn')
                    ->where('project_id','=',$id)->get();

    $items_supply = DB::table('m_items_supply')->get();


    $arr=[];
    $db_arr=[];

    foreach ($items_supply as $key => $value) {
       
                //$ps_child_lists = DB::table('project_scope_child_new')->where('project_id','=',$id)->get();
            $shrt_code = $value->short_code;
            $pieces = explode(",", $shrt_code);
            $strval="";
            foreach ($pieces as $key => $srt) {
               $strval .= "'".$srt."',";
            }
            
            $outval=substr($strval,0,strlen($strval)-1);
            //print($outval);
            $items_lists = DB::table('m_items')->whereRaw('short_code IN ('.$outval.')')
            ->get(); 
            // print_r($items_lists);
            foreach ($items_lists as $k => $val) {

                
            $p_lists = DB::table('project_scope_child_new')
                                ->where('project_id','=',$id)
                                ->where('items_id','=',$val->id)
                                ->where('qty','>',0)
                                ->get();
         
        if(count($p_lists)>0){
             if(!in_array($value->db_name,$db_arr)){
                array_push($db_arr,$value->db_name);
                 $app[$value->db_name] = ["greyout"=>"","interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
             }
        
        }
        else{
            if(!in_array($value->db_name,$db_arr)){
                array_push($db_arr,$value->db_name);
                $app[$value->db_name] = ["greyout"=>"disabled","interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
            }
        }
        


            
         

            // if(!empty($p_lists)){
            //     $shrt_code = $val->short_code;               
            //     $items_supply_lists = DB::table('m_items_supply')
            //                     ->whereRaw('FIND_IN_SET(?,short_code)',[$shrt_code])
            //                     ->get();        
              
            //         $app[$value->db_name] = ["greyout"=>"","interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
              
            //   }else{
            //         $app[$value->db_name] = ["greyout"=>"disabled","interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>0];
            //   }
        
            }
        
        }

    
        // print_r(count($app));


    
    // foreach ($items_supply as $key => $value) {

    //     $ps_child_lists = DB::table('project_scope_child_new')->where('project_id','=',$id)->get();


    //     foreach ($ps_child_lists as $k => $val) {

    //     $items_lists = DB::table('m_items')->where('id','=',$val->items_id)->first();

    //     if($items_lists){
    //     $shrt_code = $items_lists->short_code;
    //     $items_supply_lists = DB::table('m_items_supply')
    //                     ->whereRaw('FIND_IN_SET(?,short_code)',[$shrt_code])
    //                     ->get();

    //     $pscn_lists = DB::table('project_scope_child_new')
    //                             ->where('project_id','=',$id)
    //                             ->where('items_id','=',$val->items_id)
    //                             ->where('qty','>',0)
    //                             ->get();

    //         if(!empty($pscn_lists)){
    //             $app[$value->db_name] = ["greyout"=>"","interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
                
    //         }else{
    //             $app[$value->db_name] = ["greyout"=>"disabled","interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
    //         }

    //     }

    // }

    // }

   // print_r($app);

   
     //print_r($arr);
    
        // if($arr['all_joinery'] == 0){
        //     $arr['all_joinery'] = ["greyout"=>($value->other >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['aluminium_windows'] == 0){
        //     $arr['aluminium_windows'] = ["greyout"=>($value->aluminium_windows >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1]; 
        // }

        // if($arr['aluminium_doors'] == 0){
        //     $arr['aluminium_doors'] = ["greyout"=>($value->aluminium_doors >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['curtain_wall'] == 0){
        //     $arr['curtain_wall'] = ["greyout"=>($value->curtain_wall >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['aluminium_louvres'] == 0){
        //     $arr['aluminium_louvres'] = ["greyout"=>($value->aluminium_louvres >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['kitchens'] == 0){
        //     $arr['kitchens'] = ["greyout"=>($value->kitchens >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['kitchenettes'] == 0){
        //     $arr['kitchenettes'] = ["greyout"=>($value->kitchenettes >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['bedrooms'] == 0){
        //     $arr['bedrooms'] = ["greyout"=>($value->bedrooms >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['laundries'] == 0){
        //     $arr['laundries'] = ["greyout"=>($value->laundries >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['bathrooms'] == 0){
        //     $arr['bathrooms'] = ["greyout"=>($value->bathrooms >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['ensuites'] == 0){
        //     $arr['ensuites'] = ["greyout"=>($value->ensuites >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['balconies'] == 0){
        //     $arr['balconies'] = ["greyout"=>($value->balconies >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['storage'] == 0){
        //     $arr['storage'] = ["greyout"=>($value->storage >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['study'] == 0){
        //     $arr['study'] = ["greyout"=>($value->study >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['garages'] == 0){
        //     $arr['garages'] = ["greyout"=>($value->garages >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }

        // if($arr['other'] == 0){
        //     $arr['other'] = ["greyout"=>($value->other >= 1 ? 1 : 0),"interest"=>1,"estimated_date"=>"","quoted_date"=>"","status"=>1];
        // }
    //}

    return $app;
    
   }


   public function getExistingSupplyItems($id)
   {   
     
    $lists = DB::table('supply_items as si')
                     ->leftjoin('m_items_supply as is','is.id','=','si.items_id')
                     ->select('si.*','is.name','is.db_name')
                     ->where('project_id','=',$id)->get();

    //print_r($lists);
    
    $ar = [];
    foreach ($lists as $key => $value) {

        if($value->quoted_date != ''){
            $quoted_date = date("d-m-Y", strtotime($value->quoted_date));
        }else{
            $quoted_date = '';
        }
        if($value->estimated_date != ''){
            $estimated_date = date("d-m-Y", strtotime($value->estimated_date));
        }else{
            $estimated_date = '';
        }

     //  $quoted_date = date("d-m-Y", strtotime($value->quoted_date));
       // $estimated_date = date("d-m-Y", strtotime($value->estimated_date));
       
        $ar[$value->db_name] = ["greyout"=>($value->greyout == 0 ? "disabled" : ""),"interest"=>$value->interest_id,"estimated_date"=>$estimated_date,"quoted_date"=>$quoted_date,"status"=>$value->supply_status]; 
        
    }

    $supply_items_territory = DB::table('supply_items_territory as sit')
    ->where('project_id','=',$id)->first();                     

    $ar['territory'] = $supply_items_territory->territory_id;

    //print_r($ar);  
    return $ar;
       
   }


   public function updateSupplyItems(Request $request,$id)
   {
    $token = $this->getToken($request);
    $user = JWTAuth::toUser($token);
    $input = $request->all();

    $input_data = $input['info'];
    $data = DB::table('m_items_supply')->get();

    $arr = [];
    
  //  print_r($input_data);

    DB::table('supply_items')->where('project_id','=',$id)->delete();

    foreach ($data as $key => $value) {
        
         // print_r($value->db_name);
         // print_r($input_data[$value->db_name.'_interest']);
         //print_r($input_data['balconies_quoted_date']['formatted']);

        $quoted_date = isset($input_data[$value->db_name.'_quoted_date']['formatted']) ? $input_data[$value->db_name.'_quoted_date']['formatted'] : '';

        $estimated_date =  isset($input_data[$value->db_name.'_estimated_date']['formatted']) ? $input_data[$value->db_name.'_estimated_date']['formatted'] : '';

       // print_r($quoted_date);
        // if(empty($quoted_date)){
        //     $quoted_date = '';
        // }
        // if(empty($estimated_date)){
        //     $estimated_date = '';
        // }

        
        if($quoted_date != ''){
            $quoted_date = date("Y-m-d", strtotime($quoted_date));
        }
        if($estimated_date != ''){
            $estimated_date = date("Y-m-d", strtotime($estimated_date));
        }

        $arr[$key]['project_id'] = $id;
        $arr[$key]['items_id'] = $value->id;
        $arr[$key]['interest_id'] = $input_data[$value->db_name.'_interest'];
        $arr[$key]['estimated_date'] = $estimated_date;
        $arr[$key]['quoted_date'] =  $quoted_date;
        $arr[$key]['supply_status'] = $input_data[$value->db_name.'_status'];

        //$arr[$key]['greyout'] = $input_data[$value->db_name.'_greyout'];
        $arr[$key]['greyout'] = $input_data[$value->db_name.'_greyout'] == "disabled" ? 0 : 1;
        
        
        //print_r($arr[$key]);
        $listId = DB::table('supply_items')->insertGetId($arr[$key]);
    }

    DB::table('supply_items_territory')->where('project_id','=',$id)->delete();

    $st_data = array(
        'project_id'=>$id,
        'territory_id'=>$input_data['territory']
    );
    $st_id = DB::table('supply_items_territory')->insertGetId($st_data);
    
    $result = array();
    $res_msg = "Your record has been inserted sucessfully";
    if($listId){
        $result['info']['msg'] = $res_msg;
        return response()->json(['result'=>$result]);
    }
    return response()->json(['error'=>'Your record update failed!!'],401);

   }

   


}
