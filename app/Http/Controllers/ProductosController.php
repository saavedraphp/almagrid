<?php

namespace App\Http\Controllers;
use App\Constants;
use App\Producto;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade as PDF;


class ProductosController extends Controller
{

    
    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        DB::enableQueryLog();

        //$this->foo = $foo;
    }


    public function index(Request $request)
    {
        DB::enableQueryLog();
        if ($request) {
            $query    = trim($request->get('search'));
            

            $productos = DB::table('productos_x_empresa  as p')
            ->join('empresas as e','p.empr_id','=','e.empr_id')
            ->leftJoin('unidad_medida as m','p.unidad_id','=','m.id')
            ->select('p.prod_sku', 'p.prod_codigo','m.unid_nombre','p.prod_nombre', 'p.prod_id',  'p.prod_nombre',
             'p.prod_stock','p.prod_precio', 'e.empr_nombre','p.prod_fecha_vencimiento',
            'p.created_at','p.deleted_at')
            ->where(function($query) use ($request){
                $query->where('prod_nombre', 'LIKE', '%' . $request->search . '%')
                ->orWhere('prod_sku', 'LIKE', '%' . $request->search . '%')
                ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
                })
            ->whereNull('p.deleted_at')
            ->orderBy('p.created_at', 'asc')
            ->paginate(Constants::NRO_FILAS);
        
            //dd(DB::getQueryLog());
            




            return view('productos.index', ['productos' => $productos, 'search' => $query]);

        }
    }



    public function create()
    {
        return view('productos.create');
    }
    
    

    public function store(Request $request)
    {
        $producto                   = new Producto();
        
        $producto->prod_nombre      = $request->get('producto');
        $producto->prod_sku         = $request->get('sku');
        $producto->unidad_id        = $request->get('cbo_presentacion');

        $producto->prod_peso        = (float)$request->get('peso');
        $producto->empr_id          = $request->get('cbo_empresa');
        $producto->prod_lote         = $request->get('lote');

        $producto->prod_fecha_vencimiento         = $request->get('fecha_vencimiento');
        $producto->prod_comentario  = $request->get('comentario');


        /*

        
        $producto->prod_serie       = $request->get('serie');
        $producto->prod_precio  =   (float)$request->get('precio');
        
        */
        $producto->save();

        //return redirect('admin/productos');
        return redirect('admin/productos')->with('message','La operacion se realizo con Exito')->with('operacion','1');
    }
    
    
    public function edit($id)
    {
        return view('productos.edit', ['producto' => Producto::findOrFail($id)]);
        
    }
    


    public function update(Request $request, $id)
    {
        $producto                   = Producto::findOrFail($id);
        
        $producto->prod_nombre      = $request->get('producto');        
        $producto->prod_sku         = $request->get('sku');
        $producto->unidad_id        = $request->get('cbo_presentacion');

        $producto->prod_peso        = (float)$request->get('peso');        
        $producto->empr_id          = $request->get('cbo_empresa');
        $producto->prod_lote         = $request->get('lote');

        $producto->prod_fecha_vencimiento         = $request->get('fecha_vencimiento');
        $producto->prod_comentario  = $request->get('comentario');

        


        /*
        $producto->prod_sku         = $request->get('sku');
        $producto->prod_ean         = $request->get('ean');
        $producto->pres_id          = $request->get('cbo_presentacion');
        $producto->prod_serie       = $request->get('serie');
        $producto->prod_lote         = $request->get('lote');
        $producto->prod_precio  =   $request->get('precio');
        */
        
        $producto->update();

        //return redirect('admin/productos');
        return redirect('admin/productos')->with('message','La operacion se realizo con Exito')->with('operacion','1');
    }


    public function destroy($id)
    {
        Producto::destroy($id);
        return redirect('admin/productos')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        

    }



    

    public function ObtenerProductosEmpresa(Request $request)
    {
                        
        $productos = DB::table('productos_x_empresa  as p')
        
        ->select('p.prod_id','p.unidad_id', 'p.prod_nombre',  'p.prod_lote','p.prod_stock', 'p.prod_fecha_vencimiento',
        'p.prod_stock as total')
        ->where('p.empr_id', '=',$request->empresa_id )
        ->orderBy('p.prod_nombre', 'asc')->get();
 




           // $productos = Producto::where('empr_id', $request->empresa_id)->get();

            return $productos;

        
    }
    

    public function getTotalProductosLotes(Request $request)
    {
                        
        $totalProductoPorLote = DB::table('lote_x_producto')
        ->select('cantidad')
        ->where('lote_id', '=',$request->lote_id )
        ->where('prod_id', '=',$request->producto_id )->value('cantidad');
        //dd($totalProductoPorLote);


         return (int)$totalProductoPorLote;

        
    }


    public function xs(Request $request)
    {
        if ($request->ajax()) {
            $estados     = Producto::where('empr_id', $request->empresa_id)->get();
            $estadoArray = array();
            foreach ($estados as $estado) {
                $estadoArray[$estado->id] = $estado->nombre;
            }

            return response()->json($estadoArray);
        }
        
    }

    public function pdfListaProducto( Request $request)
    {
        if($request->search=='null')
        $request->search ="";
        $productos = DB::table('productos_x_empresa  as p')
        ->join('empresas as e','p.empr_id','=','e.empr_id')
        ->leftJoin('unidad_medida as m','p.unidad_id','=','m.id')
        ->select('p.prod_sku', 'p.prod_codigo','m.unid_nombre','p.prod_nombre', 'p.prod_id',  'p.prod_nombre',
         'p.prod_stock','p.prod_precio', 'e.empr_nombre','p.prod_fecha_vencimiento',
        'p.created_at','p.deleted_at')
        ->where(function($consulta) use ($request){
            $consulta->where('prod_nombre', 'LIKE', '%' . $request->search . '%')
            ->orWhere('prod_sku', 'LIKE', '%' . $request->search . '%')
            ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
            })
        ->whereNull('p.deleted_at')
        ->orderBy('p.created_at', 'asc')
        ->paginate(25);

        $pdf = PDF::loadView('pdf.productos',['productos'=>$productos,'consulta'=>$request->search]);
        
        
        return $pdf->download('Productos-'.rand(1,1000).'.pdf');
        
    }



}
