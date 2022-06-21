<?php
use Illuminate\Support\Facades\Route;



Auth::routes();

 

Route::get('/register', 'Auth\RegisterController@register')->name('register');
Route::post('/register', 'Auth\RegisterController@create');

 

Route::get('/', 'HomeController@index');

//MODULO DE EMPRESA
Route::get('/usuario', 'HomeController@login_empresa')->name('homex');




/** INVENTARIO  */


Route::get('admin/inventario/downloadKardexProductoId/{id}', 'InventarioController@downloadKardexProductoId')->name('downloadKardexProductoId');
Route::get('admin/inventario/producto/{id}', 'InventarioController@kardexPorProductoId')->name('kardexPorIdProducto');


Route::get('admin/actas/create-despacho', 'ActaController@create_despacho');
Route::post('admin/actas/store-despacho', 'ActaController@store_despacho');

Route::resource('admin/recepcion', 'RecepcionController');
Route::resource('admin/despacho', 'DespachoController');

//Route::resource('admin/clientes', 'ClienteController');



Route::resource('admin/clientes', 'EmpresaController');


/******************  EMPRESAS **************** */
Route::get('/admin/empresas/images/{id}', 'EmpresaController@images')->name('imagesHead');
Route::post('/admin/empresas/images/{id}', 'EmpresaController@upload_mages')->name('upload_mages');
Route::get('/admin/empresas/deleteImages/{id}', 'EmpresaController@eliminar_imagen')->name('dropImages');

Route::get('/admin/empresas/casillas/{id}', 'CasillasEmpresaController@lista_casillas_asignadas')->name('lista_casillas_asignadas');
Route::get('/admin/empresas/asignar_celda/create/{id}', 'CasillasEmpresaController@create_casillas_empresa')->name('elegir_celdas');
Route::put('/admin/empresas/adicionar_casillas/{id}', 'CasillasEmpresaController@save_casillas_asignadas')->name('save_casillas_asignadas');
Route::delete('/admin/empresas/eliminarCasillaEmpresaId/{idCliente}/{idCasilla}', 'CasillasEmpresaController@eliminarCasillaEmpresaId')->name('eliminarCasillaEmpresaId');





  



Route::resource('admin/productos', 'ProductosController');
Route::resource('admin/racks', 'RackController');
Route::resource('admin/casillas', 'RackCasillaController');

Route::get('usuario/kardex/', 'KardexController@index');








Route::get('racks/obtenerCasillas/', 'RackCasillaController@obenerCasillasIdRack');

Route::get('productos/empresa/', 'ProductosController@ObtenerProductosEmpresa');
Route::get('getTotalProductosLotes/', 'ProductosController@getTotalProductosLotes');
Route::get('obtenerContactosEmpresaId', 'ContactosEmpresaController@obtenerContactosEmpresaId');
Route::get('obtenerContactoId', 'ContactosEmpresaController@obtenerContactoId');
Route::get('adicionarContacto', 'ContactosEmpresaController@adicionarContacto');
Route::get('eliminar_contacto_id', 'ContactosEmpresaController@eliminar_contacto_id');
Route::get('editarContactoId', 'ContactosEmpresaController@editarContactoId');
Route::get('obtenerCasillasEmpresaId/', 'CasillasEmpresaController@obtenerCasillasEmpresaId');









Route::get('ciudades/estado/', 'UsuarioController@getCiudadesByEstado');


Route::get('reporte_acta/id/{id}/','RecepcionController@pdfReporteRecepcion')->name('reporteRecepcion.pdf');
Route::get('asignarProductosCeldas/{id}', 'RecepcionController@asignarProductosCeldas')->name('asignarProductosCeldas');
Route::post('grabarAsignacionProductosCasillas', 'RecepcionController@grabarAsignacionProductosCasillas')->name('grabarAsignacionProductosCasillas');



route::get('user-list-pdf','UsuarioController@exportarPdf')->name('users.pdf');






Route::resource('admin/tasks', 'admin\TaskController',['except' => 'show', 'create', 'edit']);

Route::get('admin/tasks',function(){
    return view('admin.task.index');
    });




Route::get('admin/ejemplos',function(){
    return view('pruebas.lista');
    });

        
Route::get('rollback','PruebaController@index');


/* PARAMETROS PARA EL SISTEMA HOSTING*/
Route::get('/sistemclear', function() {

    Artisan::call('cache:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    return "Cleared!";
    });