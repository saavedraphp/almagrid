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

    public function __constructor()
    {
                // LSL PARA LA VALIDACION
                $this->middleware('auth');
     }


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
            ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tm_codigo')
            ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre',
            'a.acta_costo','a.acta_numero_ingr_sali', 'a.tm_codigo', 'tm.tm_codigo', 
            'a.acta_sub_cliente', 'a.created_at')
            ->where('tm.tm_codigo', '=', 'CAMBI_UBIC')
            ->where(function($query) use ($request){
                $query->where('empr_nombre', 'LIKE', '%' . $request->search . '%')
                ->orWhere('a.acta_sub_cliente', 'LIKE', '%' . $request->search . '%')
                ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
                })
            ->whereNull('a.deleted_at')
            ->orderBy('a.created_at', 'desc')->paginate(Constants::NRO_FILAS);
            $busqueda = 'nro_documento';
            $query = $request->get('nro_documento');
            dd(DB::getQueryLog());

             
        }
        else
        {           
         $actas = DB::table('actas  as a')
        ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
        ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
        ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tm_codigo')
        ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
        'acta_numero_ingr_sali', 'a.tm_codigo',
        'tm.tm_codigo','tm_nombre','tm_movimiento', 'a.acta_sub_cliente', 'a.created_at')
        ->where('tm.tm_codigo', '=', 'CAMUBISALI')
        ->orWhere('tm.tm_codigo', '=', 'CAMUBIINGR')
        ->whereNull('a.deleted_at')
        ->orderBy('a.created_at', 'desc')->paginate(Constants::NRO_FILAS);

        //dd(DB::getQueryLog());

        }

            //echo $actas;  

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




    public function store(Request $request)
    {



        try {

            /****************************************************************/
            /********************** REGISTRA LA SALIDA   ********************/
            /****************************************************************/

            DB::beginTransaction();
    
            /********************** REGISTRA ACTA SALIDA  *******************/
            $acta = new Acta();
            $acta->empr_id =                  $request->get('cbo_empresa');
            $acta->tm_codigo =                  'CAMUBISALI';  // CAMBIO DE UBICACION SALIDA
            //  $acta->acta_encargado_id =        $request->get('cbo_empresa');
            //  $acta->acta_supervisor_id =        $request->get('cbo_empresa');
            $acta->acta_comentario =        $request->get('comentario');        
            
            $acta->save();
     
            


            /********************** REGISTRA LA SALIDA KARDEX  **************/

     
            $kardex_salida = new Kardex();

            $items = $request->get('prod_id');
            $cantidad = $request->get('cantidad');
            $lote = $request->get('lote');
            $casillas_salida = $request->get('rc_id');
            $rc_id_destino = $request->get('rc_id_destino');
            
            if($request->get('cantidad') !==null )
            {
                foreach ($items  as $key => $value) 
                    {
                        if($cantidad[$key] > 0 )
                        {
                         $sql_salida[] = [
                         'acta_id' => $acta->acta_id,
                         'prod_id' => $value,
                         'lote_id' => $lote[$key],
                         'rc_id' => $casillas_salida[$key],
                         'kard_cantidad' => -$cantidad[$key], // REGISTRA LA SALIDA
                         'created_at' => date('Y-m-d H:i:s')
    
                         ];
                        
                         /************ ACTUALIZAR CANTIDAD PRODUCTOS*/
                         $query = "update productos_x_empresa set prod_stock = (prod_stock - ".$cantidad[$key].") where  prod_id = ".$value;
                         $resul = DB::update($query);

                         /************ ACTUALIZAR CANTIDAD PRODUCTOS X LOTE*/
                         $query_lote = "update lote_x_producto set cantidad = (cantidad - ".$cantidad[$key]."),
                         updated_at =  '".date('Y-m-d H:i:s')."' where  prod_id = ".$value." and lote_id = ".$lote[$key];
                         DB::update($query_lote);                         
        
                        }
    
                    }
                    $kardex_salida::insert($sql_salida);
                    
            }


              /* FIN SALIDA  */



            /****************************************************************/
            /********************** REGISTRA LA INGRESO  ********************/
            /****************************************************************/



            /********************** REGISTRA ACTA INGRESO  *******************/
 
            $acta_ingreso = new Acta();
            $acta_ingreso->empr_id =                  $request->get('cbo_empresa');
            $acta_ingreso->tm_codigo =                  'CAMUBIINGR';  
             //  $acta->acta_encargado_id =        $request->get('cbo_empresa');
            //  $acta->acta_supervisor_id =        $request->get('cbo_empresa');
            $acta_ingreso->acta_comentario =        $request->get('comentario');
            $acta_ingreso->estado_asignacion =        'REALIZADO';
            $acta_ingreso->referencia_id =        $acta->acta_id;


            $acta_ingreso->save();



            /******************************************************/
            /********************** INSERT KARDEX INGRESO**********/
            /******************************************************/
            $kardex_ingreso = new Kardex();

 

            if ($request->get('cantidad') !== null) {
                foreach ($items  as $key => $value) {
                    if ($cantidad[$key] > 0) {
                        $sql_ingreso[] = [
                            'acta_id' => $acta_ingreso->acta_id,
                            'prod_id' => $value,
                            'lote_id' => $lote[$key],
                            'kard_cantidad' => $cantidad[$key],
                            'rc_id' => $rc_id_destino[$key],
                            'created_at' => date('Y-m-d H:i:s')

                        ];

                        $query = "update productos_x_empresa set prod_stock = (prod_stock + " . $cantidad[$key] . ") where  prod_id = " . $value;
                        $resul = DB::update($query);


                        /*********** VERIFICA  SI EXISTE PRODUCTO X LOTE =>  INSERT O UPDATE******* */
                        $existe_producto_lote = DB::table('lote_x_producto')
                            ->where('prod_id', '=', $value)
                            ->where('lote_id', '=', $lote[$key])->count();

                        if ($existe_producto_lote == 0) {
                            $query_lote = "insert into lote_x_producto  (lote_id, prod_id, cantidad,created_at)
                         values(" . $lote[$key] . ", " . $value . " , " . $cantidad[$key] . ",'" . date('Y-m-d H:i:s') . "')";
                            DB::insert($query_lote);
                        } else {
                            $query_lote = "update lote_x_producto set cantidad = (cantidad + " . $cantidad[$key] . "),
                        updated_at =  '" . date('Y-m-d H:i:s') . "' where  prod_id = " . $value . " and lote_id = " . $lote[$key];
                            DB::update($query_lote);
                        }
                    }
                }
                $kardex_ingreso::insert($sql_ingreso);
            }


            DB::commit();
            return redirect('admin/cambio-ubicacion')->with('message', 'Datos cargados correctamente')->with('operacion', '1');
        } catch (Exception $e) {
            DB::rollBack();
            report($e);
            return redirect('admin/cambio-ubicacion')->with('message', 'Se encontro un error inesperado en la operación<br>' . $e)->with('operacion', '0');
        }
    } //FIN STORE


}
