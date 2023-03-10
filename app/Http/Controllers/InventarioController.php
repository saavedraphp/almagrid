<?php
namespace App\Http\Controllers;

use Maatwebsite\Excel\Facades\Excel;

use App\Exports\KardexExport;
use Maatwebsite\Excel\Concerns\Exportable;

use App\Empresa;
use App\Producto;
use App\Kardex;
use Auth;
use Exception;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;
 
class InventarioController extends Controller
{
    
    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        DB::enableQueryLog();
    }


    public function kardexPorProductoId($id)
    {
        if ($id>0) {

            $producto = Producto::findOrFail($id);
            
            $search  =  $producto->prod_id;
            $empresa = Empresa::findOrFail($producto->empr_id);
            
            $kardex = DB::table('kardex as k')
                    ->leftJoin('actas as a','k.acta_id','=','a.acta_id')
                    ->leftJoin('tipo_movimiento as tm','a.tm_codigo','=','tm.tm_codigo')
                    ->leftJoin('racks_casillas as rc', 'rc.rc_id', '=', 'k.rc_id')
                    ->leftJoin('racks as r', 'rc.rack_id', '=', 'r.rack_id')
                    ->select(
                        'k.kard_id',
                        'k.created_at',
                        'tm.tm_codigo',
                        'tm.tm_nombre',
                        'tm.tm_movimiento',
                        'k.kard_cantidad',
                        'a.acta_comentario',
                        'rc.rc_nombre',
                        'r.rack_nombre')
                    ->whereNull('k.deleted_at')
                    ->where("prod_id",$producto->prod_id)->paginate(10);
            
            //dd(DB::getQueryLog());

            return view('inventario.kardex_por_producto', ['producto' => $producto,'empresa' => $empresa,'kardex' => $kardex,'search' => $search]);

        }
    }


    public function downloadKardexProductoId($id)
    { 
        if ($id>0) {

            $producto = Producto::findOrFail($id);
            
            $search  =  $producto->prod_id;
            $empresa = Empresa::findOrFail($producto->empr_id);
            
            $kardex = DB::table('kardex as k')
                    ->select('k.kard_id','tm.tm_movimiento','k.kard_cantidad',DB::raw("concat(rack_nombre,' - ',rc_nombre) AS ubicacion"),'k.created_at')
                    ->leftJoin('actas as a','k.acta_id','=','a.acta_id')
                    ->leftJoin('tipo_movimiento as tm','a.tm_codigo','=','tm.tm_codigo')
                    ->leftJoin('racks_casillas as rc', 'rc.rc_id', '=', 'k.rc_id')
                    ->leftJoin('racks as r', 'rc.rack_id', '=', 'r.rack_id')
                    ->where("prod_id",$producto->prod_id)
                    ->whereNull('k.deleted_at')->get();
            
            
            
            //return (new KardexExport($kardex))->download('kardexProducto.tsv', \Maatwebsite\Excel\Excel::TSV);


            return Excel::download(new KardexExport($kardex),'kardex - '.$producto->prod_sku.'-'.$producto->prod_nombre.'-'.date('Y-m-d').'.xlsx');
 

 
        }
    }      
  



}
