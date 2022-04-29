<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call('TipoDocumentosSeeder'::class);
        $this->call('LotesSeeder'::class);
        $this->call('TipoMovimientoSeeder'::class);


         $this->call('TaskesTableSeeder'::class);
         $this->call('RolSeeder'::class);
         
         //$this->call(RoleTableSeeder::class);

         
    }
}
