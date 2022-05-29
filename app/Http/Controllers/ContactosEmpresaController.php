<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ContactosEmpresaController extends Controller
{
    public function obtenerContactosEmpresaId(Request $request)
    {
        $contactos = ContactosEmpresa::where("empresa_id", $request->empresa_id )->get();
 
 
            return $contactos;
        
    }

    
    public function adicionarContacto(Request $request)
    {

        $contacto = new ContactosEmpresa();

        $contacto->empresa_id = $request->get("empresa_id");
        $contacto->nombre = $request->get("nombre");
        $contacto->telefono = $request->get("telefono");
        $contacto->email = $request->get("email");

        $contacto->save();

        $contactos = ContactosEmpresa::where("empresa_id", $request->empresa_id )->get();
 
 
        return $contactos;
        
    }

}
