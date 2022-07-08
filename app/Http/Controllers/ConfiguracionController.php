<?php

namespace App\Http\Controllers;
use Auth;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use Illuminate\Http\Request;
use App\User;


class ConfiguracionController extends Controller
{


        
    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        DB::enableQueryLog();
    }



    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function edit($id=1)
    {
        $id = Auth::user()->id;
        $usuario=User::findOrFail($id);
        
       return  view("usuarios/edit_datos_usuario",["usuario"=>$usuario]);
    }



    public function update(Request $request, $id)
    {
        $usuario = User::find($id);
        $usuario->name = trim($request->get("nombre"));
        $usuario->email = trim($request->get("correo"));
        $usuario->update();

        $id = Auth::user()->id;
        $usuario=User::findOrFail($id);
        
       return  redirect("/")->with('message','La operacion se realizo con Exito')
                                                                        ->with('operacion',1);

    }


    public function editPassword()
    {
        $id = Auth::user()->id;
        $usuario = User::findOrfail($id);
        return  view("usuarios/edit_password",["usuario"=>$usuario]);

        
    }

    
    public function updatePassword(Request $request)
    {
        $user = Auth::user();
        $user->password = bcrypt($request->new_password);
        $user->update();
        return  redirect("/")->with('message','La operacion se realizo con Exito')
        ->with('operacion',1);        

    }


    public function validarPassword(Request $request)
    {
     
        try
        {        
        
        $actual =     Auth::user();

        if(Hash::check($request->o_password,$actual->password))
        return 1;
        else
        return 0;
 

        } catch (Throwable $e) {
            return response()->json(['errors' => $e, 'status' => 400], 400);

        }
        
    }



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
 
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */


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
