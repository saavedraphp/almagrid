<?php

namespace App\Http\Controllers;


use App\Acta;
use App\Kardex;
use App\Producto;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;


class RecepcionController extends Controller
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
        if ($request) {
           
            
            $query    = trim($request->get('search'));


            if(strlen($query)>0)
            { 
                $actas = DB::table('actas  as a')
                ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
                ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
                ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
                'a.acta_numero_ingr_sali', 'a.tipo_movimiento_codigo', 
                's.serv_nombre','a.acta_sub_cliente', 'a.created_at')->where('empr_nombre', 'LIKE', '%' . $query . '%')
                ->whereNull('a.deleted_at')
                ->orderBy('a.created_at', 'desc')->paginate(10);
                $busqueda = 'nombre';


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
                ->where('tm.tm_codigo', '=', 'INGRESO')
                ->whereNull('a.deleted_at')
                ->orderBy('a.created_at', 'desc')->paginate(10);

                switch ($request->get('rbo_lista')) {
                    case 'DESPAC':
                        $actas = DB::table('actas  as a')
                        ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
                        ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
                        ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
                        ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
                        'acta_numero_ingr_sali', 'a.serv_id',  'a.acta_sub_cliente', 'tm.tm_codigo', 
                        'a.created_at')
                        ->where('tm.tm_codigo', '=', 'DESPAC')
                        ->whereNull('a.deleted_at')
                        ->orderBy('a.created_at', 'desc')->paginate(10);
                        $busqueda = 'DESPAC';
                        $query = 'Despacho';
                        
                        break;

                        case 'ALMACE':
                            $actas = DB::table('actas  as a')
                            ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
                            ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
                            ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
                            ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
                            'acta_numero_ingr_sali', 'a.serv_id', 
                            'tm.tm_codigo', 'a.acta_sub_cliente' , 'a.created_at')
                            ->where('tm.tm_codigo', '=', 'ALMACE')
                            ->whereNull('a.deleted_at')
                            ->orderBy('a.created_at', 'desc')->paginate(10);
                            $busqueda = 'ALMACE';
                            $query = 'Almacenamiento';
                        break;                        
                    
                        case 'ALL':
                            $actas = DB::table('actas  as a')
                            ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
                            ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
                            ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
                            ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
                            'acta_numero_ingr_sali', 'a.tipo_movimiento_codigo' , 'a.acta_sub_cliente',  'tm.tm_codigo',
                            'a.created_at')
                            ->whereNull('a.deleted_at')
                            ->orderBy('a.created_at', 'desc')->paginate(10);
                            $busqueda = 'ALL';
                            $query = 'Todos';
                        break;
                        
                }
                $nro_documento = trim($request->get('nro_documento'));

                if(strlen($nro_documento)>0)
                {  
                    $actas = DB::table('actas  as a')
                    ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
                    ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
                    ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
                    ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
                    'a.acta_numero_ingr_sali', 'a.tipo_movimiento_codigo', 'tm.tm_codigo', 'a.acta_sub_cliente', 'a.created_at')
                    ->where('tm.tm_codigo', '=', 'INGRESO')
                    ->where('a.acta_numero_ingr_sali','=',$nro_documento)
                    ->whereNull('a.deleted_at')
                    ->orderBy('a.created_at', 'desc')->paginate(10);
                    $busqueda = 'nro_documento';
                    $query = $request->get('nro_documento');
                    //dd($actas->toSql());

                     
                }
                

            }
            //echo $actas;  
           // dd(DB::getQueryLog());

            //dd($actas->toSql());
            //dd($actas);
            return view('actas.index', ['actas' => $actas, 'search' => $query,'busqueda' =>$busqueda]);

        }
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

