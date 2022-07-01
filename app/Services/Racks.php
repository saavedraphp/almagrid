<?php

namespace App\Services;

use App\Rack;

class Racks
{
    public function get()
    {
        $datos        = Rack::whereNull('deleted_at')->get();
        $racks[''] = 'Seleccione un Rack';
        foreach ($datos as $item) {
            $racks[$item->rack_id] = $item->rack_nombre;
        }
     
        return $racks;
    }
}
