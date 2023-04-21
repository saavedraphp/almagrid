<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ProductosReporteExcel;



use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Empresa;
use App\Producto;

class ReporteController extends Controller
{

    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        DB::enableQueryLog();
    }


    public function exportarProductosExcel(Request $request)
    { //dd('cabecera'.$request->producto_id);


        $productos = [];
        if (!empty($request->empresa_id) && !empty($request->producto_id)) {

            $producto = Producto::findOrFail($request->producto_id);
            $name_file = str_replace("/","-",($producto->prod_id.'-'.$producto->prod_nombre));


             $productos = DB::table('empresas as e')
                ->leftJoin('actas as a', 'e.empr_id', '=', 'a.empr_id')
                ->leftJoin('kardex as k', 'k.acta_id', '=', 'a.acta_id')
                ->leftJoin('racks_casillas as rc', 'k.rc_id', '=', 'rc.rc_id')
                ->leftJoin('racks as r', 'r.rack_id', '=', 'rc.rack_id')
                ->leftJoin('productos_x_empresa as p', 'p.prod_id', '=', 'k.prod_id')
                ->select(
                    'a.acta_id as acta',
                    'k.kard_id as kardex',
                    'e.empr_nombre as empresa',
                    'tm_codigo as movimiento',
                    'p.prod_sku as sku',
                    'p.prod_nombre as producto',
                    'k.kard_cantidad as cantidad',
                    DB::raw("CONCAT(r.rack_nombre,' - ', rc.rc_nombre) as casilla"),
                    DB::raw("date_format(a.created_at,'%d/%m/%Y') as fecha_registro")
                )
                ->whereNull('e.deleted_at')
                ->where('a.empr_id', '=', $request->empresa_id)
                ->where('k.prod_id', '=', $request->producto_id)
                ->orderBy('e.empr_nombre', 'asc')
                ->orderBy('a.acta_id', 'asc')->get();

        } else 
        {

            $empresa = Empresa::findOrFail($request->empresa_id);
            $name_file = str_replace("/","-",($empresa->empr_id.'-'.$empresa->empr_nombre));
            
            $productos = DB::table('empresas as e')
                ->leftJoin('actas as a', 'e.empr_id', '=', 'a.empr_id')
                ->leftJoin('kardex as k', 'k.acta_id', '=', 'a.acta_id')
                ->leftJoin('racks_casillas as rc', 'k.rc_id', '=', 'rc.rc_id')
                ->leftJoin('racks as r', 'r.rack_id', '=', 'rc.rack_id')
                ->leftJoin('productos_x_empresa as p', 'p.prod_id', '=', 'k.prod_id')
                ->select(
                    'a.acta_id as acta',
                    'k.kard_id as kardex',
                    'e.empr_nombre as empresa',
                    'tm_codigo as movimiento',
                    'p.prod_sku as sku',
                    'p.prod_nombre as producto',
                    'k.kard_cantidad as cantidad',
                    DB::raw("CONCAT(r.rack_nombre,' - ', rc.rc_nombre) as casilla"),
                    DB::raw("date_format(a.created_at,'%d/%m/%Y') as fecha_registro")
                )
                ->whereNull('e.deleted_at')
                ->where('a.empr_id', '=', $request->empresa_id)
                ->orderBy('e.empr_nombre', 'asc')
                ->orderBy('a.acta_id', 'asc')->get();
        }  
            
            
            //dd('entro');
            return Excel::download(new ProductosReporteExcel($productos),'kardex - '.$name_file.'-'.date('Y-m-d').'.xlsx');
 
        
    }    



    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('reportes.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function  indexReporteProducto()
     {
        return view('reportes.reporte_productos');
 
     }

    public function buscarProductoIdEmpresaId(Request $request)
    {
        //dd('empresa=>'.$request->empresa_id.' - producto =>'.$request->producto_id);
        $productos = [];
        if (!empty($request->empresa_id) && !empty($request->producto_id)) {
             $productos = DB::table('empresas as e')
                ->leftJoin('actas as a', 'e.empr_id', '=', 'a.empr_id')
                ->leftJoin('kardex as k', 'k.acta_id', '=', 'a.acta_id')
                ->leftJoin('racks_casillas as rc', 'k.rc_id', '=', 'rc.rc_id')
                ->leftJoin('racks as r', 'r.rack_id', '=', 'rc.rack_id')
                ->leftJoin('productos_x_empresa as p', 'p.prod_id', '=', 'k.prod_id')
                ->select(
                    'a.acta_id as acta',
                    'k.kard_id as kardex',
                    'e.empr_nombre as empresa',
                    'tm_codigo as movimiento',
                    'p.prod_sku as sku',
                    'p.prod_nombre as producto',
                    'k.kard_cantidad as cantidad',
                    DB::raw("CONCAT(r.rack_nombre,' - ', rc.rc_nombre) as casilla"),
                    DB::raw("date_format(a.created_at,'%d/%m/%Y') as fecha_registro")
                )
                ->whereNull('e.deleted_at')
                ->where('a.empr_id', '=', $request->empresa_id)
                ->where('k.prod_id', '=', $request->producto_id)
                ->orderBy('e.empr_nombre', 'asc')
                ->orderBy('a.acta_id', 'asc')->get();

        } else
        {
            $productos = DB::table('empresas as e')
                ->leftJoin('actas as a', 'e.empr_id', '=', 'a.empr_id')
                ->leftJoin('kardex as k', 'k.acta_id', '=', 'a.acta_id')
                ->leftJoin('racks_casillas as rc', 'k.rc_id', '=', 'rc.rc_id')
                ->leftJoin('racks as r', 'r.rack_id', '=', 'rc.rack_id')
                ->leftJoin('productos_x_empresa as p', 'p.prod_id', '=', 'k.prod_id')
                ->select(
                    'a.acta_id as acta',
                    'k.kard_id as kardex',
                    'e.empr_nombre as empresa',
                    'tm_codigo as movimiento',
                    'p.prod_sku as sku',
                    'p.prod_nombre as producto',
                    'k.kard_cantidad as cantidad',
                    DB::raw("CONCAT(r.rack_nombre,' - ', rc.rc_nombre) as casilla"),
                    DB::raw("date_format(a.created_at,'%d/%m/%Y') as fecha_registro")
                )
                ->whereNull('e.deleted_at')
                ->where('a.empr_id', '=', $request->empresa_id)
                ->orderBy('e.empr_nombre', 'asc')
                ->orderBy('a.acta_id', 'asc')->get();
        }  
        //dd($productos);

        return $productos;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
