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
 
<form action="{{route('updatePassword')}}" method="GET" id="frm_formulario" @submit="checkForm">
@method('POST')
@csrf

  <p v-if="errors.length">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>

  <div class="form-row">
    <div class="form-group col-md-12">
      <label for="producto">Email</label>
      <input type="text" class="form-control"  name="email"    value="{{$usuario->email}}" disabled>
      </div>
  
    <div class="form-group col-md-12">
      <label for="producto">Actual Contraseña</label>
      <input type="text" class="form-control" v-model="o_password"  name="o_password" id="o_password" placeholder="Actual Contraseña"  >
    </div> 
 
    <div class="form-group col-md-12">
      <label for="producto">Nuevo Contraseña</label>
      <input type="text" class="form-control" v-model="new_password"  name="new_password" id="new_password" placeholder="Nueva Contraseña"  >
    </div>
    
    <div class="form-group col-md-12">
      <label for="producto">Repita la Nueva Contraseña</label>
      <input type="text" class="form-control" v-model="r_new_password"  name="r_new_password" id="r_new_password" placeholder="Repita la nueva Contraseña"  >
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
<script src="{{asset('js/frm_password_usuario.js') }}" ></script>

@endsection