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

<form action="{{route('usuarios.update',$usuario->id)}}" method="POST" id="frm_formulario" name="frm_formulario">
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
      <input type="text" class="form-control" v-model="nombre"  name="nombre" id="nombre" placeholder="Nombre" value="{{$usuario->name}}">
      <input type="hidden"  v-model="id"  name="id" id="id"  value="{{$usuario->id}}">
    </div>  
  </div>


  <div class="form-row">
    <div class="form-group col-md-12">
      <label for="producto">Coreo</label>
      <input type="text" class="form-control" v-model="email" style="text-transform:lowercase;" 
        onkeyup="javascript:this.value=this.value.toLowerCase();" name="email" id="email" placeholder="email" value="{{$usuario->email}}">
    </div>
  
  </div>


  <div class="form-row">
    <div class="form-group col-md-12" >
    <input  @click="disabled = (disabled + 1) % 2" type="checkbox" name="chk_password" id="chk_password"  v-model="chk_password">

      <label for="producto">Change Password</label>
      <input type="password"  :disabled="disabled == 0"
   class="form-control" v-model="password"  name="password" id="password" placeholder="Editar Password" value="">
    </div>
  
  </div>

 
  <div class="form-row">
        <div class="form-group col-md-12">
            <label for="producto">Rol</label>
            <select class="form-control" name="cbo_rol" id="cbo_rol" v-model="cbo_rol">
            <option value="">Seleccione un Rol</option>
                @foreach($roles as $item)
                <option value="{{$item->id}}" @if($usuario->roles->first()->id ==$item->id) selected @endif>{{$item->name}}</option>
                @endforeach
            </select>
        </div>
    </div>


  <button type="button" @click="update_user" class="btn btn-primary">Registrar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
@section('scripts')
<script src="{{asset('js/frm_user.js') }}" ></script>

@endsection