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

<form action="/admin/roles" method="POST" id="frm_formulario" @submit="checkForm">
@csrf

  <p v-if="errors.length">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>

  <div class="form-row">
    <div class="form-group col-md-12">
      <input type="text" class="form-control" v-model="name" style="text-transform:uppercase;" 
        onkeyup="javascript:this.value=this.value.toUpperCase();" name="nombre" id="name" placeholder="Nombre" value="{{old('nombre')}}">
    </div>
  
  </div>
 
  <h2 class="h3">Lista de Permisos</h2>
  @foreach($permisos as $permiso)
        <div>
            <label for="">
                <input type="checkbox" name="chk_permiso[]" value="{{$permiso->id}}" id="chk_permiso_{{$permiso->id}}">{{$permiso->description}}
             </label>
        </div>
  @endforeach
 


<br>
  <button type="submit" class="btn btn-primary">Registrar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
@section('scripts')
<script src="{{asset('js/frm_roles.js') }}" ></script>

@endsection