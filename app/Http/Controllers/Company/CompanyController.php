<?php

namespace App\Http\Controllers\Company;

use App\Http\Controllers\Controller;
use App\Http\Requests\CompanyRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Tenant;
use App\Models\Domains;
use DataTables;
use Response;


class CompanyController extends Controller
{
    //

    public function __construct()
    {
        //$this->middleware('auth');
        $this->middleware('tenantAuth');
    }

    /**
     * Show list of companies tenants
    */
    public function index()
    {  
        return view('admin.company.index');
    }

    /**
     * Get list of companies tenants from database
    */
   public function get(Request $request)
   {
        if ($request->ajax()) {
            $data = Tenant::select('tenants.*','domains.domain')
                    ->join('domains', 'domains.tenant_id', '=', 'tenants.id','left')
                    ->get();
            return Datatables::of($data)
                ->editColumn('domain', function ($request) {
                    $domain = '<a class="btn btn-link" href="http://'.$request->domain.'" target="_blank">'.$request->domain.'</a>';
                    return $domain;
                 })
                ->editColumn('created_at', function ($request) {
                    return date('m-d-Y h:i a',strtotime($request->created_at));
                 })
                ->addColumn('action', function($row){
                   // $actionBtn = '<a href="'.route('user.edit', ['id' => $row->id]).'" class="edit btn btn-success btn-sm">Edit</a> <a href="javascript:void(0)" class="delete btn btn-danger btn-sm" onclick="rowDelete('.$row->id.')">Delete</a>';
                   // return $actionBtn;
                })
                ->rawColumns(['action','domain'])
                ->make(true);
        }
    }
    
    
}
