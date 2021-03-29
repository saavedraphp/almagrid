<?php

namespace App\Http\Controllers;

use App\Producto;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductosController extends Controller
{

    
    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        //$this->foo = $foo;
    }


    public function index(Request $request)
    {
        if ($request) {
            $query    = trim($request->get('search'));
            //$productos = Producto::where('prod_nombre', 'LIKE', '%' . $query . '%')->orderBy('prod_nombre', 'asc')->paginate(10);

            $productos = DB::table('productos  as p')
            ->join('empresas as e','p.empr_id','=','e.empr_id')
            ->select('p.prod_nombre', 'p.prod_id',  'p.prod_nombre', 'p.prod_stock','p.prod_precio', 'e.empr_nombre',
            'p.created_at','p.deleted_at')->where('prod_nombre', 'LIKE', '%' . $query . '%')
            ->whereNull('p.deleted_at')
            ->orderBy('p.created_at', 'asc')
            ->paginate(10);





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
        
        $producto->empr_id          = $request->get('cbo_empresa');
        $producto->prod_nombre      = $request->get('producto');
        $producto->prod_codigo      = $request->get('codigo_producto');
        $producto->prod_sku         = $request->get('sku');
        $producto->prod_ean         = $request->get('ean');
        $producto->pres_id          = $request->get('cbo_presentacion');
        $producto->prod_lote         = $request->get('lote');
        $producto->prod_serie       = $request->get('serie');
        $producto->prod_precio  =   (float)$request->get('precio');
        $producto->prod_comentario  = $request->get('comentario');
        
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
        
        $producto->empr_id          = $request->get('cbo_empresa');
        $producto->prod_nombre      = $request->get('producto');
        $producto->prod_codigo      = $request->get('codigo_producto');
        $producto->prod_sku         = $request->get('sku');
        $producto->prod_ean         = $request->get('ean');
        $producto->pres_id          = $request->get('cbo_presentacion');
        $producto->prod_serie       = $request->get('serie');
        $producto->prod_lote         = $request->get('lote');
        $producto->prod_precio  =   $request->get('precio');
        $producto->prod_comentario  = $request->get('comentario');
        
        $producto->update();

        //return redirect('admin/productos');
        return redirect('admin/productos')->with('message','La operacion se realizo con Exito')->with('operacion','1');
    }


    public function destroy($id)
    {
        Producto::destroy($id);
        return redirect('admin/productos')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        //return redirect('admin/actas')->with('message','Datos cargados correctamente')->with('operacion','1');

    }



    

    public function ObtenerProductosEmpresa(Request $request)
    {
                        
        $productos = DB::table('productos  as p')
        
        ->select('p.prod_id','p.pres_id', 'p.prod_nombre',  'p.prod_lote','p.prod_stock', 'p.prod_fecha_vencimiento',
        'p.prod_stock as total')
        ->where('p.empr_id', '=',$request->empresa_id )
        ->orderBy('p.created_at', 'asc')->get();
 




           // $productos = Producto::where('empr_id', $request->empresa_id)->get();

            return $productos;

        
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


}
