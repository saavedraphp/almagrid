<?php

namespace App\Http\Controllers;

use App\Constants;
use App\Producto;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade as PDF;
use Exception;



use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ProductosExportExcel;

/*PARA PAGINAR EL ARRAY*/
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;



class ProductosController extends Controller
{


    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        DB::enableQueryLog();

        //$this->foo = $foo;
    }


    public function paginate($items, $perPage = 25, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }



    public function index(Request $request)
    {
        if ($request) {
            $query    = trim($request->get('search'));




            // EXISTE EN LA TABLA EMPRESA
            if ((int)session('empresa_id') > 0) {
                $productos = DB::table('productos_x_empresa  as p')
                    ->join('empresas as e', 'p.empr_id', '=', 'e.empr_id')
                    ->leftJoin('unidad_medida as m', 'p.unidad_id', '=', 'm.id')
                    ->select(
                        'p.prod_sku',
                        'p.prod_codigo',
                        'm.unid_nombre',
                        'p.prod_nombre',
                        'p.prod_id',
                        'p.prod_nombre',
                        'p.prod_stock',
                        'p.prod_precio',
                        'e.empr_nombre',
                        'p.prod_fecha_vencimiento',
                        'p.created_at',
                        'p.deleted_at'
                    )
                    ->where(function ($query) use ($request) {
                        $query->where('prod_nombre', 'LIKE', '%' . $request->search . '%')
                            ->orWhere('prod_sku', 'LIKE', '%' . $request->search . '%')
                            ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
                    })
                    ->where('e.empr_id', '=', session('empresa_id'))
                    ->whereNull('p.deleted_at')
                    ->orderBy('p.created_at', 'asc')->get()->toArray();
                //->paginate(Constants::NRO_FILAS);     

            } else {

                $productos = DB::table('productos_x_empresa  as p')
                    ->join('empresas as e', 'p.empr_id', '=', 'e.empr_id')
                    ->leftJoin('unidad_medida as m', 'p.unidad_id', '=', 'm.id')
                    ->select(
                        'p.prod_sku',
                        'p.prod_codigo',
                        'm.unid_nombre',
                        'p.prod_nombre',
                        'p.prod_id',
                        'p.prod_nombre',
                        'p.prod_stock',
                        'p.prod_precio',
                        'e.empr_nombre',
                        'p.prod_fecha_vencimiento',
                        'p.created_at',
                        'p.deleted_at'
                    )
                    ->where(function ($query) use ($request) {
                        $query->where('prod_nombre', 'LIKE', '%' . $request->search . '%')
                            ->orWhere('prod_sku', 'LIKE', '%' . $request->search . '%')
                            ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
                    })
                    ->whereNull('p.deleted_at')
                    ->orderBy('p.created_at', 'asc')->get()->toArray();
                //->paginate(Constants::NRO_FILAS);                
            }


            //dd($productos);


            foreach ($productos as $key => $value) {
                $racks_x_producto = "";
                //echo $value->prod_id.'<br>';

                if ($value->prod_stock > 0) {
                    $qury_racks = DB::select(DB::raw("select k.prod_id, r.rack_id, r.rack_nombre, k.rc_id, rc.rc_nombre FROM kardex k
                    inner join racks_casillas rc on k.rc_id = rc.rc_id
                    inner join racks r on rc.rack_id = r.rack_id
                    where prod_id = '$value->prod_id' and
                    k.deleted_at is  null
                    group by k.prod_id, r.rack_id, r.rack_nombre, k.rc_id, rc.rc_nombre"));
                    //dd($qury_racks);

                    $coma = "";
                    foreach ($qury_racks as $key_r => $value_r) {
                        $racks_x_producto .= $coma . $value_r->rack_nombre . ' - ' . $value_r->rc_nombre;
                        $coma = " ,";
                    }
                    // dd($value->prod_id.' - '.$racks_x_producto);
                    //echo $value->prod_id.' - '.$racks_x_producto."<br>";
                    $value->racks_casillas = $racks_x_producto;
                } else
                    //echo $value->prod_id.' racks= '.$racks_x_producto."<br>";
                    $value->racks_casillas = "";
            }
            //dd($productos);
            //exit;


            $productos = $this->paginate($productos);

            $productos->withPath('/admin/productos');
            return view('productos.index', ['productos' => $productos, 'search' => $query]);
        }
    }



    public function create()
    {
        return view('productos.create');
    }



    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $encontro = Producto::where("prod_sku", $request->get("sku"))->count();
            if ($encontro > 0) {
                return redirect('admin/productos')->with('message', 'El SKU' . $request->get("sku") . ' existe en la Base de Datos')->with('operacion', '0');
            } else {



                $producto                   = new Producto();

                $producto->prod_nombre      = $request->get('producto');
                $producto->prod_sku         = $request->get('sku');
                $producto->unidad_id        = $request->get('cbo_presentacion');

                $producto->prod_peso        = (float)$request->get('peso');
                $producto->empr_id          = $request->get('cbo_empresa');
                $producto->prod_lote         = $request->get('lote');

                $producto->prod_fecha_vencimiento         = $request->get('fecha_vencimiento');
                $producto->prod_comentario  = $request->get('comentario');

                $producto->save();
                DB::commit();
            }

            return redirect('admin/productos')->with('message', 'La operacion se realizo con Exito')->with('operacion', '1');
        } catch (Exception $e) {
            DB::rollBack();
            report($e);
            return redirect('admin/productos')->with('message', '- Se encontro un error inesperado en la operación <br> - El Codigo SKU ya existe en la Base de Datos<br>')->with('operacion', '0');
        }
    }


    public function edit($id)
    {
        return view('productos.edit', ['producto' => Producto::findOrFail($id)]);
    }



    public function update(Request $request, $id)
    {

        try {
            DB::beginTransaction();
            $encontro = Producto::where("prod_sku", $request->get("sku"))
            ->where("prod_id", "!=", $id)->count();

            if ($encontro > 0) {
                return redirect('admin/productos')->with('message', 'El SKU' . $request->get("sku") . ' existe en la Base de Datos')->with('operacion', '0');
            } else {


                $producto                   = Producto::findOrFail($id);

                $producto->prod_nombre      = $request->get('producto');
                $producto->prod_sku         = $request->get('sku');
                $producto->unidad_id        = $request->get('cbo_presentacion');

                $producto->prod_peso        = (float)$request->get('peso');
                $producto->empr_id          = $request->get('cbo_empresa');
                $producto->prod_lote         = $request->get('lote');

                $producto->prod_fecha_vencimiento  = $request->get('fecha_vencimiento');
                $producto->prod_comentario  = $request->get('comentario');

                $producto->update();

                DB::commit();
            }

        } catch (Exception $e) {
            DB::rollBack();
            report($e);
            return redirect('admin/productos')->with('message', '- Se encontro un error inesperado en la operación <br> - El Codigo SKU ya existe en la Base de Datos<br>')->with('operacion', '0');
        }

        return redirect('admin/productos')->with('message', 'La operacion se realizo con Exito')->with('operacion', '1');

    }




    public function destroy($id)
    {
        Producto::destroy($id);
        return redirect('admin/productos')->with('message', 'La operacion se realizo con Exito')->with('operacion', '1');
    }





    public function ObtenerProductosEmpresa(Request $request)
    {

        $productos = DB::table('productos_x_empresa  as p')

            ->select(
                'p.prod_sku',
                'p.prod_id',
                'p.unidad_id',
                'p.prod_nombre',
                'p.prod_lote',
                'p.prod_stock',
                'p.prod_fecha_vencimiento',
                'p.prod_stock as total'
            )
            ->where('p.empr_id', '=', $request->empresa_id)
            ->orderBy('p.prod_nombre', 'asc')->get();





        // $productos = Producto::where('empr_id', $request->empresa_id)->get();

        return $productos;
    }


    public function getTotalProductosLotes(Request $request)
    {

        $totalProductoPorLote = DB::table('lote_x_producto')
            ->select('cantidad')
            ->where('lote_id', '=', $request->lote_id)
            ->where('prod_id', '=', $request->producto_id)->value('cantidad');
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

    public function pdfListaProducto(Request $request)
    {
        //,'p.prod_codigo','m.unid_nombre', 'p.prod_id',  'p.prod_nombre','p.prod_precio', 'p.prod_fecha_vencimiento',
        //'p.created_at','p.deleted_at'
        if ($request->search == 'null')
            $request->search = "";


        if ((int)session('empresa_id') == 0) {
            $productos = DB::table('productos_x_empresa  as p')
                ->join('empresas as e', 'p.empr_id', '=', 'e.empr_id')
                ->leftJoin('unidad_medida as m', 'p.unidad_id', '=', 'm.id')
                ->select('p.prod_id', 'p.prod_sku', 'p.prod_nombre', DB::raw('IFNULL(p.prod_stock,0) AS prod_stock'), 'e.empr_nombre')
                ->where(function ($consulta) use ($request) {
                    $consulta->where('prod_nombre', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('prod_sku', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
                })
                ->whereNull('p.deleted_at')
                ->orderBy('p.created_at', 'asc')->get();
        } else {

            $productos = DB::table('productos_x_empresa  as p')
                ->join('empresas as e', 'p.empr_id', '=', 'e.empr_id')
                ->leftJoin('unidad_medida as m', 'p.unidad_id', '=', 'm.id')
                ->select('p.prod_id', 'p.prod_sku', 'p.prod_nombre', DB::raw('IFNULL(p.prod_stock,0) AS prod_stock'), 'e.empr_nombre')
                ->where(function ($consulta) use ($request) {
                    $consulta->where('prod_nombre', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('prod_sku', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('empr_nombre', 'LIKE', '%' . $request->search . '%');
                })
                ->where('e.empr_id', '=', session('empresa_id'))
                ->whereNull('p.deleted_at')
                ->orderBy('p.created_at', 'asc')->get();
        }


        //$pdf = PDF::loadView('pdf.productos',['productos'=>$productos,'consulta'=>$request->search]);
        //return $pdf->download('Productos-'.rand(1,1000).'.pdf');

        return Excel::download(new ProductosExportExcel($productos), 'Reporte-' . rand(1, 1000) . '.xlsx');
    }


    public function existeSKU(Request $request)
    {
        try {
            $encontro = Producto::where("prod_sku", $request->get("sku"))->count();
            return $encontro;
        } catch (Throwable $e) {
            return response()->json(['errors' => $e, 'status' => 400], 400);
        }
    }


    public function existeSKU_Edit(Request $request)
    {
        try {
            $encontro = Producto::where("prod_sku", $request->get("sku"))
            ->where("prod_id", "!=", $request->get("producto_id"))->count();
            return $encontro;
        } catch (Throwable $e) {
            return response()->json(['errors' => $e, 'status' => 400], 400);
        }
    }
    
    
}
