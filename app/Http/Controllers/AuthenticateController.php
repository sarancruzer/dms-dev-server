<?php namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use JWTAuth;
use App\User;
use DB;
use Hash;
class AuthenticateController extends Controller
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
 
    public function authenticate(Request $request)
    {
        $credentials = $request->only('email', 'password');
       
        try {
            // verify the credentials and create a token for the user
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 401);
            }
        } catch (JWTException $e) {
            // something went wrong
            return response()->json(['error' => 'could_not_create_token'], 500);
        }


    $user =  DB::table('users as u')
             ->leftjoin('m_roles as r','r.id','=','u.role_id')
             ->select('u.*','r.name as user_type')
             ->where("email", $credentials["email"])
             ->first();
             
    $details["id"] = $user->id;
    $details["first_name"] = $user->first_name;
    $details["last_name"] = $user->last_name;
    $details["email"] = $user->email;
    $details["mobile"] = $user->mobile;
    $details["avatar"] = $user->avatar;
    $details["user_type"] = $user->user_type;

    User::where("id", $user->id)->update(array('last_login' => date("Y-m-d H:i:s") ));

    $details['role_permissions'] = $this->getUserRolePermissions($user->role_id);

    
     $result = array();
     $result['info'] = $details;
     $result['token'] = $token;
    // $result['statusCode'] = 200;
        // if no errors are encountered we can return a JWT
    return response()->json(["result"=>$result]);
    }

   
   public function getUserRolePermissions($role_id){

        $lists = DB::table('m_roles_modules as rm')
                ->leftjoin('m_modules as m','m.id','=','rm.module_id')
                ->select('rm.*','m.name as module_name','m.url as module_url')
                ->where('rm.role_id','=',$role_id)
                ->get();
        
        return $lists;
   }
 

    public function userUpdate(Request $request){
        $input = $request->all();
    
        $d = $input['info'];
        $data['name'] = $d['username'];
        $data['email'] = $d['email'];
        $data['mobile'] = $d['email'];
        $data['notes'] = $d['notes'];
        $data['twitter_link'] = $d['twitter_link'];
        $data['facebook_link'] = $d['facebook_link'];
        $data['googleplus_link'] = $d['googleplus_link'];
       
        $data['avatar'] = '';
        if($request->hasFile('avatar')){
                $destinationPath = 'uploads/avatar/'.$input["info"]["company"];
                $file = $request->file('avatar');
                $upfile = $file->move($destinationPath,$file->getClientOriginalName());
                $data["avatar"] = $destinationPath."/".$file->getClientOriginalName();
        }

        $profileId = DB::table('users')->insertGetId($data);
        if($profileId){
            $result['result'] = 'Your profile has been updated successfully! ';
            return response()->json(['result'=>$result]);
        }
        return response()->json(['result'=>'Your profile update failed!!'],401);

  }



  
}