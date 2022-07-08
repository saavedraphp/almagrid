@extends('layouts.app')

@section('content')


<div class="container">

<div class="row">
<div class="col-md-8">
    @if ($errors->any())
    <div class="alert alert-danger">
      <h4>Por Favor corriga los siguientes errores   </h4>
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
   @endif

<form action="/admin/usuarios" method="POST" id="frm_formulario" name="frm_formulario">
 
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
      <input type="text" class="form-control" v-model="nombre"  name="nombre" id="nombre" placeholder="Nombre">
    </div>
  
  </div>


  <div class="form-row">
    <div class="form-group col-md-12">
    <input type="hidden"  v-model="id"  name="id" id="id">
      <label for="producto">Correo</label>
      <input type="text" class="form-control" v-model="email" style="text-transform:lowercase;" 
        onkeyup="javascript:this.value=this.value.toLowerCase();" name="email" id="email" placeholder="email">
    </div>
  
  </div>
 
 
  <div class="form-row">
    <div class="form-group col-md-12">
      <label for="producto">Password</label>
      <input type="password"  class="form-control" v-model="password"  name="password" id="password" placeholder="Password" value="">

    </div>
  
  </div>


  <div class="form-row">
        <div class="form-group col-md-12">
            <label for="producto">Rol</label>
            <select class="form-control" name="cbo_rol" id="cbo_rol" v-model="cbo_rol">
            <option value="">Seleccione un Rol</option>
                @foreach($roles as $item)
                <option value="{{$item->id}}" >{{$item->name}}</option>
                @endforeach
            </select>
        </div>
    </div>

  <button type="button" @click="checkForm" class="btn btn-primary">Registrar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
@section('scripts')
<script src="{{asset('js/frm_user.js') }}" ></script>
@endsection