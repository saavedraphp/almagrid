@extends('layouts.app')

@push('scripts')
    <script src="/example.js"></script>
@endpush


@section('content')

<div class="container">

<div class="row">
<div class="col-md-8">
   
<form action="/admin/racks" method="POST" id="frm_formulario" @submit="checkForm">
@csrf

  <p v-if="existeErrores">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors" v-if="existeErrores">@{{error}}</li>
    </ul>
  </p>

  
  <div class="form-row">
    <div class="form-group col-md-12">
      <label for="producto">Rack *</label>
      <input type="text" class="form-control" v-model="nombre" style="text-transform:uppercase;" 
        onkeyup="javascript:this.value=this.value.toUpperCase();" name="nombre" id="nombre" placeholder="Nombre Rack" value="{{old('nombre')}}">
    </div>
  
  </div>

 



  <button type="submit" class="btn btn-primary">Registrar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>

@endsection
@section('scripts')
<script src="{{asset('js/racks.js') }}" ></script>
@endsection
 