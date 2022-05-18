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
        DB::enableQueryLog(); 
    }


    public function lista_casillas_asignadas($id)
    {
     
        $casillas_x_empresa = DB::table('casillas_empresas as ce')
        ->leftJoin('racks_casillas as rc', 'ce.rc_id','=','rc.rc_id')
        ->leftJoin('racks as r', 'rc.rack_id' ,'=', 'r.rack_id')
        ->where('ce.empr_id',$id)->paginate(10);
    

        //dd(DB::enableQueryLog()); 
        //dd($casillas_x_empresa);
        //$casillas_x_empresa = DB::table('casillas_empresas')->paginate(10);

        return view('empresas.lista_celdas_asignadas', ['empresa' => Empresa::findOrFail($id),'casillas_x_empresa' => $casillas_x_empresa]);
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
        
        try {

            DB::beginTransaction();
             
            foreach ($request->get("casillas") as $key => $value) {
                 $array_insert[] =
                [
                    'rc_id' => $value['rc_id'],
                    'empr_id' => $id
                ];
            }
            
            DB::table('casillas_empresas')->insert($array_insert);
            DB::commit();

            return response()->json(['errors' =>  200], 200);
   

   
         } catch (Exception $e) {
            DB::rollBack();    
            report($e);
            return response()->json(['errors' =>  DB::getQueryLog(),'status'=>400], 400);

            
        }
  
 
    }
    
}
