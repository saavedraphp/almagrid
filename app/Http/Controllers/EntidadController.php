<?php

namespace App\Http\Controllers;

use App\Entidad;
use Illuminate\Http\Request;
use Exception;


class EntidadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function adicionarPersona(Request $request)
    {
        try {
            $entidad = new Entidad();

            $entidad->nombre = $request->get('nombre_sub_cliente');
            $entidad->tipo_documento = $request->get('tipo_documento_id');
            $entidad->nro_documento = $request->get('nro_documento');
            $entidad->tipo = 'SUB_CLIENTE';
            $entidad->save();
            return "OK";

        } catch (Exception $e) {
            return $entidad;

        }
        
 

    }

    public function buscarPersona(Request $request)
    {
       // $entidad = Entidad::find($request->nro_documento);

        try {

    
            $entidad = Entidad::where('nro_documento',$request->nro_documento)->first();
            if($entidad)
                return $entidad;
            else
                return "0";



        } catch (Exception $e) {
            return $e;

        }
        
 

    }
    
    
    
    /**
     * Display the specified resource.
     *
     * @param  \App\Entidad  $entidad
     * @return \Illuminate\Http\Response
     */
    public function show(Entidad $entidad)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Entidad  $entidad
     * @return \Illuminate\Http\Response
     */
    public function edit(Entidad $entidad)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Entidad  $entidad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Entidad $entidad)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Entidad  $entidad
     * @return \Illuminate\Http\Response
     */
    public function destroy(Entidad $entidad)
    {
        //
    }
}
