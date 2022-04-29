<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class LotesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('lotes')->truncate();

        DB::table('lotes')->insert([
            'lote_nombre' => '9999999',
            'lote_fecha_vencimiento' => '2030-12-30',
        ]);

        DB::table('lotes')->insert([
            'lote_nombre' => '1234567',
            'lote_fecha_vencimiento' => '2022-12-30',
        ]);

        
    }
}
