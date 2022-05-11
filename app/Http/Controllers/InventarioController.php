<?php

namespace App\Http\Controllers;


use App\Empresa;

use Auth;
use Exception;
use Illuminate\Support\Facades\DB;

use Illuminate\Http\Request;

class InventarioController extends Controller
{
    
    public function __construct()
    {
        // LSL PARA LA VALIDACION
        $this->middleware('auth');
        //$this->foo = $foo;
    }


    public function kardexPorProductoId($id)
    {
        if ($id>0) {
            
            $empresas = Empresa::where('empr_nombre', 'LIKE', '%' . $query . '%')->orderBy('empr_nombre', 'asc')->paginate(10);

            return view('empresas.index', ['empresas' => $empresas, 'search' => $query]);

        }
    }



}
