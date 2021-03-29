<?php

namespace App\Http\Controllers;


use App\Acta;
use App\Kardex;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;


class ActaController extends Controller
{

    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        //$this->foo = $foo;
    }


    


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $request)
    {

 

        if ($request) {
            
            DB::enableQueryLog();
            $query    = trim($request->get('search'));
            //$actas = Acta::where('acta_numero_ingr_sali', 'LIKE', '%' . $query . '%')->orderBy('acta_numero_ingr_sali', 'asc')->paginate(10);
            
            if(strlen($query)>0)
            {
                $actas = DB::table('actas  as a')
                ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
                ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
                ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
                'acta_numero_ingr_sali', 'a.serv_id', 
                'a.created_at')->where('acta_numero_ingr_sali', 'LIKE', '%' . $query . '%')->orderBy('a.created_at', 'asc')->paginate(10);
            }
            else
            {
                $actas = DB::table('actas  as a')
                ->leftJoin('tipo_documentos as td','a.tipo_docu_id','=','td.tipo_docu_id')
                ->leftJoin('empresas as e','a.empr_id','=','e.empr_id')
                ->select('a.acta_id', 'a.tipo_docu_id',  'a.empr_id', 'e.empr_nombre','td.tipo_docu_nombre','a.acta_costo',
                'acta_numero_ingr_sali', 'a.serv_id', 
                'a.created_at')->orderBy('a.created_at', 'asc')->paginate(10);

            }
            //echo $actas;  
            //dd(DB::getQueryLog());

            //dd($actas->toSql());
            //dd($actas);
            return view('actas.index', ['actas' => $actas, 'search' => $query]);

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

        return view('actas.create');
    }




    public function create_despacho()
    {

 
        return view('actas.create_despacho');
    }





    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


        try {


            
        $acta = new Acta();
        $acta->empr_id =                  $request->get('cbo_empresa');
        $acta->serv_id =                  1;  // ALMACENAMIENTO  $request->get('tipo_servicio');
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
                     'kard_cantidad' => $cantidad[$key],
                     'created_at' => date('Y-m-d H:i:s')    

                     ];
                    
                     $query = "update productos set prod_stock = (prod_stock + ".$cantidad[$key].") where  prod_id = ".$value;
                     $resul = DB::update($query);
    
                    }

                }
                Kardex::insert($answers);
        }

 
        
        return redirect('admin/actas')->with('message','Datos cargados correctamente')->with('operacion','1');

        } catch (Exception $e) {
            report($e);
            return redirect('admin/actas')->with('message','Se encontro un error inesperado en la operación<br>'.$e)->with('operacion','0');
            return false;
        }        
            
 
     
    } //FIN STORE
 






    public function store_despacho(Request $request)
    {


        try {


            
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
                     'kard_cantidad' => $cantidad[$key],
                     'created_at' => date('Y-m-d H:i:s')    

                     ];
                    
                     $query = "update productos set prod_stock = (prod_stock - ".$cantidad[$key].") where  prod_id = ".$value;
                     $resul = DB::update($query);
    
                    }

                }
                Kardex::insert($answers);
        }

 
        
        return redirect('admin/actas')->with('message','Datos cargados correctamente')->with('operacion','1');

        } catch (Exception $e) {
            report($e);
            return redirect('admin/actas')->with('message','Se encontro un error inesperado en la operación<br>'.$e)->with('operacion','0');
            return false;
        }        
            
 
     
    } // end store_despacho







    public function show($id)
    {
       $acta = DB::table('actas as a')
       ->join('servicios as s', 's.serv_id', '=', 'a.serv_id')
       ->where('a.acta_id', '=',$id)->first();
       
      // dd($acta);
       
       $detalles = DB::table('productos  as p')
       ->join('kardex as k', 'k.prod_id', '=', 'p.prod_id')
       ->select('p.prod_id','p.pres_id', 'p.prod_nombre',  'p.prod_lote','p.prod_stock', 'p.prod_fecha_vencimiento',
       'k.kard_cantidad', 'p.prod_stock as total')
       ->where('k.acta_id', '=',$id )
       ->orderBy('p.created_at', 'asc')->get();

       


        switch ($acta->serv_codigo) {
            case 'ALMACE':
                $array_titulos = [
                    'CABECERA'=>'Adicionar Productos',
                    'TAB'   =>'Registro de Productos'
                ];
                
                break;
            
            case 'DESPAC':
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

        return redirect('admin/actas');

        
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


    

    public function reporteRecepcionPdf($id)
    {

        $acta = Acta::findOrFail(5)->get();
        echo 'enrto';
        //return redirect('admin/actas');
        /*
        
        $detalles = DB::table('productos  as p')
        ->join('kardex as k', 'k.prod_id', '=', 'p.prod_id')
        ->select('p.prod_id','p.pres_id', 'p.prod_nombre',  'p.prod_lote','p.prod_stock', 'p.prod_fecha_vencimiento',
        'k.kard_cantidad', 'p.prod_stock as total')
        ->where('k.acta_id', '=',$id )
        ->orderBy('p.created_at', 'asc')->get();
 
         //return view('actas.show',  ['acta' => $acta, 'detalles'=> $detalles]);  
 
        $pdf = PDF::loadView('pdf.recepcion',compact('acta','detalles'));

        return $pdf->download('reporte_recepcion.pdf');
        */
    }



    public function pdfReporteRecepcion($id)
    {

   
        
 
        
        //$acta = Acta::findOrFail($id);

        $acta = DB::table('actas  as a')
        ->join('empresas as e', 'a.empr_id', '=', 'e.empr_id')
        ->join('tipo_documentos as t', 't.tipo_docu_id', '=', 'a.tipo_docu_id')
        ->select('a.acta_id','a.created_at','e.empr_nombre','t.tipo_docu_nombre','a.acta_numero_ingr_sali')
        ->where('a.acta_id', '=',$id )->get();
        
 
        $detalles = DB::table('productos  as p')
        ->join('kardex as k', 'k.prod_id', '=', 'p.prod_id')
        ->leftJoin('presentaciones as pp', 'pp.pres_id', '=', 'p.pres_id')
        ->select('pp.pres_nombre', 'p.prod_id','p.pres_id', 'p.prod_nombre',  'p.prod_lote','prod_serie','prod_codigo','p.prod_stock', 'p.prod_fecha_vencimiento',
        'k.kard_cantidad', 'p.prod_stock as total')
        ->where('k.acta_id', '=',$id )
        ->orderBy('p.created_at', 'asc')->get();
 
 
        $pdf = PDF::loadView('pdf.recepcion',['acta'=>$acta,'detalles'=>$detalles]);
        

        return $pdf->download('user-list.pdf');
      
    }





}