/*
        $productos = DB::table('productos  as p')
        ->leftJoin('stock as td','a.tipo_docu_id','=','td.tipo_docu_id')
        ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo', 
        'a.created_at')->where('acta_numero_ingr_sali', 'LIKE', '%' . $query . '%')->orderBy('a.created_at', 'asc')->paginate(10);
*/
        
        $lotes = DB::table('lotes')->get();
        //var_dump($lotes);
        

        return view('actas.create',['lotes' => $lotes]);
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
        $acta->tipo_movimiento_codigo =                  'INGRESO';  // ALMACENAMIENTO  $request->get('tipo_servicio');
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
                     'tipo_movimiento' => 'INGRESO',// INGRESO
                     'kard_cantidad' => $cantidad[$key]

                     ];
                    
                     $query = "update productos_x_empresa set prod_stock = (prod_stock + ".$cantidad[$key].") where  prod_id = ".$value;
                     $resul = DB::update($query);

 
                    /*********** VERIFICA  SI EXISTE PRODUCTO X LOTE =  INSERT O UPDATE******* */
                     $existe_producto_lote = DB::table('lote_x_producto')
                     ->where('prod_id', '=', $value)
                     ->where('lote_id' ,'=', $lote[$key])->count();

                    if($existe_producto_lote==0)
                    {
                        $query_lote = "insert into lote_x_producto  (lote_id, prod_id, cantidad,created_at)
                         values(".$lote[$key].", ".$value." , ".$cantidad[$key].",'".date('Y-m-d H:i:s')."')";
                        DB::insert($query_lote);

                    }
                    else
                    {
                        $query_lote = "update lote_x_producto set cantidad = (cantidad + ".$cantidad[$key]."),
                        updated_at =  '".date('Y-m-d H:i:s')."' where  prod_id = ".$value." and lote_id = ".$lote[$key];
                        DB::update($query_lote);

                    }

    
                    }


                }
                Kardex::insert($answers);
                
        }

 
        DB::commit();
        return redirect('admin/recepcion')->with('message','Datos cargados correctamente')->with('operacion','1');

        } catch (Exception $e) {
         DB::rollBack();    
            report($e);
            return redirect('admin/recepcion')->with('message','Se encontro un error inesperado en la operación<br>'.$e)->with('operacion','0');

        }        
            
 
     
    } //FIN STORE
 






    public function store_despacho(Request $request)
    {
        

        try {

        DB::beginTransaction();
            
        $acta = new Acta();
        $acta->empr_id =                  $request->get('cbo_empresa');
        $acta->serv_id =                  2; //$request->get('tipo_servicio');
        $acta->acta_sub_cliente =              $request->get('sub_cliente');
        $acta->tipo_docu_id =           $request->get('tipo_documento');
        $acta->acta_numero_ingr_sali =         $request->get('nro_documento');
        //  $acta->acta_encargado_id =        $request->get('cbo_empresa');
        //  $acta->acta_supervisor_id =        $request->get('cbo_empresa');
        $acta->acta_costo =        $request->get('precio');
        $acta->acta_comentario =        $request->get('comentario');        

        $acta->save();
 
        
        $kardex = new Kardex;


        $items = $request->get('prod_id');
        $cantidad = $request->get('cantidad');
        
        if($request->get('cantidad') !==null )
        {
            foreach ($items  as $key => $value) 
                {
                    if($cantidad[$key] > 0 )
                    {
                     $answers[] = [
                     'acta_id' => $acta->acta_id,
                     'prod_id' => $value,
                     'kard_cantidad' => -$cantidad[$key],
                     'created_at' => date('Y-m-d H:i:s')    

                     ];
                    
                     $query = "update productos set prod_stock = (prod_stock - ".$cantidad[$key].") where  prod_id = ".$value;
                     $resul = DB::update($query);
    
                    }

                }
            Kardex::insert($answers);
        }

        DB::commit();

        return redirect('admin/recepcion')->with('message','Datos cargados correctamente')->with('operacion','1');

        } catch (Exception $e) {
            DB::rollBack();    
            
            report($e);
            return redirect('admin/recepcion')->with('message','Se encontro un error inesperado en la operación<br>'.$e)->with('operacion','0');
            
        }        
            
 
     
    } // end store_despacho







    public function show($id)
    {
       $acta = DB::table('actas as a')
       ->leftJoin('tipo_movimiento as tm','tm.tm_codigo','=','a.tipo_movimiento_codigo')
       ->where('a.acta_id', '=',$id)->first();
       
      // dd($acta);
       
       $detalles = DB::table('productos_x_empresa  as p')
       ->join('kardex as k', 'k.prod_id', '=', 'p.prod_id')
       ->select('p.prod_id','p.unidad_id', 'p.prod_nombre',  'p.prod_lote','p.prod_stock', 'p.prod_fecha_vencimiento',
       'k.kard_cantidad', 'p.prod_stock as total')
       ->where('k.acta_id', '=',$id )
       ->orderBy('p.created_at', 'asc')->get();

       


        switch ($acta->tipo_movimiento_codigo) {
            case 'INGRESO':
                $array_titulos = [
                    'CABECERA'=>'Adicionar Productos',
                    'TAB'   =>'Registro de Productos'
                ];
                
                break;
            
            case 'DESPACHO':
                $array_titulos = [
                    'CABECERA'=>'Registro de Despacho',
                    'TAB'   =>'Despacho de Productos'
                ];

                break;
                                
            default:
                # code...
                break;
        }


       // dd($array_titulos);


        return view('actas.show',  ['acta' => $acta, 'detalles'=> $detalles, 'array_titulos' =>$array_titulos]);    
    }






    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('actas.edit', ['acta' => Acta::findOrFail($id)]);
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
        
        $acta =                           Acta::findOrfail($id);

        $acta->empr_id =                  $request->get('cbo_empresa');
        //$acta->serv_id =                  $request->get('tipo_servicio');
        $acta->acta_sub_cliente =              $request->get('sub_cliente');
        $acta->tipo_docu_id =           $request->get('tipo_documento');
        $acta->acta_numero_ingr_sali =         $request->get('nro_documento');
    //        $acta->acta_encargado_id =        $request->get('cbo_empresa');
    //      $acta->acta_supervisor_id =        $request->get('cbo_empresa');
        $acta->acta_costo =        $request->get('precio');
        $acta->acta_comentario =        $request->get('comentario');        

        $acta->update();

        return redirect('admin/recepcion');

        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $kardexs = Kardex::where('acta_id','=', $id)->get();

        //dd($kardexs);

        foreach ($kardexs as $kardex) {
            //dd($kardex->prod_id);
           $producto = DB::table('productos_x_empresa as p')->where('p.prod_id', '=', $kardex->prod_id)->first();
           //$producto = Producto::find($kardex->prod_id);
            //dd(DB::getQueryLog());


           //dd($producto);
           $query = "update productos_x_empresa set prod_stock = (prod_stock - ".$producto->prod_stock.") where  prod_id = ".$kardex->prod_id;

  
           $resul = DB::update($query);
                    
            // $producto->prod_stock = $producto->prod_stock -  $kardex->kard_cantidad;
            // $producto->update();
            
            //eliminar los registro karex
            $kardex->destroy($kardex->kard_id);
        }

        Acta::destroy($id);
        return redirect('admin/recepcion')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        

    }


    

 



    public function pdfReporteRecepcion($id)
    {

   
        
 
        
        //$acta = Acta::findOrFail($id);

        $acta = DB::table('actas  as a')
        ->join('empresas as e', 'a.empr_id', '=', 'e.empr_id')
        ->leftJoin('tipo_documentos as t', 't.tipo_docu_id', '=', 'a.tipo_docu_id')
        ->leftJoin('servicios as s', 's.serv_id', '=', 'a.serv_id')
        ->select('a.acta_id','a.created_at','e.empr_nombre','t.tipo_docu_nombre','a.acta_numero_ingr_sali',
        's.serv_nombre')
        ->where('a.acta_id', '=',$id )->get();
        
 
        $detalles = DB::table('productos  as p')
        ->join('kardex as k', 'k.prod_id', '=', 'p.prod_id')
        ->leftJoin('presentaciones as pp', 'pp.pres_id', '=', 'p.pres_id')        
        ->select('pp.pres_nombre', 'p.prod_id','p.pres_id', 'p.prod_nombre',  'p.prod_lote','prod_serie','prod_codigo','p.prod_stock', 'p.prod_fecha_vencimiento',
        'k.kard_cantidad', 'p.prod_stock as total')
        ->where('k.acta_id', '=',$id )
        ->orderBy('p.created_at', 'asc')->get();
 
        

        $pdf = PDF::loadView('pdf.recepcion',['acta'=>$acta,'detalles'=>$detalles]);
        

        return $pdf->download('Acta - '.$id.'.pdf');
      
    }





}
