<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductoWeb;


class ProductoWebController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $productos = ProductoWeb::paginate(50);
        return view('productosweb.index', ['productos' => $productos]);
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
        $producto                 = new ProductoWeb();
        $producto->nombre    = $request->get('nombre');
        $producto->categoria  = $request->get('categoria');
        $producto->precio       = (float)$request->get('precio');
        $producto->oferta = (float) $request->get('oferta');
        $producto->ruta_imagen = (is_null($request->get('ruta_imagen'))?'1.jpg':$request->get('ruta_imagen'));
        $producto->estado = $request->get('estado');
        $producto->orden = $request->get('orden');


        if($producto->save())
        return redirect('admin/productosweb')->with('message','La operacion se realizo con Exito')->with('operacion','1');
 

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
        $producto                 = ProductoWeb::findOrFail($request->get("id"));
        $producto->nombre    = $request->get('nombre');
        $producto->categoria  = $request->get('categoria');
        $producto->precio       = (float)$request->get('precio');
        $producto->oferta = (float) $request->get('oferta');
        $producto->ruta_imagen = (is_null($request->get('ruta_imagen'))?'1.jpg':$request->get('ruta_imagen'));
        $producto->estado = $request->get('estado');
        $producto->orden = $request->get('orden');
        $producto->update();

        return redirect('admin/productosweb')->with('message','La operacion se realizo con Exito')->with('operacion','1');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        ProductoWeb::destroy($id);
        return redirect('admin/productosweb')->with('message','La operacion se realizo con Exito')->with('operacion','1');

    }

}
