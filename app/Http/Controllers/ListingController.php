<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use File;
use Carbon\Carbon;
use Geocode;

class ListingController extends Controller
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
        //
        //  $token = $this->getToken($request);
        //  $user = JWTAuth::toUser($token);
        $input = $request->all();
        
        $lists = DB::table('listings as l')
                        ->where('l.business_name','like',"%".$input['q']."%")
                        //->where('l.id','=',0)
                        ->select('l.*')
                        ->orderBy('l.id','asc')
                        ->paginate($this->list_count);        

        foreach ($lists as $key => $value) {
            $l_reviews = DB::table('listings_reviews as lr')
                        ->where('lr.listing_id','=',$value->id)
                        ->select(DB::raw("sum('lr.star_rating') as rating,count('lr.star_rating') as count"))
                       // ->groupBy('lr.star_rating')
                        ->first();

            $rating = (int) $l_reviews->rating;
            $count = (int) $l_reviews->count;
            $rating =  5;$count =  2;
           
            $ratings = round(( $rating / $count), 1); 
            $lists[$key]->star_rating = $ratings;                                                            
            $lists[$key]->review_count = $count;                                                            
            
           // $lists[$key]->reviews =  (($rating / $l_reviews->count) * 100);   

            $l_gallery = DB::table('listings_gallery as lg')
                        ->where('lg.listing_id','=',$value->id)
                        ->select('lg.*')
                        ->get();   
            
            $lists[$key]->image_path = "images/listing-item-01.jpg"; 
            if(count($l_gallery)>0){
                $lists[$key]->image_path = $l_gallery[0]->image_path;       
            }            
                                                                                    
        }
        
        
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
        // $token = $this->getToken($request);
    	// $user = JWTAuth::toUser($token);
        $input = $request->all();

        
        $d = $input['info'];

        $latLong = $this->getLatLong($d['address']);
       
        
        $data['business_name'] = $d['business_name'];
        $data['category'] = $d['category'];
        $data['keywords'] = $d['keywords'];
        $data['city'] = $d['city'];
        $data['latitude'] = $latLong['latitude']?$latLong['latitude']:'';
        $data['longitude'] = $latLong['longitude']?$latLong['longitude']:'';
        $data['address'] = $d['address'];
        $data['state'] = $d['state'];
        $data['zipcode'] = $d['zipcode'];
        $data['description'] = $d['description'];
        $data['phone'] = isset($d['phone'])?$d['phone']:'';
        $data['website'] = isset($d['website'])?$d['website']:'';
        $data['email'] = isset($d['email'])?$d['email']:'';
        $data['facebook_link'] =  isset($d['facebook_link'])?$d['facebook_link']:'';
        $data['twitter_link'] = isset($d['twitter_link'])?$d['twitter_link']:'';
        $data['googleplus_link'] =isset($d['googleplus_link'])?$d['googleplus_link']:'';
        $data['created_at'] = date("Y-m-d H:i");
        

        $listingId = DB::table('listings')->insertGetId($data);

        $this->insertOtherListings($request , $input , $listingId);

        if($listingId){
            $result['result'] = 'Your listing has been inserted successfully';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your listing has been coud not added!'],401);
        
    }


   public function getLatLong($address){
    if(!empty($address)){
        //Formatted address
        $formattedAddr = str_replace(' ','+',$address);
        //Send request and receive json data by address
        $geocodeFromAddr = file_get_contents('http://maps.googleapis.com/maps/api/geocode/json?address='.$formattedAddr.'&sensor=false'); 
        $output = json_decode($geocodeFromAddr);

      //  print_r($output);
        //Get latitude and longitute from json data
        $data['latitude']  = $output->results[0]->geometry->location->lat; 
        $data['longitude'] = $output->results[0]->geometry->location->lng;
        //Return latitude and longitude of the given address
        if(!empty($data)){
            return $data;
        }else{
            return false;
        }
    }else{
        return false;   
    }
}


    public function insertOtherListings($request , $input , $listingId){

        $data = $input;
        if(isset($data['amenities']) && !empty($data['amenities'])){
             foreach ($data['amenities'] as $key => $value) {
                if($value['value'] == true){
                    $a_data['listing_id'] = $listingId;
                    $a_data['amenities'] = $value['id'];
                    $a_id = DB::table('listings_amenities')->insertGetId($a_data);             
                }
            }
        }

        if(isset($data['opening_hours']) && !empty($data['opening_hours'])){

             foreach ($data['opening_hours'] as $key => $value) {
                $o_data['listing_id'] = $listingId;
                $o_data['weekdays_id'] = $value['weekday'];
                $o_data['opening_time'] = $value['opening_time'];
                $o_data['closing_time'] = $value['closing_time'];
                          
                $o_id = DB::table('listings_opening_hours')->insertGetId($o_data);             
            }
        }
                                          

  
         if($request->hasFile('gallery')){
           
            $files = $request->file('gallery');
             foreach ($files as $key => $file) {

                $destinationPath = 'uploads/gallery';
                $mt_random = mt_rand(1000000000, 9999999999);
                $file_name = $mt_random.'.png';
                
                $upfile = $file->move($destinationPath,$file_name);

                $g_data['listing_id'] = $listingId;
                $g_data['image_path'] = $destinationPath."/".$file_name;
               
                $o_id = DB::table('listings_gallery')->insertGetId($g_data);  

             }
        }
    
      //  print_r($data);

        if(isset($data['pricing_category']) && !empty($data['pricing_category'])){

             foreach ($data['pricing_category'] as $key => $value) {
                $pc_data['listing_id'] = $listingId;
                $pc_data['category_name'] = $value['pricing_category'];
                          
                $pc_id = DB::table('listing_pricing_category')->insertGetId($pc_data);             


                 if(isset($value['pricing_services']) && !empty($value['pricing_services'])){
                      //  echo "values";
                        foreach ($value['pricing_services'] as $k => $val) {
                        $ps_data['listing_id'] = $listingId;
                        $ps_data['listing_pricing_id'] = $pc_id;
                        $ps_data['title'] = $val['title'];
                        $ps_data['description'] = $val['desc'];  
                        $ps_data['price'] = $val['price'];
                          
                        $a_id = DB::table('listing_pricing_services')->insertGetId($ps_data);  
                          

                    }   
                 }
            }
            
        }



    }

    public function uploadGallery(Request $request,$listingId){

        // $token = $this->getToken($request);
    	// $user = JWTAuth::toUser($token);
        $input = $request->all();

        $d = $input['gallery'];

        $gal_arr = [];
         if($request->hasFile('gallery')){
           
            $files = $request->file('gallery');
             foreach ($files as $key => $file) {

                $destinationPath = 'uploads/gallery';
                $mt_random = mt_rand(1000000000, 9999999999);
                $file_name = $mt_random.'.png';
                
                $upfile = $file->move($destinationPath,$file_name);

                $g_data['listing_id'] = $listingId;
                $g_data['image_path'] = $destinationPath."/".$file_name;
               
                $o_id = DB::table('listings_gallery')->insertGetId($g_data);  

                $gal_arr[$key]['id'] = $o_id;
                $gal_arr[$key]['listing_id'] = $listingId;
                $gal_arr[$key]['image_path'] = $g_data['image_path'];

             }
        }

       if($o_id){
          //  $gallery_lists = DB::table('listings_gallery')->where('listing_id','=',$listingId)->get(); 
            $result['info']['message'] = 'Your listing gallery has been added successfully';
            $result['info']['gallery'] =  $gal_arr;
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your listing has been coud not added!'],401);

    }

     public function deleteGallery(Request $request){

        // $token = $this->getToken($request);
    	// $user = JWTAuth::toUser($token);
        $input = $request->all();

           
        $o_id = DB::table('listings_gallery')->where('id','=',$input['info']['id'])->delete();  
        
       if($o_id){
            File::delete($input['info']['image_path']);
            $result['info'] = 'Your listing gallery has been removed successfully';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your listing has been coud not removed!'],401);

    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request , $id)
    {
        //

        $lists = DB::table('listings')->first();

        $l_amenities = DB::table('listings_amenities')
                    ->where('listing_id','=',$lists->id)
                    ->get();
        $l_gallery = DB::table('listings_gallery')
                    ->where('listing_id','=',$lists->id)
                    ->get();
        $l_opening_hours = DB::table('listings_opening_hours')
                    ->where('listing_id','=',$lists->id)
                    ->get();
        $l_reviews = DB::table('listings_reviews')
                    ->where('listing_id','=',$lists->id)
                    ->get();
        $l_pricing_category = DB::table('listing_pricing_category')
                    ->where('listing_id','=',$lists->id)
                    ->get();                    
        $l_reviews = DB::table('listing_pricing_services')
                    ->where('listing_id','=',$lists->id)
                    ->get();

         if(count($lists)>0){
            $result['result']['lists'] = $lists;
            $result['result']['l_amenities'] = $l_amenities;
            $result['result']['l_gallery'] = $l_gallery;
            $result['result']['l_opening_hours'] = $l_opening_hours;
            $result['result']['l_reviews'] = $l_reviews;
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your listing has been coud not added!'],401);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request , $id)
    {
        //
        // $token = $this->getToken($request);
    	// $user = JWTAuth::toUser($token);
        $input = $request->all();

        $lists = DB::table('listings')->where('id','=',$id)->first();

        $l_amenities = DB::table('listings_amenities')
                    ->where('listing_id','=',$id)
                    ->get();
        $l_gallery = DB::table('listings_gallery')
                    ->where('listing_id','=',$id)
                    ->select('id','image_path')
                    ->get();
        $l_opening_hours = DB::table('listings_opening_hours')
                    ->where('listing_id','=',$id)
                    ->get();
        $l_reviews = DB::table('listings_reviews')
                    ->where('listing_id','=',$id)
                    ->get();
        $l_pricing_category = DB::table('listing_pricing_category')
                    ->select('id','category_name as title')
                    ->where('listing_id','=',$id)
                    ->get();                    
        $l_reviews = DB::table('listing_pricing_services')
                    ->where('listing_id','=',$id)
                    ->get();

        foreach($l_pricing_category as $key => $value){

        $l_pricing_services = DB::table('listing_pricing_services')
                    ->where('listing_pricing_id','=',$value->id)
                    ->get(); 
        $l_pricing_category[$key]->pricing_services = $l_pricing_services;
        }            

         if(count($lists)>0){
            $result['info']['lists'] = $lists;
            $result['info']['l_amenities'] = $l_amenities;
            $result['info']['l_gallery'] = $l_gallery;
            $result['info']['l_opening_hours'] = $l_opening_hours;
            $result['info']['l_reviews'] = $l_reviews;
            
            $result['info']['l_pricing_category'] = $l_pricing_category;
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your listing has been coud not added!'],401);
                    


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

        // $token = $this->getToken($request);
    	// $user = JWTAuth::toUser($token);
        $input = $request->all();

         $d = $input['info'];
        $latLong = $this->getLatLong($d['address']);   

       
        $data['business_name'] = $d['business_name'];
        $data['category'] = $d['category'];
        $data['keywords'] = $d['keywords'];
        $data['city'] = $d['city'];
        $data['address'] = $d['address'];
         $data['latitude'] = $latLong['latitude']?$latLong['latitude']:'';
        $data['longitude'] = $latLong['longitude']?$latLong['longitude']:'';
        $data['state'] = $d['state'];
        $data['zipcode'] = $d['zipcode'];
        $data['description'] = $d['description'];
        $data['phone'] = $d['phone'];
        $data['website'] = $d['website'];
        $data['email'] = $d['email'];
        $data['facebook_link'] = $d['facebook_link'];
        $data['twitter_link'] = $d['twitter_link'];
        $data['googleplus_link'] = $d['googleplus_link'];
        

     //   print_r($d);

        $listingId = DB::table('listings')->where('id','=',$id)->update($data);

        $this->updateOtherListings($input , $id,$request);

        if($listingId){
            $result['result'] = 'Your listing has been updated successfully';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your listing has been coud not updated!'],401);
    }

     public function updateOtherListings($input , $listingId,$request){

        $data = $input;

       // print_r($data);
       echo json_encode( $data );
        if(isset($data['amenities']) && !empty($data['amenities'])){
            DB::table('listings_amenities')->where('listing_id','=',$listingId)->delete();
             foreach ($data['amenities'] as $key => $value) {
             if($value['value'] == "true"){                 
                $a_data['listing_id'] = $listingId;
                $a_data['amenities'] = $value['id'];
                          
                $a_id = DB::table('listings_amenities')->insertGetId($a_data);             
             }
            }
        }

        if(isset($data['opening_hours']) && !empty($data['opening_hours'])){
            DB::table('listings_opening_hours')->where('listing_id','=',$listingId)->delete();
             foreach ($data['opening_hours'] as $key => $value) {
                $o_data['listing_id'] = $listingId;
                $o_data['weekdays_id'] = $value['weekdays_id'];
                $o_data['opening_time'] = $value['opening_time'];
                $o_data['closing_time'] = $value['closing_time'];
                          
                $o_id = DB::table('listings_opening_hours')->insertGetId($o_data);             
            }
        }


       if($request->hasFile('gallery')){

            DB::table('listings_gallery')->where('listing_id','=',$listingId)->delete();
           
            $files = $request->file('gallery');
             foreach ($files as $key => $file) {

                $destinationPath = 'uploads/gallery';
                $mt_random = mt_rand(1000000000, 9999999999);
                $file_name = $mt_random.'.png';
                
                $upfile = $file->move($destinationPath,$file_name);

                $g_data['listing_id'] = $listingId;
                $g_data['image_path'] = $destinationPath."/".$file_name;
               
                $o_id = DB::table('listings_gallery')->insertGetId($g_data);  

             }
        }


        if(isset($data['pricing_category']) && !empty($data['pricing_category'])){
             DB::table('listing_pricing_category')->where('listing_id','=',$listingId)->delete();
             DB::table('listing_pricing_services')->where('listing_id','=',$listingId)->delete();

             foreach ($data['pricing_category'] as $key => $value) {
                $pc_data['listing_id'] = $listingId;
                $pc_data['category_name'] = $value['pricing_category'];
                          
                $pc_id = DB::table('listing_pricing_category')->insertGetId($pc_data);             


                 if(isset($value['pricing_services']) && !empty($value['pricing_services'])){
                 
                        foreach ($value['pricing_services'] as $k => $val) {
                        $ps_data['listing_id'] = $listingId;
                        $ps_data['listing_pricing_id'] = $pc_id;
                        $ps_data['title'] = $val['title'];
                        $ps_data['description'] = $val['desc'];  
                        $ps_data['price'] = $val['price'];
                          
                        $a_id = DB::table('listing_pricing_services')->insertGetId($ps_data);             
                    }   
                 }
            }
            
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
        //
        $token = $this->getToken($request);
    	$user = JWTAuth::toUser($token);
        $input = $request->all();

        $data['is_deleted'] = 1;
        $del_id = DB::table('listings')->where('id','=',$id)->update($data);  

        if($del_id){
            $result['result'] = 'Your listing has been deleted successfully';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your listing has been coud not deleted!'],401);

    }

    public function searchListing(Request $request){

        //  $token = $this->getToken($request);
        //  $user = JWTAuth::toUser($token);
        $input = $request->all();
        $d = $input['info'];
        $searchText = $d['searchText'];
        $searchLocation = $d['searchLocation'];
        $searchCategory = $d['searchCategory'];
        $searchDistance = $d['searchDistance'];

        if($searchDistance == 0){
            $searchDistance=1000;
        }

        $latitude = 12.9229153;
        $longitude = 80.1274558;

        $haversine = "(3959 * acos(cos(radians($latitude)) * cos(radians(latitude)) * cos(radians(longitude) - radians($longitude)) + sin(radians($latitude)) * sin(radians(latitude))))";

        $lists = DB::table('listings as l')
                        ->leftjoin('m_category as mc','mc.id','=','l.category')
                        ->leftjoin('m_city as c','c.id','=','l.city')
                        ->leftjoin('m_state as s','s.id','=','l.state')
                        //->where('l.id','=',0)
                        ->select('l.*','mc.name as category_name')
                        ->whereRaw("{$haversine} < ?", $searchDistance)
                        ->where(function($query) use ($searchText,$searchLocation)
                        {
                        if(!empty($searchText)):
                            $query->where('l.business_name','like',"%".$searchText."%");
                        endif;
                        if(!empty($searchLocation)):
                            $query->orWhere('l.address','like',"%".$searchLocation."%");
                            $query->orWhere('c.name', 'like',"%".$searchLocation."%");
                            $query->orWhere('s.name', 'like',"%".$searchLocation."%");
                        endif;
                        
                        })
                        ->where(function($query) use ($searchCategory)
                        {
                             if(!empty($searchCategory)):
                            $query->where('mc.id','=',$searchCategory);
                            endif;
                        })
                        ->orderBy('l.id','asc')
                        ->paginate($this->list_count);        

        foreach ($lists as $key => $value) {
            $l_reviews = DB::table('listings_reviews as lr')
                        ->where('lr.listing_id','=',$value->id)
                        ->select(DB::raw("sum('lr.star_rating') as rating,count('lr.star_rating') as count"))
                       // ->groupBy('lr.star_rating')
                        ->first();

            $rating = (int) $l_reviews->rating;
            $count = (int) $l_reviews->count;
            $rating =  5;$count =  2;
           
            $ratings = round(( $rating / $count), 1); 
            $lists[$key]->star_rating = $ratings;                                                            
            $lists[$key]->review_count = $count;                                                            
            
           // $lists[$key]->reviews =  (($rating / $l_reviews->count) * 100);        
           $nameOfDay = date('D');
           $l_listings_opening_hours = DB::table('listings_opening_hours as loh')
                                    ->leftjoin('m_weekdays as mw','mw.id','=','loh.weekdays_id')
                                    ->leftjoin('m_time as mt','mt.id','=','loh.opening_time')
                                    ->leftjoin('m_time as mtt','mtt.id','=','loh.closing_time')
                                    ->select('mw.name as weekdays_name','mt.name as opening_time','mtt.name as closing_time','mt.short_name as opentime','mtt.short_name as closetime',DB::raw("DATE_FORMAT(NOW(), '%H:%i:%s') as curr"))
                                    ->where('loh.listing_id','=',$value->id)
                                    ->where('mt.short_name','<=',DB::raw("DATE_FORMAT(NOW(), '%H:%i:%s')"))
                                    ->where('mtt.short_name','>=',DB::raw("DATE_FORMAT(NOW(), '%H:%i:%s')"))
                                   ->where('mw.short_name','=',$nameOfDay)
                                    ->get();    

           // print_r($l_listings_opening_hours);

                if(count($l_listings_opening_hours)>0){
                    $lists[$key]->is_open = true;  
                }else{
                    $lists[$key]->is_open = false;  
                }
       
        }

        $result = array();
        if(count($lists) > 0){
             $result["info"] = $lists;
             return response()->json(["result" => $result]);   
        }
        return response()->json(['error'=>"No records found!"],401);


    }


    

     public function getListingNames(Request $request )
    {
        //
        // $token = $this->getToken($request);
    	// $user = JWTAuth::toUser($token);
        $input = $request->all();
        $lists = DB::table('listings')
                ->select('id','business_name')
                ->where('status','=',1)->get();  

        if($lists){
            $result['info'] = $lists;
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'No records found!'],401);

    }

    
}
