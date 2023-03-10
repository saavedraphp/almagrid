<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class TipoMovimientoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_movimiento')->truncate();

        DB::table('tipo_movimiento')->insert([
            'tm_nombre' => 'REGISTRO',
            'tm_codigo' => 'REGISTRO',
            'tm_movimiento' => 'INGRESO',
        ]);

        DB::table('tipo_movimiento')->insert([
            'tm_nombre' => 'DESPACHO',
            'tm_codigo' => 'DESPACHO',
            'tm_movimiento' => 'SALIDA',
        ]);
        
        DB::table('tipo_movimiento')->insert([
            'tm_nombre' => 'CAMBIO DE UBICACION SALIDA',
            'tm_codigo' => 'CAMUBISALI',
            'tm_movimiento' => 'SALIDA',
        ]); 

        DB::table('tipo_movimiento')->insert([
            'tm_nombre' => 'CAMBIO DE UBICACION INGRESO',
            'tm_codigo' => 'CAMUBIINGR',
            'tm_movimiento' => 'INGRESO',
        ]);         

    }
}
