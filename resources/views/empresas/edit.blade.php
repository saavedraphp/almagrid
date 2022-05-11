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

   <form action="{{route('clientes.update',$empresa->empr_id)}}" id="frm_formulario" @submit="checkForm" method="POST">
@method('PATCH')
@csrf


  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Empresa</label>
      <input type="text" class="form-control" name="nombre" v-model="nombre_id" id="nombre_id" placeholder="Nombre" value="{{$empresa->empr_nombre}}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">DNI / RUC</label>
      <input type="number"   onKeyPress="if(this.value.length==11) return false;"   class="form-control" name="ruc" 
      id="ruc_id" v-model="ruc_id"  placeholder="Ruc" value="{{$empresa->empr_ruc}}">
    </div>
  </div>


  <div class="form-group">
    <label for="inputAddress">Direccion</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="Direccion" name="direccion" value="{{$empresa->empr_direccion}}">
  </div>

  <div class="form-group">
    <label for="inputAddress">Correo</label>
    <input   type="text" class="form-control"   v-model="correo_id"  id="correo_id" placeholder="Email" name="correo" 
    value="{{$empresa->empr_correo}}"  @blur="existeEmail" >
    <span    v-if="encontroEmail" class="alert alert-danger">El correo existe en nuestra base de datos</span>
  </div>


  <div class="form-row">
  
  <div class="form-group col-md-6">
      <label for="inputPassword4">Celular</label>
      <input type="number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==9) return false;" class="form-control" v-model="celular_id" name="celular" id="celular_id" placeholder="Celular" value="{{$empresa->empr_celular}}">
    </div>


    <div class="form-group col-md-6">
      <label for="inputEmail4">Telefono</label>
      <input  type="number" maxlength="9"  class="form-control" name="telefono" id="inputEmail4" placeholder="Telefono" 
      value="{{$empresa->empr_telefono}}">
    </div>


  </div>

 
  <hr>
  <div class="form-group">
    <label for="inputAddress">Contacto</label>
    <input   type="text" class="form-control"   v-model="contacto"  id="contacto" placeholder="Contacto" name="contacto" 
    value="{{$empresa->empr_contacto}}"  >
   </div>


  <button type="submit" class="btn btn-primary">Actualizar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
@section('scripts')
<script>
  const url = '{{ env(MY_URL) }}';
  
</script>
<script src="{{asset('js/frm_empresa.js') }}" ></script>
@endsection