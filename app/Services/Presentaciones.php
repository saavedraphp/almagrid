<?php

namespace App\Services;

use App\Presentacion;

class Presentaciones
{
    public function get()
    {
        $resultados        = Presentacion::orderby('unid_orden')->get();
        $array[''] = 'Seleccione la Unidad';
        foreach ($resultados as $data) {
            $array[$data->id] = $data->unid_nombre;
        }
        return $array;
    }
}
