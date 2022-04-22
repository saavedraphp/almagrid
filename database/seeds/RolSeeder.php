<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;



class RolSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = Role::create(['name' => 'Admin']);
        $almacenero = Role::create(['name' => 'Almacenero']);
        $empresa = Role::create(['name' => 'Empresa']);
 
        Permission::create(['name' => 'admin.productos.index'])->syncRoles($admin,$almacenero);
        Permission::create(['name' => 'admin.productos.create'])->syncRoles($admin,$almacenero);
        Permission::create(['name' => 'admin.productos.edit'])->syncRoles($admin,$almacenero);
        Permission::create(['name' => 'admin.productos.destroy'])->syncRoles($admin);
        

    }
}
