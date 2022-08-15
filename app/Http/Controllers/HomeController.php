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
        
        /*SI EL USUARIO ES TIPO EMPRESA  => GUARDA SESSION*/
        /* modificaciones */
        if(!session()->exists('empresa_id'))
            $this->esEmpresa(Auth::id());
        


        return view('home');
    }


    public function esEmpresa($usuario_id)
    {
        try {
            $empresa = \App\Empresa::where('user_id',$usuario_id)->first();
            //dd($empresa);   
            
            if(isset($empresa))
            { session(['empresa_id' => $empresa->empr_id]) ;
    
            }
            return true;
        } catch (\Throwable $th) {
            return false;
        }
        
            

    }

    public function login_empresa()
    {
        return view('empresas.home_empresa');
    }


    
}
