<?php

namespace App\Http\Controllers;

use App\Constants;
use App\Empresa;
use App\CasillasEmpresa;

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


    public function eliminarCasillaEmpresaId($idCliente, $id)
    {

        $casillas_x_empresa = CasillasEmpresa::find($id);
       //dd('valor'.$casillaID);


        if ($this->existeProductosCasillaId($casillas_x_empresa->rc_id) > 0) {
            return redirect()->route('lista_casillas_asignadas', ['id' => $idCliente])->with('message', 'No se puede eliminar esta casilla por que tiene productos')->with('operacion', '0');;
        } else {
            //DB::table('casillas_empresas')->where('id',  $id)->update('');
            $casillas_x_empresa->forceDelete();
            return redirect()->route('lista_casillas_asignadas', ['id' => $idCliente])->with('message', 'La operacion se realizo con Exito')->with('operacion', '1');
        }
    }







    public function obtenerCasillasEmpresaId(Request $request)
    {

        $casillas_x_empresa = DB::table('casillas_empresas as ce')
            ->leftJoin('racks_casillas as rc', 'ce.rc_id', '=', 'rc.rc_id')
            ->leftJoin('racks as r', 'rc.rack_id', '=', 'r.rack_id')
            ->where('ce.empr_id', $request->empresa_id)->whereNull('ce.deleted_at')
            ->orderBy('rack_nombre', 'asc')->get();
        // dd(DB::getQueryLog($casillas_x_empresa));

        return ($casillas_x_empresa->count() > 0 ? $casillas_x_empresa : "0");
    }



    public function existeProductosCasillaId(int $casilla_id)
    {


        $total_productos = DB::table('kardex as k')
            ->select('k.rc_id',  \DB::raw('sum(kard_cantidad)as total'))
            ->where('k.rc_id', $casilla_id)
            ->whereNull('k.deleted_at')
            ->groupBy('k.rc_id')
            ->get();

         return ($total_productos->count() > 0 ? $total_productos->count() : "0");
    }



    public function obtenerUbicacionProductoId(Request $request)
    {

        $casillas_x_empresa = DB::table('casillas_empresas as ce')
            ->join('racks_casillas as rc', 'ce.rc_id', '=', 'rc.rc_id')
            ->join('racks as r', 'rc.rack_id', '=', 'r.rack_id')
            ->join('kardex as k', 'k.rc_id', '=', 'rc.rc_id')
            ->select('rc.rc_id', 'k.prod_id', 'r.rack_nombre', 'rc.rc_nombre', \DB::raw('sum(kard_cantidad)as total'))
            ->where('k.prod_id', $request->prod_id)
            ->whereNull('k.deleted_at')
            ->groupBy('rc.rc_id', 'k.prod_id', 'r.rack_nombre', 'rc.rc_nombre')
            ->having('total', '>', 0)
            ->get();


        //dd(DB::getQueryLog($casillas_x_empresa));

        return ($casillas_x_empresa->count() > 0 ? $casillas_x_empresa : "0");
    }




    public function lista_casillas_asignadas($id)
    {

        $casillas_x_empresa = DB::table('casillas_empresas as ce')
            ->leftJoin('racks_casillas as rc', 'ce.rc_id', '=', 'rc.rc_id')
            ->leftJoin('racks as r', 'rc.rack_id', '=', 'r.rack_id')
            ->where('ce.empr_id', $id)->whereNull('ce.deleted_at')->paginate(Constants::NRO_FILAS);



        return view('empresas.lista_celdas_asignadas', ['empresa' => Empresa::findOrFail($id), 'casillas_x_empresa' => $casillas_x_empresa]);
    }





    public function create_casillas_empresa($id)
    {

        $empresa = Empresa::findOrFail($id);
        $racks = Rack::get();

        return view('empresas.asignar_celdas', ['empresa' => $empresa, 'racks' => $racks]);
    }




    public function save_casillas_asignadas(Request $request, $id)
    {

        try {

            DB::beginTransaction();

            foreach ($request->get("casillas") as $key => $value) {
                $array_insert[] =
                    [
                        'rc_id' => $value['rc_id'],
                        'empr_id' => $id,
                        'created_at' => date('Y-m-d h:i:s')
                    ];
            }

            DB::table('casillas_empresas')->insert($array_insert);
            DB::commit();

            return response()->json(['errors' =>  200], 200);
        } catch (Exception $e) {
            DB::rollBack();
            report($e);
            return response()->json(['errors' => $e, 'status' => 400], 400);
        }
    }


    public function save_addCasillaIdEmpresaId(Request $request)
    {

        try {
            $existeCasillaId = DB::table("casillas_empresas")
                ->where('rc_id', (int)$request->get('casilla_id'))
                ->where('empr_id', (int)$request->get('empresa_id'))->count();

            if ($existeCasillaId > 0)
                throw new Exception('Esta Casilla ya se encuentra registrada para usted');

            $casillas_empresa = new CasillasEmpresa();
            $casillas_empresa->empr_id      = $request->get('empresa_id');
            $casillas_empresa->rc_id      = $request->get('casilla_id');

            $casillas_empresa->save();

            DB::commit();

            return response()->json(['errors' =>  200], 200);
        } catch (Exception $e) {
            DB::rollBack();
            report($e);
            return response()->json(['errors' => $e->getMessage(), 'status' => 400], 400);
        }
    }
}
