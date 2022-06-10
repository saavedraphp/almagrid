<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CasillasEmpresa extends Model
{
    use SoftDeletes;
    protected $table = "casillas_empresas";
    protected $primaryKey = 'id';
}
