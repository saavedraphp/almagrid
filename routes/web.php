<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginUserController;
use \App\Http\Controllers\InventarioController;
use \App\Http\Controllers\CambioUbicacionController;
use \App\Http\Controllers\RackCasillaController;
use \App\Http\Controllers\EmpresaController;
use \App\Http\Controllers\CasillasEmpresaController;





Auth::routes();

Route::post('login',[LoginUserController::class,'authentication']);

 
 


Route::get('/register', 'Auth\RegisterController@register')->name('register');
Route::post('/register', 'Auth\RegisterController@create');


Route::get('/', 'HomeController@index');
Route::get('/home', 'HomeController@index');


//MODULO AUTENTIFICACION    
Route::resource('/admin/configuracion', 'ConfiguracionController');
Route::resource('/admin/usuarios', 'UserController');

// ROLES
Route::resource('/admin/roles', 'RoleController');                  




//PRODUCTO
Route::resource('admin/productos', 'ProductosController');
Route::get('existeSKU/', 'ProductosController@existeSKU');
Route::get('existeSKU_Edit/', 'ProductosController@existeSKU_Edit');



//RECEPCION - DESPACHO
Route::resource('admin/recepcion', 'RecepcionController');
Route::resource('admin/despacho', 'DespachoController');
Route::get('adicionarCasillaIdEmpresaId/', [CasillasEmpresaController::class,'save_addCasillaIdEmpresaId']);

Route::resource('admin/cambio-ubicacion', 'CambioUbicacionController');



//CLINTES
Route::resource('admin/clientes', 'EmpresaController');

//RACKS - CASILLAS
Route::resource('admin/racks', 'RackController');
Route::resource('admin/casillas', 'RackCasillaController');





Route::get('/admin/editDatos', 'ConfiguracionController@edit');
Route::get('/admin/updatePassword', 'ConfiguracionController@updatePassword')->name('updatePassword');
Route::get('/admin/editPassword', 'ConfiguracionController@editPassword');
Route::get('validarPassword/', 'ConfiguracionController@validarPassword');



//MODULO USUARIOS
Route::get('existeEmail/', 'UserController@existeEmail');
Route::get('validarModificacionEmail/', 'UserController@validarModificacionEmail');
Route::get('cambiar_estado_usurio_id/{user_id}', 'UserController@cambiar_estado_usurio_id')->name('cambiar_estado_usurio_id');









//MODULO DE EMPRESA
Route::get('/usuario', 'HomeController@login_empresa')->name('homex');




/** INVENTARIO  */


Route::get('admin/inventario/downloadKardexProductoId/{id}', [InventarioController::class,'downloadKardexProductoId'])->name('downloadKardexProductoId');
Route::get('admin/inventario/producto/{id}', [InventarioController::class,'kardexPorProductoId'])->name('kardexPorIdProducto');


  


//Route::resource('admin/clientes', 'ClienteController');





/******************  EMPRESAS **************** */
Route::get('/admin/empresas/images/{id}', [EmpresaController::class,'images'])->name('imagesHead');

//Route::get('/admin/empresas/images/{id}', 'EmpresaController@images')->name('imagesHead');

Route::post('/admin/empresas/images/{id}', 'EmpresaController@upload_mages')->name('upload_mages');
Route::get('/admin/empresas/deleteImages/{id}', 'EmpresaController@eliminar_imagen')->name('dropImages');


Route::get('/admin/empresas/casillas/{id}', [CasillasEmpresaController::class,'lista_casillas_asignadas'])->name('lista_casillas_asignadas');
Route::get('/admin/empresas/asignar_celda/create/{id}', [CasillasEmpresaController::class,'create_casillas_empresa'])->name('elegir_celdas');
Route::put('/admin/empresas/adicionar_casillas/{id}', [CasillasEmpresaController::class,'save_casillas_asignadas'])->name('save_casillas_asignadas');
Route::delete('/admin/empresas/eliminarCasillaEmpresaId/{idCliente}/{idCasilla}', [CasillasEmpresaController::class,'eliminarCasillaEmpresaId'])->name('eliminarCasillaEmpresaId');





  





Route::get('usuario/kardex/', 'KardexController@index');









Route::get('racks/obtenerCasillas/', [RackCasillaController::class,'obtenerCasillasIdRack']);


Route::get('productos/empresa/', 'ProductosController@ObtenerProductosEmpresa');
Route::get('listaProductoQuery/consulta/{search}/','ProductosController@pdfListaProducto')->name('pdfListaProducto.pdf');

Route::get('getTotalProductosLotes/', 'ProductosController@getTotalProductosLotes');
Route::get('obtenerContactosEmpresaId', 'ContactosEmpresaController@obtenerContactosEmpresaId');
Route::get('obtenerContactoId', 'ContactosEmpresaController@obtenerContactoId');
Route::get('adicionarContacto', 'ContactosEmpresaController@adicionarContacto');
Route::get('eliminar_contacto_id', 'ContactosEmpresaController@eliminar_contacto_id');
Route::get('editarContactoId', 'ContactosEmpresaController@editarContactoId');
Route::get('obtenerCasillasEmpresaId/', [CasillasEmpresaController::class,'obtenerCasillasEmpresaId']);
Route::get('obtenerUbicacionProductoId/', [CasillasEmpresaController::class,'obtenerUbicacionProductoId']);









Route::get('ciudades/estado/', 'UsuarioController@getCiudadesByEstado');


Route::get('reporte_acta/id/{id}/','RecepcionController@pdfReporteRecepcion')->name('reporteRecepcion.pdf');
Route::get('reporte_guia/id/{id}/','RecepcionController@reporte_guia')->name('reporte_guia.pdf');
Route::get('demo/', 'RecepcionController@demo');


Route::get('asignarProductosCeldas/{id}', 'RecepcionController@asignarProductosCeldas')->name('asignarProductosCeldas');
Route::post('grabarAsignacionProductosCasillas', 'RecepcionController@grabarAsignacionProductosCasillas')->name('grabarAsignacionProductosCasillas');




Route::get('adicionarPersona', 'EntidadController@adicionarPersona');
Route::get('buscarPersona', 'EntidadController@buscarPersona');



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