<?php

namespace App\Http\Controllers;

use App\ContactosEmpresa;
use Exception;

use Illuminate\Http\Request;

class ContactosEmpresaController extends Controller
{

    public function editarContactoId(Request $request)
    {

        try {
            $contacto = ContactosEmpresa::findOrFail($request->contacto_id);

            $contacto->empresa_id = $request->get("empresa_id");
            $contacto->nombre = $request->get("nombre");
            $contacto->telefono = $request->get("telefono");
            $contacto->email = $request->get("email");

            $contacto->update();

            $contactos = ContactosEmpresa::where("empresa_id", $request->empresa_id )->get();

            return $contactos;

        } catch (Throwable $e) {
            return response()->json(['errors' => $e, 'status' => 400], 400);

        }
       
   
        
    }




    public function obtenerContactosEmpresaId(Request $request)
    {
        $contactos = ContactosEmpresa::where("empresa_id", $request->empresa_id )->get();
        return $contactos;
        
    }

    public function obtenerContactoId(Request $request)
    {
        $contacto = ContactosEmpresa::findOrFail($request->contacto_id);
        return $contacto;
        
    }    
    
    
    public function adicionarContacto(Request $request)
    {

        try {
            $contacto = new ContactosEmpresa();

            $contacto->empresa_id = $request->get("empresa_id");
            $contacto->nombre = $request->get("nombre");
            $contacto->telefono = $request->get("telefono");
            $contacto->email = $request->get("email");

            $contacto->save();

            $contactos = ContactosEmpresa::where("empresa_id", $request->empresa_id )->get();

            return $contactos;

        } catch (Throwable $e) {
            return response()->json(['errors' => $e, 'status' => 400], 400);

        }
       
   
        
    }



    public function eliminar_contacto_id(Request $request)
    {

        try {
            $contacto = new ContactosEmpresa();
            $contacto->destroy($request->get("contacto_id"));

            $contactos = ContactosEmpresa::where("empresa_id", $request->empresa_id )->get();

            return $contactos;

        } catch (Throwable $e) {
            return response()->json(['errors' => $e, 'status' => 400], 400);

        }
       
   
        
    }


}
