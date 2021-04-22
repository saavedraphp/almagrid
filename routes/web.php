<?php

use Illuminate\Support\Facades\Route;

//use Illuminate\Routing\Route;

Auth::routes();

 

Route::get('/register', 'Auth\RegisterController@register')->name('register');
Route::post('/register', 'Auth\RegisterController@create');

 

Route::get('/admin', 'HomeController@index')->name('home');

//MODULO DE EMPRESA
Route::get('/usuario', 'HomeController@login_empresa')->name('homex');


//Route::get('/usuarios', 'UsuarioController@index');
//Route::resource('usuarios', 'UsuarioController');


Route::get('admin/actas/create-despacho', 'ActaController@create_despacho');
Route::post('admin/actas/store-despacho', 'ActaController@store_despacho');

Route::resource('admin/actas', 'ActaController');




Route::resource('admin/empresas', 'EmpresaController');
Route::get('/admin/empresas/images/{id}', 'EmpresaController@images')->name('imagesHead');
Route::post('/admin/empresas/images/{id}', 'EmpresaController@upload_mages')->name('upload_mages');
Route::get('/admin/empresas/deleteImages/{id}', 'EmpresaController@eliminar_imagen')->name('dropImages');

Route::get('/admin/empresas/casillas/{id}', 'CasillasEmpresaController@asignar_casillas')->name('casillas_add');



Route::resource('admin/productos', 'ProductosController');
Route::resource('admin/racks', 'RackController');
Route::resource('admin/casillas', 'RackCasillaController');

Route::get('usuario/kardex/', 'KardexController@index');












Route::get('racks/obtenerCasillas/', 'RackCasillaController@obenerCasillasIdRack');

Route::get('productos/empresa/', 'ProductosController@ObtenerProductosEmpresa');

Route::get('ciudades/estado/', 'UsuarioController@getCiudadesByEstado');


Route::get('reporte_acta/id/{id}/','ActaController@pdfReporteRecepcion')->name('reporteRecepcion.pdf');

route::get('user-list-pdf','UsuarioController@exportarPdf')->name('users.pdf');








Route::resource('admin/tasks', 'admin\TaskController',['except' => 'show', 'create', 'edit']);

Route::get('admin/tasks',function(){
    return view('admin.task.index');
    });




    Route::get('admin/ejemplos',function(){
        return view('pruebas.lista');
        });

        
Route::get('rollback','PruebaController@index');
