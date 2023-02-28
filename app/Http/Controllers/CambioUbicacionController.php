<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Constants;
use App\Acta;
use App\Kardex;
use App\Producto;
use Exception;
use Illuminate\Support\Facades\DB;


class CambioUbicacionController extends Controller
{



    public function index(Request $request)
    {
            
        $busqueda ="";
        $query ="";
        $nro_documento = trim($request->get('search'));

        if(strlen($nro_documento)>0)
        {  
            $actas = DB::table('actas  as a')
            ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
            ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
            ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
            ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre',
            'a.acta_costo','a.acta_numero_ingr_sali', 'a.tipo_movimiento_codigo', 'tm.tm_codigo', 
            'a.acta_sub_cliente', 'a.created_at')
            ->where('tm.tm_codigo', '=', 'DESPACHO')
            ->where(function($query) use ($request){
                $query->where('empr_nombre', 'LIKE', '%' . $request->search . '%')
                ->orWhere('a.acta_sub_cliente', 'LIKE', '%' . $request->search . '%')
                ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
                })
            ->whereNull('a.deleted_at')
            ->orderBy('a.created_at', 'desc')->paginate(Constants::NRO_FILAS);
            $busqueda = 'nro_documento';
            $query = $request->get('nro_documento');
            //dd($actas->toSql());

             
        }
        else
        {           
             
        $actas = DB::table('actas  as a')
        ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
        ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
        ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
        ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
        'acta_numero_ingr_sali', 'a.tipo_movimiento_codigo',
        'tm.tm_codigo', 'a.acta_sub_cliente', 'a.created_at')
        ->where('tm.tm_codigo', '=', 'DESPACHO')
        ->whereNull('a.deleted_at')
        ->orderBy('a.created_at', 'desc')->paginate(Constants::NRO_FILAS);
        }

            //echo $actas;  
           // dd(DB::getQueryLog());

            //dd($actas->toSql());
            //dd($actas);
            return view('traslado.index', ['actas' => $actas, 'search' => $query,'busqueda' =>$busqueda]);



    }



    public function create()
    {
        $lotes = DB::table('lotes')->get();
        //var_dump($lotes);
        

        return view('traslado.create',['lotes' => $lotes]);
    }    

}
