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
            'tm_nombre' => 'INGRESO',
            'tm_codigo' => 'INGRESO',
        ]);

        DB::table('tipo_movimiento')->insert([
            'tm_nombre' => 'DESPACHO',
            'tm_codigo' => 'DESPACHO',
        ]);        
    }
}
