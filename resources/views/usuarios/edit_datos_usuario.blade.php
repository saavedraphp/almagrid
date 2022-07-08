@extends('layouts.app')

@section('content')


<div class="container">
@if(Session::get('operacion')=='1')
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{Session::get('message')}}
</div>
@endif

@if(Session::get('operacion')=='0')
  <div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    {{Session::get('message')}}
  </div>

@endif

<div class="row">
<div class="col-md-8">
 
<form action="{{route('configuracion.update',$usuario->id)}}" method="POST" id="frm_formulario" @submit="checkForm">
@method('PATCH')
@csrf

  <p v-if="errors.length">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>

  <div class="form-row">
    <div class="form-group col-md-12">
      <label for="producto">Nombre</label>
      <input type="text" class="form-control" v-model="nombre" style="text-transform:uppercase;" 
        onkeyup="javascript:this.value=this.value.toUpperCase();" name="nombre" id="nombre" placeholder="Nombre"  value="{{$usuario->name}}">
    </div>
  
    <div class="form-group col-md-12">
      <label for="producto">Email</label>
      <input type="text" class="form-control" v-model="correo" style="text-transform:lowercase;" 
        onkeyup="javascript:this.value=this.value.toLowerCase();" name="correo" id="correo" placeholder="Email" value="{{$usuario->email}}">
    </div>    
  </div>

 



  <button type="submit" class="btn btn-primary">Actualizar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
@section('scripts')
<script src="{{asset('js/frm_edit_datos_usuario.js') }}" ></script>

@endsection