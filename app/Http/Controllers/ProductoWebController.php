<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductoWeb;
use Illuminate\Support\Facades\DB;

use Exception;


class ProductoWebController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $totales = DB::select("select  id, sum(precio_compra * cantidad) as inversion, 
        sum(precio_final * cantidad) as total_venta from productos_web where categoria !='CAMAS'
        group by id");

        //dd($totales);
        //$resultado = [];
        $resultado['inversion'] = 0;
        $resultado['total_venta'] = 0;
        foreach ($totales as $total) {
            $resultado['inversion'] += $total->inversion;
            $resultado['total_venta'] += $total->total_venta;
        }

        $resultado['ganancia'] = $resultado['total_venta'] - $resultado['inversion'];


        $productos = ProductoWeb::orderBy('id', 'desc')->paginate(50);

        return view('productosweb.index', ['productos' => $productos, "resultado" => $resultado]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('productosweb.create');
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
            if (!$request->hasFile('imagen'))
                throw new Exception('La imagen es un campo requerido');


            $request->validate(
                [
                    'imagen' => 'required'

                ],
                [
                    'imagen.max' => 'El archivo no puede ser mayor 2MB',
                    'imagen.required' => 'tiene que seleccionar un archivo por favor',

                ]
            );


            $producto                 = new ProductoWeb();
            $producto->nombre    = $request->get('nombre');
            $producto->categoria  = $request->get('categoria');
            $producto->precio       = (float)$request->get('precio');
            $producto->descuento       = (float)($request->get('precio') - $request->get('precio_final'));
            $producto->precio_final = (float) $request->get('precio_final');
            $producto->precio_compra       = (float)$request->get('precio_compra');
            $producto->cantidad       = (float)$request->get('cantidad');


            $producto->estado = $request->get('estado');
            $producto->orden = $request->get('orden');

            // ADD IMAGEN
            $imagen = $request->file('imagen');
            $nombre = time() . '-' . $imagen->getClientOriginalName();
            $destino = ('img/productosweb');
            $request->imagen->move($destino, $nombre);
            // FIN ADD IMAGEN
            $producto->ruta_imagen = (is_null($nombre) ? '' : $nombre);

            $producto->save();

            return redirect('admin/productosweb')->with('message', 'La operacion se realizo con Exito')->with('operacion', '1');
        } catch (Exception $e) {
            report($e);
            //return redirect('admin/productosweb')->with('message', 'Se encontro un error inesperado en la operación<br>' . $e)->with('operacion', '0');
            return back()->withError($e->getMessage());
        }
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

        $producto = ProductoWeb::findOrFail($id);

        //dd(DB::getQueryLog());

        return view('productosweb.edit', ['producto' => $producto]);
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
        try {
            $producto                 = ProductoWeb::findOrFail($request->get("id"));
            $producto->nombre    = $request->get('nombre');
            $producto->categoria  = $request->get('categoria');

            $producto->precio       = (float)$request->get('precio');
            $producto->descuento       = (float)($request->get('precio') - $request->get('precio_final'));
            $producto->precio_final = (float) $request->get('precio_final');
            $producto->precio_compra       = (float)$request->get('precio_compra');
            $producto->cantidad       = (float)$request->get('cantidad');

            $producto->estado = $request->get('estado');
            $producto->orden = $request->get('orden');


            // ADD IMAGEN
            if ($request->hasFile('imagen')) {


                $ruta = 'img/productosweb/' . $producto->ruta_imagen;
                //dd('valor file'.filesize($ruta));

                if (filesize($ruta) && !empty($producto->ruta_imagen)) {
                    unlink($ruta);
                }

                $imagen = $request->file('imagen');
                $nombre = time() . '-' . $imagen->getClientOriginalName();
                $destino = ('img/productosweb');
                $request->imagen->move($destino, $nombre);
                $producto->ruta_imagen = $nombre;
            }
            // FIN ADD IMAGEN

            $producto->update();
            return redirect('admin/productosweb')->with('message', 'La operacion se realizo con Exito')->with('operacion', '1');
        } catch (Exception $e) {
            report($e);
            return redirect('admin/productosweb')->with('message', 'Se encontro un error inesperado en la operación<br>')->with('operacion', '0');
            //return back()->withError($e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $producto = ProductoWeb::findOrFail($id);

        $ruta = 'img/productosweb/' . $producto->ruta_imagen;
        //dd('valor file'.filesize($ruta));

        if (filesize($ruta) && !empty($producto->ruta_imagen)) {
            unlink($ruta);
        }


        ProductoWeb::destroy($id);
        return redirect('admin/productosweb')->with('message', 'La operacion se realizo con Exito')->with('operacion', '1');
    }



    public function catalogo($categoria = 'COSMETICOS')
    {

        if ($categoria == 'TODOS')
            $productos = ProductoWeb::where('categoria')->get();
        else
            $productos = ProductoWeb::where('categoria', $categoria)->get();

        return view('productosweb.catalogo', ['productos' => $productos]);
    }
}
