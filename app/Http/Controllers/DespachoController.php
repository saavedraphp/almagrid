<?php

namespace App\Http\Controllers;
use App\Acta;
use App\Kardex;
use App\Producto;
use Exception;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class DespachoController extends Controller
{


    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        //$this->foo = $foo;
        DB::enableQueryLog();

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
            
        $busqueda ="";
        $query ="";
        $nro_documento = trim($request->get('nro_documento'));

        if(strlen($nro_documento)>0)
        {  
            $actas = DB::table('actas  as a')
            ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
            ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
            ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
            ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
            'a.acta_numero_ingr_sali', 'a.tipo_movimiento_codigo', 'tm.tm_codigo', 'a.acta_sub_cliente', 'a.created_at')
            ->where('tm.tm_codigo', '=', 'DESPACHO')
            ->where('a.acta_numero_ingr_sali','=',$nro_documento)
            ->whereNull('a.deleted_at')
            ->orderBy('a.created_at', 'desc')->paginate(10);
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
        ->orderBy('a.created_at', 'desc')->paginate(10);
        }

            //echo $actas;  
           // dd(DB::getQueryLog());

            //dd($actas->toSql());
            //dd($actas);
            return view('despacho.index', ['actas' => $actas, 'search' => $query,'busqueda' =>$busqueda]);



    }




    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $lotes = DB::table('lotes')->get();
        //var_dump($lotes);
        

        return view('despacho.create',['lotes' => $lotes]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         // Start transaction


         try {

            DB::beginTransaction();
    
            $acta = new Acta();
            $acta->empr_id =                  $request->get('cbo_empresa');
            $acta->tipo_movimiento_codigo =                  'DESPACHO';  // DESPACHO
            $acta->acta_sub_cliente =              $request->get('sub_cliente');
            $acta->tipo_docu_id =           $request->get('tipo_documento');
            $acta->acta_numero_ingr_sali =         $request->get('nro_documento');
            //  $acta->acta_encargado_id =        $request->get('cbo_empresa');
            //  $acta->acta_supervisor_id =        $request->get('cbo_empresa');
            $acta->acta_comentario =        $request->get('comentario');        
    
            $acta->save();
     
            
            $kardex = new Kardex;
    
            /******************************************************/
            /********************** INSERT KARDEX  ****************/
            /******************************************************/
    
    
            $items = $request->get('prod_id');
            $cantidad = $request->get('cantidad');
            $lote = $request->get('lote');
            
            if($request->get('cantidad') !==null )
            {
                foreach ($items  as $key => $value) 
                    {
                        if($cantidad[$key] > 0 )
                        {
                         $answers[] = [
                         'acta_id' => $acta->acta_id,
                         'prod_id' => $value,
                         'lote_id' => $lote[$key],
                         'tipo_movimiento' => 'DESPACHO',
                         'kard_cantidad' => $cantidad[$key]
    
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
                    Kardex::insert($answers);
                    
            }
    
     
            DB::commit();
            return redirect('admin/despacho')->with('message','Datos cargados correctamente')->with('operacion','1');
    
            } catch (Exception $e) {
             DB::rollBack();    
                report($e);
                return redirect('admin/despacho')->with('message','Se encontro un error inesperado en la operación<br>'.$e)->with('operacion','0');
    
            }        
                
            /* FIN STORE */
    }




    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
