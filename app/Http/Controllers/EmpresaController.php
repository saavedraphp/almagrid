<?php

namespace App\Http\Controllers;

use App\Empresa;

use App\User;

use App\Roles;
use Auth;
use Exception;
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
            $empresas = DB::table("empresas")->where(function($query) use ($request){
                $query->where('empr_nombre', 'LIKE', '%' . $request->search . '%')
                ->orWhere('empr_ruc', 'LIKE', '%' . $request->search . '%')
                ->orWhere('empr_celular', 'LIKE', '%' . $request->search . '%');
                })
                ->whereNull('deleted_at')
                ->orderBy('empr_nombre', 'asc')->paginate(10);

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


            $user =  User::create([
                'name' => $request->get('nombre'),
                'email' => strtolower($request->get('correo')),
                'password' => Hash::make('123456'),
            ]);
    
            $user->assignRole('Empresa');
            $id = $user->id;


            $empresa                 = new Empresa();
            $empresa->empr_nombre    = $request->get('nombre');
            $empresa->user_id        = $id;
            $empresa->empr_ruc       = $request->get('ruc');
            $empresa->empr_direccion = $request->get('direccion');
            $empresa->empr_telefono  = $request->get('telefono');
            $empresa->empr_celular   = $request->get('celular');
            $empresa->empr_contacto  = $request->get('contacto');
            $empresa->empr_correo    = strtolower($request->get('correo'));
            
            $empresa->save();
    

    
            DB::commit();
            return redirect('admin/clientes')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        
        
        } catch (Exception $e) {
            DB::rollBack(); 
            return redirect('admin/clientes')->with('message','Ocurrio un error Inesperado'.$e)->with('operacion','0');
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
        $empresa->empr_contacto  = $request->get('contacto');       

        $empresa->update();

        return redirect('admin/clientes')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        

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
        return redirect('admin/clientes')->with('message','La operacion se realizo con Exito')->with('operacion','1');

    }


    public function images($id)
    {

        return view('empresas.images', ['empresa' => Empresa::findOrFail($id)]);
    }
    
    
    public function upload_mages(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            //required|image|mimes:jpeg,png,jpg,gif
            $request->validate([
                'img' => 'required'

            ],
            [
                'img.max'=> 'El archivo no puede ser mayor 2MB',
                'img.required'=> 'tiene que seleccionar un archivo por favor',
                
            ]);

              //  dd($request);
            $imagen = $request->file('img');
            $nombre = $id.'-'.time().'.'.$imagen->getClientOriginalExtension();
            $destino = ('img/cabecera_reporte');
            $request->img->move($destino, $nombre);
            
            $empresa = Empresa::findOrFail($id);

            $empresa->empr_ruta_img_reporte = $nombre;
            $empresa->save();
            
            
            DB::commit();
            return redirect('admin/clientes')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        
        
        } catch (ValidationException $exception) {
            DB::rollBack(); 
            
            return view('empresas.images', ['empresa' => Empresa::findOrFail($id),'errors' => $exception->errors()])->with('message','Ocurrio un error inesperado')->with('operacion','0');
        }
    }    


    public function eliminar_imagen($id)
    {
        try {
            DB::beginTransaction();

            $empresa = Empresa::findOrFail($id);
            $ruta = 'img/cabecera_reporte/'.$empresa->empr_ruta_img_reporte;
            //dd('valor file'.filesize($ruta));

            if(filesize($ruta))
            {
                unlink($ruta);

                //dd($ruta);
    
                $empresa->empr_ruta_img_reporte="";
                $empresa->save();
                DB::commit();
            }

            return redirect('admin/clientes')->with('message','La operacion se realizo con Exito')->with('operacion','1');
        
        
        } catch (Exception $e) {
            DB::rollBack(); 
            return view('empresas.images', ['empresa' => Empresa::findOrFail($id)])->with('message','Ocurrio un error inesperado')->with('operacion','0');
        }
    }    


    
}
