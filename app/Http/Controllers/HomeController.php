<?php
 
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        if(!session()->has('empresa_id'))
        {
            $empresa = \App\Empresa::find(Auth::id());
//            dd($empresa);   

            if(!is_null($empresa));
            { 
                session(['empresa_id' => isset($empresa->empr_id)?$empresa->empr_id:'']) ;
                
                //echo 'EMPRESA_ID '.$_SESSION['session']['empresa_id'];
    
            }
            
            
            
        }

        return view('home');
    }


    public function login_empresa()
    {
        return view('empresas.home_empresa');
    }


    
}
