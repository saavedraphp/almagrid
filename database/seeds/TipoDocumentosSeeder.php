<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class TipoDocumentosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_documentos')->truncate();

        DB::table('tipo_documentos')->insert([
            'tipo_docu_nombre' => 'DNI',
            'tipo_docu_estado' => 'ACTI',
        ]);

        DB::table('tipo_documentos')->insert([
            'tipo_docu_nombre' => 'BREVETE',
            'tipo_docu_estado' => 'ACTI',
        ]);

        DB::table('tipo_documentos')->insert([
            'tipo_docu_nombre' => 'CARNET EXTRANJERIA',
            'tipo_docu_estado' => 'ACTI',
        ]);

    }
}
