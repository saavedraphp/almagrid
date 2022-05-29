<?php

namespace App;
use App\ContactosEmpresa;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ContactosEmpresa extends Model
{
    use SoftDeletes;
    protected $table = "contactos_x_empresa";
    protected $primaryKey = 'id';

}
