<?php

namespace App\Http\Controllers;

use App\Empresa;
use App\User;
use App\Role;
use Auth;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Carbon;

use Illuminate\Http\Request;

class EmpresaController extends Controller
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
            $query    = trim($request->get('search'));
            $empresas = Empresa::where('empr_nombre', 'LIKE', '%' . $query . '%')->orderBy('empr_nombre', 'asc')->paginate(10);

            return view('empresas.index', ['empresas' => $empresas, 'search' => $query]);

        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('empresas.create');
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
            DB::beginTransaction();

            $data = $request->all();
            $user =  User::create([
                'name' => $request->get('nombre'),
                'email' => strtolower($request->get('correo')),
                'password' => Hash::make('123456'),
            ]);
    
            $user->roles()->attach(Role::where('name', 'user')->first());
            $id = $user->id;


            $empresa                 = new Empresa();
            $empresa->empr_nombre    = $request->get('nombre');
            $empresa->user_id        = $id;
            $empresa->empr_ruc       = $request->get('ruc');
            $empresa->empr_direccion     = $request->get('direccion');
            $empresa->empr_telefono = $request->get('telefono');
            $empresa->empr_celular        = $request->get('celular');
            $empresa->empr_correo        = strtolower($request->get('correo'));
    
            $empresa->save();
    

    
            DB::commit();
            return redirect('admin/empresas')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        
        
        } catch (Exception $e) {
            DB::rollBack(); 
            return redirect('admin/empresas')->with('message','Ocurrio un error Inesperado'.$th)->with('operacion','0');
        }
       
        
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function show(Empresa $empresa)
    {

    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('empresas.edit', ['empresa' => Empresa::findOrFail($id)]);
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $empresa                 = Empresa::findOrFail($id);
        $empresa->empr_nombre    = $request->get('nombre');
        $empresa->empr_ruc     = $request->get('ruc');
        $empresa->empr_direccion     = $request->get('direccion');
        $empresa->empr_telefono = $request->get('telefono');
        $empresa->empr_celular        = $request->get('celular');
        $empresa->empr_correo        = $request->get('correo');

        $empresa->update();

        return redirect('admin/empresas')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Empresa  $empresa
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Empresa::destroy($id);
        return redirect('admin/empresas')->with('message','La operacion se realizo con Exito')->with('operacion','1');

    }


    public function images($id)
    {
        return view('empresas.images', ['empresa' => Empresa::findOrFail($id)]);
    }
    
    

    
}
