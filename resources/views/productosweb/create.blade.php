@extends('layouts.app')

@section('content')
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

@if (session('error'))
<div class="alert alert-danger">{{ session('error') }}</div>
@endif


<div class="container">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/admin/productosweb">Gestion Productos</a>
        </li>
      
       
        <li class="nav-item">
            <a href="/catalogo"  class="nav-link">Catálogo WEB</a>
        </li>
      </ul>
    <div class="card">
        <h5 class="card-header">Producto [{{MiConstantes::NUEVO}}]</h5>
        <div class="card-body">

            <div class="row">
                <div class="col-md-12">


                    <form action="/admin/productosweb" method="POST" id="frm_formulario" name="frm_formulario"
                    enctype="multipart/form-data">
                       @csrf

                        <p v-if="errors.length>0">
                            <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
                        <ul>
                            <li v-for="error in errors">@{{error}}</li>
                        </ul>
                        </p>


                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Producto</label>
                                <input type="text" class="form-control" v-model="nombre" name="nombre" id="nombre" placeholder="Nombre" value="">
                                <input type="hidden" class="form-control" name="ruta_imagenDB"  id="ruta_imagenDB"  value="">
                                

                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">CATEGORIA</label>
                                <select class="form-control" aria-label="Default select example" name="categoria" id="categoria" >
                                    <option value="COSMETICOS">COSMETICOS</option>
                                    <option value="OTROS">OTROS</option>
                                </select>
                            </div>
                        </div>




                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="inputPassword4">PRECIO COMPRA</label>
                                <input type="number"   class="form-control" v-model="precio_compra" name="precio_compra" id="precio_compra" placeholder="0.00">
                            </div>


                            <div class="form-group col-md-6">
                                <label for="inputEmail4">CANTIDAD</label>
                                <input type="number"  class="form-control" name="cantidad" id="cantidad" placeholder="0" v-model="cantidad">
                            </div>

                        </div>
                                                


                        <div class="form-row">

                            <div class="form-group col-md-4">
                                <label for="inputPassword4">PRECIO VENTA</label>
                                <input type="number"   class="form-control" v-model="precio" name="precio" id="precio" placeholder="0.00">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="inputPassword4">DESCUENTO</label>
                                <input type="number"  v-on:keyup="calculo_descuento" class="form-control" v-model="descuento" name="descuento" id="descuento" placeholder="0.00">
                            </div>


                            <div class="form-group col-md-4">
                                <label for="inputEmail4">PRECIO FINAL</label>
                                <input type="number"  v-on:keyup="calculo_precioFinal"  class="form-control" name="precio_final" id="precio_final" placeholder="0.00" v-model="precio_final">
                            </div>

                        </div>


                        <div class="form-row">

                            <div class="form-group col-md-6">
                            <label for="inputPassword4">ORDEN</label>
                                <select class="form-control" aria-label="Default select example" name="orden" id="orden"  >
                                    <?php for($conta=1;$conta<100;$conta++)
                                    {?>
                                    <option value="<?php echo $conta?>"><?php echo $conta?></option>
                                    <?php
                                    }
                                    ?>
                                    
                                </select>
                            </div>


                            <div class="form-group col-md-6">
                                <label for="inputPassword4">ESTADO</label>
                                <select class="form-control" aria-label="Default select example" name="estado" id="estado" >
                                    <option value="ACTIVO">ACTIVO</option>
                                    <option value="DESACTIVO">DESACTIVO</option>
                                    <option value="AGOTADO">AGOTADO</option>
                                </select>
                            </div>

                        </div>


                        <div class="form-group">
                     
                            <label for="inputAddress">Seleccione un Archivo</label>
                            <div class="input-group mb-3">
                    
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Upload</span>
                                </div>
                    
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="imagen"  accept="image/*"  ref="imagen" name="imagen">
                                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                </div>
                    
                            </div>
                        </div>


                        <button type="button" class="btn btn-primary" v-on:click="checkForm">{{MiConstantes::REGISTRAR}}</button>
                        <button type="reset" class="btn btn-danger">{{MiConstantes::CANCELAR}}</button>

                    </form>
                </div>
            </div>

        </div>
    </div>



</div>
<script>
    const url = '{{ env("MY_URL") }}';
</script>
<script src="{{asset('js/frm_productoweb.js') }}"></script>

@endsection