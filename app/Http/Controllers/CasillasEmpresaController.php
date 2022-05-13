<?php

namespace App\Http\Controllers;

use App\Empresa;
use App\Rack;
use Auth;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

use Illuminate\Http\Request;

class CasillasEmpresaController extends Controller
{

    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        //$this->foo = $foo;
    }


    public function lista_casillas_asignadas($id)
    {

        $casillas = DB::table('casillas_empresas')->paginate(10);


        return view('empresas.lista_celdas_asignadas', ['empresa' => Empresa::findOrFail($id),'filas' => $casillas]);
    }
 

 
 
 
    public function create_casillas_empresa($id)
    {

        $empresa = Empresa::findOrFail($id);
        //$casillas = DB::table('casillas_empresas')->paginate(10);

        $racks = DB::table('racks')->get();
        
        return view('empresas.asignar_celdas', ['empresa' => $empresa, 'racks' =>$racks]);
    }
 


     
    public function save_casillas_asignadas(Request $request, $id)
    {
        
 
         foreach ($request->get("casillas") as $key => $value) {
            echo 'VALOR  =>'.$value["rc_id"].' - '.$value["rc_nombre"].'<br>';
        }

  
/*  
        $empresa = Empresa::findOrFail($id);
        //$casillas = DB::table('casillas_empresas')->paginate(10);

        $racks = DB::table('racks')->get();

        return view('empresas.asignar_celdas', ['empresa' => $empresa, 'racks' =>$racks]);
        */
    }
    
}
