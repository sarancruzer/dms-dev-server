<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use JWTAuth;
use App\User;
use DB;
use Hash;
use App;
use PDF;

class ReportController extends Controller
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
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function getClientReportList(Request $request)
    {
        //
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();
        
        //echo public_path();
        //return PDF::loadHTML($str)->save(public_path().'/my_stored_file1.pdf')->download('download.pdf');

        // $pdf = PDF::loadView('pdf.invoice', $data);
        // return $pdf->download('invoice.pdf');

        // $pdf = App::make('dompdf.wrapper');
        // $pdf->loadHTML('<h1>Test</h1>');
        // return $pdf->download("file.pdf");

        

        $lists = DB::table('clients as c')
                    ->leftjoin('m_client_type as mct','mct.id','=','c.business_type')
                    ->leftjoin('m_client_size as mcs','mcs.id','=','c.client_size')
                    ->leftjoin('license as l','l.id','=','c.manage_license')
                    ->leftjoin('m_state as ms','ms.id','=','c.state')
                    ->leftjoin('m_contacts as mc','mc.client_name','=','c.id')                   
                    
                    ->select('c.*','mct.name as client_type','mcs.name as client_size','l.license_trading_name as licensee','ms.name as state',DB::raw("COUNT(mc.id) AS contacts_no"))
                    ->groupby('c.id')
                    ->get();

        $str= '    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                    <table width="100%" cellspacing="2" cellpadding="2" border="1" >
                    <thead>
                    <style>
                    thead {backgroun:darkgrey;}
                    table, th, td {
                        border: 1px solid black;
                    }
                    </style>
                    <tr >
                    <th colspan="10" align="center"><h3>Client Activity Report</h3></th>
                    </tr>

                        <tr >
                            <th>Client Name</th>
                            <th>Client Type</th>
                            <th>Client Size</th>
                            <th>Licensee</th>
                            <th>State</th>
                            <th>No.of Contacts</th>
                            <th>Total Projects</th> 
                            <th>Total Quotes (no)</th> 
                            <th>Total Quotes($)</th> 
                            <th>Total Sales($)</th> 
                        </tr>
                    </thead>
                    <tbody>';
        
                    foreach ($lists as $key => $value) {

                        $projects = DB::table('project as p')
                                    ->select('p.*')
                                    ->where('p.client_name','=',$value->id)
                                    ->get();

                                    $quote_count = 0;;
                                    $quote_value = 0;       

                                    foreach ($projects as $k => $val) {
                                       

                                        $pquote = DB::table('project_scope_quote as psc')
                                            ->select('psc.*')
                                            ->where('psc.project_id','=',$val->id)
                                            ->first();

                                        if(count($pquote)>0){
                                                                                   
                                            $quote_count++;
                                            $quote_value = $quote_value + $pquote->quote;        
                                        }   
                                        
                                    }                       
                        
                        $str .= '<tr>
                                    <td>'.$value->client_business.'</td>
                                    <td>'.$value->client_type.'</td>
                                    <td>'.$value->client_size.'</td>
                                    <td>'.$value->licensee.'</td>
                                    <td>'.$value->state.'</td>
                                    <td>'.$value->contacts_no.'</td>
                                    <td>'.count($projects).'</td>
                                    <td>'.$quote_count.'</td>
                                    <td>'.$quote_value.'</td>
                                    <td>'.$quote_value.'</td>
                                </tr>';
                    }

                    $str .= '</tbody></table></div></div></div>';


         $pdf = App::make('dompdf.wrapper');
         $pdf->loadHTML($str);
         $pdf->setPaper('A4', 'landscape');
         return $pdf->download("file.pdf");
    

        
    }


    public function getClientReport(Request $request)
    {
        //
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();
        
        //echo public_path();
        //return PDF::loadHTML($str)->save(public_path().'/my_stored_file1.pdf')->download('download.pdf');

        // $pdf = PDF::loadView('pdf.invoice', $data);
        // return $pdf->download('invoice.pdf');

        // $pdf = App::make('dompdf.wrapper');
        // $pdf->loadHTML('<h1>Test</h1>');
        // return $pdf->download("file.pdf");

        

        $lists = DB::table('clients as c')
                    ->leftjoin('m_client_type as mct','mct.id','=','c.business_type')
                    ->leftjoin('m_client_size as mcs','mcs.id','=','c.client_size')
                    ->leftjoin('license as l','l.id','=','c.manage_license')
                    ->leftjoin('m_state as ms','ms.id','=','c.state')
                    ->leftjoin('m_contacts as mc','mc.client_name','=','c.id')                   
                    
                    ->select('c.*','mct.name as client_type','mcs.name as client_size','l.license_trading_name as licensee','ms.name as state',DB::raw("COUNT(mc.id) AS contacts_no"))
                    ->groupby('c.id')
                    ->get();

        $str= '    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                    <table width="100%" cellspacing="2" cellpadding="2" border="1" >
                    <thead>
                    <style>
                    thead {backgroun:darkgrey;}
                    table, th, td {
                        border: 1px solid black;
                    }
                    </style>
                    <tr >
                    <th colspan="10" align="center"><h3>Client Activity Report</h3></th>
                    </tr>

                        <tr >
                            <th>Client Name</th>
                            <th>Client Type</th>
                            <th>Client Size</th>
                            <th>Licensee</th>
                            <th>State</th>
                            <th>No.of Contacts</th>
                            <th>Total Projects</th> 
                            <th>Total Quotes (no)</th> 
                            <th>Total Quotes($)</th> 
                            <th>Total Sales($)</th> 
                        </tr>
                    </thead>
                    <tbody>';
        
                    foreach ($lists as $key => $value) {

                        $projects = DB::table('project as p')
                                    ->select('p.*')
                                    ->where('p.client_name','=',$value->id)
                                    ->get();

                                    $quote_count = 0;;
                                    $quote_value = 0;       

                                    foreach ($projects as $k => $val) {
                                       

                                        $pquote = DB::table('project_scope_quote as psc')
                                            ->select('psc.*')
                                            ->where('psc.project_id','=',$val->id)
                                            ->first();

                                        if(count($pquote)>0){
                                                                                   
                                            $quote_count++;
                                            $quote_value = $quote_value + $pquote->quote;        
                                        }   
                                        
                                    }                       
                        
                        $str .= '<tr>
                                    <td>'.$value->client_business.'</td>
                                    <td>'.$value->client_type.'</td>
                                    <td>'.$value->client_size.'</td>
                                    <td>'.$value->licensee.'</td>
                                    <td>'.$value->state.'</td>
                                    <td>'.$value->contacts_no.'</td>
                                    <td>'.count($projects).'</td>
                                    <td>'.$quote_count.'</td>
                                    <td>'.$quote_value.'</td>
                                    <td>'.$quote_value.'</td>
                                </tr>';
                    }

                    $str .= '</tbody></table></div></div></div>';


         $pdf = App::make('dompdf.wrapper');
         $pdf->loadHTML($str);
         $pdf->setPaper('A4', 'landscape');
         return $pdf->download("file.pdf");
    

        
    }

    

    public function getProjectReport(Request $request)
    {
        //
        $token = $this->getToken($request);
        $user = JWTAuth::toUser($token);
        $input = $request->all();

        $id = $input['id'];
        
        //echo public_path();
        //return PDF::loadHTML($str)->save(public_path().'/my_stored_file1.pdf')->download('download.pdf');

        // $pdf = PDF::loadView('pdf.invoice', $data);
        // return $pdf->download('invoice.pdf');

        // $pdf = App::make('dompdf.wrapper');
        // $pdf->loadHTML('<h1>Test</h1>');
        // return $pdf->download("file.pdf");

        

        $lists = DB::table('project as p')
                    ->leftjoin('clients as c','c.id','=','p.client_name')
                    ->leftjoin('m_state as ms','ms.id','=','p.state')
                    ->leftjoin('m_project_status as mps','mps.id','=','p.project_status')                   
                    
                    ->select('p.*','c.client_company_name','ms.name as project_state','mps.name as project_status')
                    ->where('p.id','=',$id)
                    ->first();

        $str= '    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                    <table width="100%" cellspacing="3" cellpadding="3" border="1" >
                    <thead>
                    <style>
                    thead {backgroun:darkgrey;}
                    table, th, td {
                        border: 1px solid black;
                    }
                    </style>
                        <tr  >
                        <th colspan="2" align="center">Project Details</th>
                        </tr>
                        <tr>
                        <td>Project identifier</td>
                        <td> 00'.$lists->id .'</td>
                        </tr>
                        <tr>
                        <td>Client Name</td>
                        <td>'. $lists->client_company_name .'</td>
                        </tr>
                        <tr>
                        <td>Client Type</td>
                        <td>'. $lists->client_company_name .'</td>
                        </tr>
                        <tr>
                        <td>Project Name</td>
                        <td>'. $lists->project_name .'</td>
                        </tr>
                        <tr>
                        <td>Project Address</td>
                        <td>'. $lists->address1.''.$lists->address2 .'</td>
                        </tr>
                        <tr>
                        <td>Project State</td>
                        <td>'. $lists->project_state .'</td>
                        </tr>
                        <tr>
                        <td>Project Description</td>
                        <td>'. $lists->description .'</td>
                        </tr>
                        <tr>
                        <td>Project Status</td>
                        <td>'. $lists->project_status .'</td>
                        </tr>                                                    
                        <tr>
                        <td>Record Entry Date</td>
                        <td>'. $lists->created_at .'</td>
                        </tr>                                                    
                        <tr>
                        <td>Start Date</td>
                        <td>'. $lists->created_at .'</td>
                        </tr>                                                    
                        <tr>
                        <td>Duration (Months) </td>
                        <td>'. $lists->construction_duration .'</td>
                        </tr>  
                        <tr>
                        <td>No of Levels </td>
                        <td>'. $lists->levels_begin .' - '. $lists->levels_end . '</td>
                        </tr>                                                    
                    </thead>
                    <tbody>';

         $str .= '</tbody></table></div></div></div>';


         $projectTeamlists = DB::table('project_team as pt')
                    ->leftjoin('m_contacts as mc','mc.id','=','pt.developer')
                    ->leftjoin('m_contacts as pm','pm.id','=','pt.project_manager')
                    ->leftjoin('m_contacts as sm','sm.id','=','pt.site_manager')
                    ->select('pt.*','mc.first_name as developer','pm.first_name as project_manager','sm.first_name as site_manager','pt.architech','pt.engineer','pt.building_surveyor','pt.quantity_surveyor','pt.superintendent')
                    ->where('pt.project_id','=',$id)
                    ->first();


                    $str .= '<table width="100%" cellspacing="3" cellpadding="3" border="1" >
                    <thead>
                    <style>
                    thead {backgroun:darkgrey;}
                    table, th, td {
                        border: 1px solid black;
                    }
                    </style>
                        <tr  >
                        <th colspan="2" align="center">Project Team</th>
                        </tr>
                        <tr>
                        <td> Developer</td>
                        <td> '.$projectTeamlists->developer .'</td>
                        </tr> 
                        <tr>
                        <td>Project Manager</td>
                        <td> '.$projectTeamlists->project_manager .'</td>
                        </tr> 
                        <tr>
                        <td>Site Manager</td>
                        <td> '.$projectTeamlists->site_manager .'</td>
                        </tr> 
                        <tr>
                        <td>Architect</td>
                        <td> '.$projectTeamlists->architech .'</td>
                        </tr> 
                        <tr>
                        <td>Engineer</td>
                        <td> '.$projectTeamlists->engineer .'</td>
                        </tr> 
                        <tr>
                        <td>Building Surveyor</td>
                        <td> '.$projectTeamlists->building_surveyor .'</td>
                        </tr> 
                        <tr>
                        <td>Quantity Surveyor</td>
                        <td> '.$projectTeamlists->quantity_surveyor .'</td>
                        </tr>                                                                        
                        <tr>
                        <td>Superindent</td>
                        <td> '.$projectTeamlists->superintendent .'</td>
                        </tr>                                                                        
                    </thead>
                    <tbody>';
         $str .= '</tbody></table></div></div></div>';

        


         $pdf = App::make('dompdf.wrapper');
         $pdf->loadHTML($str);
         $pdf->setPaper('A4', 'portrait');
         return $pdf->download("ProjectReport.pdf");
    

        
    }

}
