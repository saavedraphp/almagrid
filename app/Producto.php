<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Producto extends Model
{
    use SoftDeletes;
       
    protected $table = "productos_x_empresa";
    protected $primaryKey = 'prod_id';

    public function obtenerNombreFormato()
    {
        return $this->prod_sku.' - '.$this->prod_nombre;
    }
}

