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
        $admin = Role::create(['name' => 'ADMIN']);
        $operador = Role::create(['name' => 'OPERADOR']);
        $asistente = Role::create(['name' => 'ASISTENTE']);
        $cliente = Role::create(['name' => 'CLIENTE']);
        
         
 
        //PRODUCTOS
        Permission::create(['name' => 'admin.productos.index','description' => 'Listado de Productos'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.productos.create','description' => 'Crear Producto'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.productos.edit','description' => 'Editar Producto'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.productos.destroy','description' => 'Eliminar Producto'])->syncRoles($admin);
        
        //RECEPCION
        Permission::create(['name' => 'admin.recepcion.index','description' => 'Listado de Recepciones'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.recepcion.create','description' => 'Crear Recepcion'])->syncRoles($admin,$operador);
        //Permission::create(['name' => 'admin.recepcion.edit','description' => 'Editar Recepcion'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.recepcion.destroy','description' => 'Eliminar Recepcion'])->syncRoles($admin,$operador);

        //DESPACHO
        Permission::create(['name' => 'admin.despacho.index','description' => 'Listado de Despachos'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.despacho.create','description' => 'Crear Despacho'])->syncRoles($admin,$operador);
        //Permission::create(['name' => 'admin.despacho.edit','description' => 'Editar Despacho'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.despacho.destroy','description' => 'Eliminar Despacho'])->syncRoles($admin,$operador);


        //CLIENTE
        Permission::create(['name' => 'admin.clientes.index','description' => 'Listado de Clientes'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.clientes.create','description' => 'Crear Cliente'])->syncRoles($admin);
        Permission::create(['name' => 'admin.clientes.edit','description' => 'Editar Cliente'])->syncRoles($admin);
        Permission::create(['name' => 'admin.clientes.destroy','description' => 'Eliminar Cliente'])->syncRoles($admin);


        //RACKS
        Permission::create(['name' => 'admin.racks.index','description' => 'Listado de Racks'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.racks.create','description' => 'Crear Rack'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.racks.edit','description' => 'Editar Rack'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.racks.destroy','description' => 'Eliminar Rack'])->syncRoles($admin,$operador);


        //CASILLAS
        Permission::create(['name' => 'admin.casillas.index','description' => 'Listado de Casillas'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.casillas.create','description' => 'Crear Casilla'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.casillas.edit','description' => 'Editar Casilla'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.casillas.destroy','description' => 'Eliminar Casilla'])->syncRoles($admin,$operador);


        //USUARIOS
        Permission::create(['name' => 'admin.usuarios.index','description' => 'Listado de Usuarios'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.usuarios.create','description' => 'Crear Usuario'])->syncRoles($admin);
        Permission::create(['name' => 'admin.usuarios.edit','description' => 'Editar Usuario'])->syncRoles($admin);
        Permission::create(['name' => 'admin.usuarios.destroy','description' => 'Eliminar Usuario'])->syncRoles($admin);



        //ROLES
        Permission::create(['name' => 'admin.roles.index','description' => 'Listado de Roles'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.roles.create','description' => 'Crear Rol'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.roles.edit','description' => 'Editar Rol'])->syncRoles($admin,$operador);
        Permission::create(['name' => 'admin.roles.destroy','description' => 'Eliminar Rol'])->syncRoles($admin,$operador);



    }
}
