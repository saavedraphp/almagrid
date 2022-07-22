<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Spatie\Permission\Models\Role;
use \Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\DB;
use Exception;


class RoleController extends Controller
{


    
    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        DB::enableQueryLog();

        //$this->foo = $foo;
    }
    
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $filas = Role::paginate(25);
        return view("roles.index",compact("filas"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $permisos = Permission::all();

        return view("roles.create", compact("permisos"));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try
        {
            $role = new Role();
            $role->name = strtoupper($request->get("nombre"));
            $role->save();

            $role->permissions()->sync($request->chk_permiso);

            return redirect()->route('roles.edit',$role->id)->with('message','La Operacion se Ejecuto con Exito')->with('operacion','1');

        } catch (Exception $e) {
            DB::rollBack();    
            report($e);
            return redirect('admin/roles/create')->with('message','Se encontro un error inesperado en la operación<br>'.$e)->with('operacion','0');
    
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
        $role = Role::findOrFail($id);
 
        $permisos = DB::select( DB::raw("select p.id,p.description,rp.role_id   from permissions as p 
        left outer join  role_has_permissions as rp
        on p.id = rp.permission_id 
        and rp.role_id = $id"));
        
        //dd($permisos);
        //dd(DB::getQueryLog());

        return view("roles.edit", ["permisos" =>$permisos, "id"=>$id,"role"=>$role]);
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
        $role = Role::findOrFail($id);
        $requestData = $request->all();
        $requestData['name'] = strtoupper($request->get('name'));
        
        $role->update($requestData);
        $role->permissions()->sync($request->chk_permiso);


        return redirect()->route('roles.edit',$id)->with('message','La Operacion se Ejecuto con Exito')->with('operacion','1');
        


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try
        {
        
        DB::beginTransaction();
            
        Role::destroy($id);
        DB::commit();

        return redirect()->route("roles.index")->with('message','La Operacion se Ejecuto con Exito')->with('operacion','1');
        //return redirect("admin/usuarios")->with('message','La operacion se realizo con Exito')->with('operacion','1');

    } catch (Exception $e) {
        DB::rollBack();    
        report($e);
        return redirect('roles.index')->with('message','Se encontro un error inesperado en la operación<br>'.$e)->with('operacion','0');

   } 
    }
}
