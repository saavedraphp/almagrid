@extends('layouts.app')

@section('content')


@inject('paises','App\Services\Paises')
<div class="container">

<div class="row">
<div class="col-md-8">
    @if($errors->any())
    <div class="alert alert-danger">
      <h4>Por Favor corriga los siguientes errores   </h4>
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
   @endif

<form action="/admin/clientes" method="POST"  id="frm_formulario" name="frm_formulario">
@csrf

<p v-if="errors.length>0">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>


  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Nombre / Empresa</label>
      <input type="text" class="form-control" v-model="nombre_id" name="nombre" id="nombre_id" placeholder="Nombre" value="">
      <input type="hidden" class="form-control" name="empresa_id" v-model="empresa_id" id="empresa_id"  value="">
      <input type="hidden" class="form-control" name="user_id" v-model="user_id" id="user_id"  value="">


    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">DNI / RUC</label>
      <input type="text"   maxlength="11"  @keypress="esNumerico($event)"    class="form-control" name="ruc" 
      id="ruc_id" v-model="ruc_id"  placeholder="Ruc" value="{{old('ruc')}}">
    </div>
  </div>


  <div class="form-group">
    <label for="inputAddress">Direccion</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="Direccion" name="direccion" value="{{old('direccion')}}">
  </div>

  <div class="form-row">

    <div class="form-group col-md-6">
      <label for="inputPassword4">Celular</label>
      <input type="text"    @keypress="esNumerico($event)" class="form-control" v-model="celular_id" name="celular" id="celular_id" placeholder="Celular">
    </div>


    <div class="form-group col-md-6">
      <label for="inputEmail4">Telefono</label>
      <input type="text"   @keypress="esNumerico($event)" class="form-control" name="telefono" id="inputEmail4" placeholder="Telefono" >
    </div>

  </div>


  <div class="form-group">
    <label for="inputAddress">Correo(Para la creacion de usuario)</label>
    <input   type="text" class="form-control"   v-model="correo_id"  id="correo_id" placeholder="Email" name="correo" 
    value="{{old('correo')}}"   >
    <span    v-if="encontroEmail" class="alert alert-danger">El correo existe en nuestra base de datos</span>
  </div>



 

  <button type="button" class="btn btn-primary" v-on:click="checkForm">Registrar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
<script>
  const url = '{{ env("MY_URL") }}';
  
</script>
<script src="{{asset('js/frm_empresa.js') }}" ></script>

@endsection
