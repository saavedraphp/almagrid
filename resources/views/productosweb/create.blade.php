@extends('layouts.app')

@section('content')

<div class="container">

    <div class="card">
        <h5 class="card-header">Producto [{{MiConstantes::NUEVO}}]</h5>
        <div class="card-body">

            <div class="row">
                <div class="col-md-12">


                    <form action="/admin/productosweb" method="POST" id="frm_formulario" name="frm_formulario">

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
                                <label for="inputPassword4">PRECIO</label>
                                <input type="text"   class="form-control" v-model="precio" name="precio" id="precio" placeholder="0.00">
                            </div>


                            <div class="form-group col-md-6">
                                <label for="inputEmail4">OFERTA</label>
                                <input type="text"  class="form-control" name="oferta" id="oferta" placeholder="0.00">
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