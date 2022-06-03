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
                    ->where("prod_id","=",$producto->prod_id)->paginate(10);
            
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
            
            $kardex = DB::table('kardex as k')->select('k.acta_id','tipo_movimiento','kard_cantidad','k.created_at','lote_id')
                    ->leftJoin('actas as a','k.acta_id','=','a.acta_id')
                    ->where("prod_id","=",$producto->prod_id)->paginate(10);
            
            
            
            //return (new KardexExport($kardex))->download('kardexProducto.tsv', \Maatwebsite\Excel\Excel::TSV);


            return Excel::download(new KardexExport($kardex),'kardex-'.$producto->prod_nombre.'-'.$producto->prod_id.date('Y-m-d').'.xlsx');
 

 
        }
    }      
  



}
